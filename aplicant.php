<?php
include('db.php');
?>

<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <title>Detalii Aplicant</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="taskbar">
    <div class="titlu">EASY-JOBS</div>
    <div style="display: flex; justify-content: flex-end;">
        <form action="index.php" method="get">
            <button type="submit" class="btn-home" title="Pagina principală">Acasă</button>
        </form>
    </div>
</div>

<?php
if (isset($_GET['id'])) {
    $id_aplicant = $_GET['id'];

    $stmt = $conn->prepare("
        SELECT a.nume, a.prenume, a.email, a.CNP, a.telefon, ad.oras, a.cv_link
        FROM aplicanti a
        JOIN adrese ad ON a.id_adresa = ad.id_adresa
        WHERE a.id_aplicant = ?");
    $stmt->bind_param("i", $id_aplicant);
    $stmt->execute();
    $stmt->bind_result($nume, $prenume, $email, $cnp, $telefon, $oras, $cv_link);
    $stmt->fetch();
    $stmt->close();
?>

<div align="center">
    <h1><?php echo "$nume $prenume"; ?></h1>
    <p><strong>Email:</strong> <?php echo htmlspecialchars($email); ?></p>
    <?php if ($cnp) echo "<p><strong>CNP:</strong> " . htmlspecialchars($cnp) . "</p>"; ?>
    <?php if ($telefon) echo "<p><strong>Telefon:</strong> " . htmlspecialchars($telefon) . "</p>"; ?>
    <?php if ($oras) echo "<p><strong>Oraș:</strong> " . htmlspecialchars($oras) . "</p>"; ?>
    <?php if ($cv_link) echo "<p><strong>CV:</strong> <a href='" . htmlspecialchars($cv_link) . "' target='_blank'>Deschide CV</a></p>"; ?>
</div>

<hr>

<div class="container" style="padding: 20px;">
    <h2>Aplicații ale aplicantului</h2>

    <form method="get" action="">
        <input type="hidden" name="id" value="<?php echo $id_aplicant; ?>">
        <label for="filtru">Filtru după status:</label>
        <select name="filtru" id="filtru" onchange="this.form.submit()">
            <option value="">Toate</option>
            <?php
            $res = $conn->query("SELECT id_status, denumire FROM status_aplicare");
            while ($row = $res->fetch_assoc()) {
                $selected = (isset($_GET['filtru']) && $_GET['filtru'] == $row['id_status']) ? 'selected' : '';
                echo "<option value='{$row['id_status']}' $selected>" . htmlspecialchars($row['denumire']) . "</option>";
            }
            ?>
        </select>
    </form>

    <table border="1" cellpadding="10">
        <tr>
            <th>Job</th>
            <th>Data aplicare</th>
            <th>Status</th>
        </tr>
<?php
    $filtru = isset($_GET['filtru']) ? $_GET['filtru'] : '';

    if ($filtru !== "") {
        $stmt = $conn->prepare("
            SELECT j.titlu, a.data_aplicare, sa.denumire
            FROM aplicari a
            JOIN joburi j ON a.id_job = j.id_job
            JOIN status_aplicare sa ON a.id_status = sa.id_status
            WHERE a.id_aplicant = ? AND a.id_status = ?");
        $stmt->bind_param("ii", $id_aplicant, $filtru);
    } else {
        $stmt = $conn->prepare("
            SELECT j.titlu, a.data_aplicare, sa.denumire
            FROM aplicari a
            JOIN joburi j ON a.id_job = j.id_job
            JOIN status_aplicare sa ON a.id_status = sa.id_status
            WHERE a.id_aplicant = ?");
        $stmt->bind_param("i", $id_aplicant);
    }

    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>" . htmlspecialchars($row['titlu']) . "</td>
            <td>" . htmlspecialchars($row['data_aplicare']) . "</td>
            <td>" . htmlspecialchars($row['denumire']) . "</td>
        </tr>";
    }
    $stmt->close();
?>
    </table>
</div>

<hr>

<div class="container" style="padding: 20px;">
    <h2>Competențe</h2>
    <table border="1" cellpadding="10">
        <tr>
            <th>Nume competență</th>
            <th>Nivel</th>
            <th>Ani experiență</th>
            <th>Studii</th>
            <th>Certificare</th>
        </tr>
<?php
    $stmt = $conn->prepare("
        SELECT c.nume_competenta, nc.denumire AS nivel, c.ani_experienta,
               ns.denumire AS studii, ca.certificare
        FROM competente_aplicanti ca
        JOIN competente c ON ca.id_competenta = c.id_competenta
        JOIN nivel_competenta nc ON c.id_nivel_competenta = nc.id_nivel_competenta
        JOIN nivel_studii ns ON c.id_nivel_studii = ns.id_nivel_studii
        WHERE ca.id_aplicant = ?");
    $stmt->bind_param("i", $id_aplicant);
    $stmt->execute();
    $result = $stmt->get_result();

    while ($row = $result->fetch_assoc()) {
        $certificare = ($row['certificare'] == 1) ? 'da' : 'nu';
        echo "<tr>
            <td>" . htmlspecialchars($row['nume_competenta']) . "</td>
            <td>" . htmlspecialchars($row['nivel']) . "</td>
            <td>" . htmlspecialchars($row['ani_experienta']) . "</td>
            <td>" . htmlspecialchars($row['studii']) . "</td>
            <td>" . $certificare . "</td>
        </tr>";
    }
    $stmt->close();
?>

    </table>
</div>

<?php } else { ?>
    <div align="center"><h2>ID-ul aplicantului nu a fost specificat.</h2></div>
<?php } ?>

</body>
</html>
