<?php
include('db.php');
?>

<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <title>Companie</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="taskbar">
        <div class="titlu">EASY-JOBS</div>
        <div style="display: flex; justify-content: flex-end;">
            <form action="index.php" method="get">
                <button type="submit" class="btn-home" title="Pagina principală">
                    <svg xmlns="http://www.w3.org/2000/svg" version="1.1" id="Capa_1" viewBox="0 0 495.398 495.398" xml:space="preserve">
                    <g>
                        <g>
                        <g>
                            <path d="M487.083,225.514l-75.08-75.08V63.704c0-15.682-12.708-28.391-28.413-28.391c-15.669,0-28.377,12.709-28.377,28.391v29.941L299.31,37.74c-27.639-27.624-75.694-27.575-103.27,0.05L8.312,225.514c-11.082,11.104-11.082,29.071,0,40.158c11.087,11.101,29.089,11.101,40.172,0l187.71-187.729c6.115-6.083,16.893-6.083,22.976-0.018l187.742,187.747c5.567,5.551,12.825,8.312,20.081,8.312c7.271,0,14.541-2.764,20.091-8.312C498.17,254.586,498.17,236.619,487.083,225.514z"/>
                            <path d="M257.561,131.836c-5.454-5.451-14.285-5.451-19.723,0L72.712,296.913c-2.607,2.606-4.085,6.164-4.085,9.877v120.401c0,28.253,22.908,51.16,51.16,51.16h81.754v-126.61h92.299v126.61h81.755c28.251,0,51.159-22.907,51.159-51.159V306.79c0-3.713-1.465-7.271-4.085-9.877L257.561,131.836z"/>
                        </g>
                        </g>
                    </g>
                    </svg>
                    </button>
            </form>
        </div>
    </div>

    <div>
        <?php
        if (isset($_GET['nume'])) {
            $nume_companie = $_GET['nume'];
            $stmt = $conn->prepare("SELECT descriere, id_companie FROM companii WHERE nume = ?");
            $stmt->bind_param("s", $nume_companie);
            $stmt->execute();
            $stmt->bind_result($descriere, $id_companie);
            $stmt->fetch();
            $stmt->close();

            echo "<h1>Bine ai venit la compania <strong>" . htmlspecialchars($nume_companie) . "</strong></h1>";
            if ($descriere)
                echo "<h2>" . htmlspecialchars($descriere) . "<br>Mai jos vezi posturile disponibile!</h2>";

            $stmt = $conn->prepare("
                SELECT DISTINCT d.nume
                FROM joburi j
                JOIN departamente d ON j.id_departament = d.id_departament
                WHERE j.id_companie = ? AND j.status = 1");
            $stmt->bind_param("i", $id_companie);
            $stmt->execute();
            $res = $stmt->get_result();
            $departamente = [];
            while ($row = $res->fetch_assoc()) {
                $departamente[] = $row['nume'];
            }
            $stmt->close();
        } else {
            echo "<h1>*Acesta este un secret.. Shh. Nu mai spune la nimeni și întoarce-te pe index...</h1>";
            exit;
        }
        ?>
    </div>

    <div>
        <table border="1">
            <tr>
                <th>Titlu</th>
                <th>Departament</th>
                <th>Descriere</th>
                <th>Locuri Valabile</th>
            </tr>
            <?php
            $stmt = $conn->prepare("
                SELECT j.titlu, d.nume AS departament, j.descriere, j.locuri_valabile
                FROM joburi j
                JOIN departamente d ON j.id_departament = d.id_departament
                WHERE j.id_companie = ? AND j.status = 1
                ORDER BY j.locuri_valabile DESC
            ");
            $stmt->bind_param("i", $id_companie);
            $stmt->execute();
            $res = $stmt->get_result();
            while ($row = $res->fetch_assoc()) {
                echo "<tr>
                    <td>" . htmlspecialchars($row['titlu']) . "</td>
                    <td>" . htmlspecialchars($row['departament']) . "</td>
                    <td>" . htmlspecialchars($row['descriere']) . "</td>
                    <td>" . htmlspecialchars($row['locuri_valabile']) . "</td>
                </tr>";
            }
            $stmt->close();
            ?>
        </table>
    </div>

    <?php
    $stmt = $conn->prepare("
        SELECT 
            SUM(CASE WHEN a.id_status = 2 THEN 1 ELSE 0 END) AS acceptati,
            SUM(CASE WHEN a.id_status = 1 THEN 1 ELSE 0 END) AS incurs,
            SUM(CASE WHEN a.id_status = 3 THEN 1 ELSE 0 END) AS respinsi
        FROM aplicari a
        JOIN joburi j ON a.id_job = j.id_job
        WHERE j.id_companie = ?");
    $stmt->bind_param("i", $id_companie);
    $stmt->execute();
    $stmt->bind_result($acc, $curs, $resp);
    $stmt->fetch();
    $total = $acc + $curs + $resp;
    $stmt->close();

    echo "<h2>Aplicații primite: $total &mdash; Acceptați: $acc, În curs: $curs</h2>";
    if (!empty($departamente)) {
        echo "<h2>Se angajează în: " . implode(', ', array_map('htmlspecialchars', $departamente)) . ".</h2>";
    }
    ?>

    <h2>Aplicanții companiei <?php echo htmlspecialchars($nume_companie); ?>:</h2>

    <form method="get" action="">
        <input type="hidden" name="nume" value="<?php echo htmlspecialchars($nume_companie); ?>">
        <label for="filtru">Filtru status:</label>
        <select name="filtru" id="filtru" onchange="this.form.submit()">
            <option value="">Toți</option>
            <?php
            $res = $conn->query("SELECT id_status, denumire FROM status_aplicare");
            while ($row = $res->fetch_assoc()) {
                $selected = (isset($_GET['filtru']) && $_GET['filtru'] == $row['id_status']) ? 'selected' : '';
                echo "<option value='" . $row['id_status'] . "' $selected>" . htmlspecialchars($row['denumire']) . "</option>";
            }
            ?>
        </select>
    </form>

    <div>
        <table border="1">
            <tr>
                <th>Nume</th>
                <th>Prenume</th>
                <th>Titlu Job</th>
                <th>Status</th>
                <th>Profil</th>
            </tr>
            <?php
            $filtru = isset($_GET['filtru']) ? $_GET['filtru'] : '';
            if ($filtru !== "") {
                $stmt = $conn->prepare("
                    SELECT ap.id_aplicant, ap.nume, ap.prenume, j.titlu, sa.denumire
                    FROM aplicari a
                    JOIN aplicanti ap ON a.id_aplicant = ap.id_aplicant
                    JOIN joburi j ON a.id_job = j.id_job
                    JOIN status_aplicare sa ON a.id_status = sa.id_status
                    WHERE j.id_companie = ? AND a.id_status = ?");
                $stmt->bind_param("ii", $id_companie, $filtru);
            } else {
                $stmt = $conn->prepare("
                    SELECT ap.id_aplicant, ap.nume, ap.prenume, j.titlu, sa.denumire
                    FROM aplicari a
                    JOIN aplicanti ap ON a.id_aplicant = ap.id_aplicant
                    JOIN joburi j ON a.id_job = j.id_job
                    JOIN status_aplicare sa ON a.id_status = sa.id_status
                    WHERE j.id_companie = ?");
                $stmt->bind_param("i", $id_companie);
            }
            $stmt->execute();
            $res = $stmt->get_result();
            while ($row = $res->fetch_assoc()) {
                $link = "aplicant.php?id=" . urlencode($row['id_aplicant']);
                echo "<tr>
                    <td><a href='$link'>" . htmlspecialchars($row['nume']) . "</a></td>
                    <td>" . htmlspecialchars($row['prenume']) . "</td>
                    <td>" . htmlspecialchars($row['titlu']) . "</td>
                    <td>" . htmlspecialchars($row['denumire']) . "</td>
                    <td><a href='$link'>Profil</a></td>
                </tr>";
            }
            ?>
        </table>
    </div>
</body>
</html>
