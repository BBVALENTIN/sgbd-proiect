<?php
session_start();
include('db.php');

$oras_filter = "";
$op = isset($_GET['op']) ? $_GET['op'] : "";

if ($op == "" && isset($_GET['oras']) && !empty(trim($_GET['oras']))) {
    $oras_filter = trim($_GET['oras']);
    $stmt = $conn->prepare("SELECT c.*, a.oras FROM companii c JOIN adrese a ON c.id_adresa = a.id_adresa WHERE a.oras LIKE ?");
    $like_param = "%" . $oras_filter . "%";
    $stmt->bind_param("s", $like_param);
    $stmt->execute();
    $result = $stmt->get_result();
} elseif ($op == "") {
    $sql = "SELECT c.*, a.oras FROM companii c JOIN adrese a ON c.id_adresa = a.id_adresa";
    $result = $conn->query($sql);
}
?>

<!DOCTYPE html>
<html lang="ro">
<head>
    <title>Joburi</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="taskbar">
        <div class="titlu">EASY-JOBS</div>
    </div>

    <form method="GET" action="index.php">
        <label for="oras">Caută după oraș:</label>
        <input type="text" id="oras" name="oras" value="<?php echo htmlspecialchars($oras_filter); ?>" placeholder="Introdu orașul">
        <button type="submit">Caută</button>
        <a href="index.php"><button type="button">Vezi companiile</button></a>
        <button type="submit" name="op" value="Toti utilizatorii site-ului">Toti utilizatorii site-ului</button>
        <button type="submit" name="op" value="Joburi fara aplicatii">Joburi fara aplicatii</button>
        <button type="submit" name="op" value="Companii mai vechi de 10 ani">Companii mai vechi de 10 ani</button>
        <button type="submit" name="op" value="Salariu oferit pe job">Salariu oferit pe job</button>
        <button type="submit" name="op" value="Joburi + Companii">Joburi + Companii</button>
        <button type="submit" name="op" value="Joburi peste 5000 RON">Joburi peste 5000 RON</button>
        <button type="submit" name="op" value="Joburi cu aplicatii">Joburi cu aplicatii</button>
        <button type="submit" name="op" value="Joburi medii platite din Cluj-napoca">Joburi medii platite din Cluj-Napoca</button>
        <button type="submit" name="op" value="Companii+email">Companii+email</button>


        
    </form>

    <?php
    if ($op != "") {
        echo "<h2>Rezultat pentru operația: " . htmlspecialchars($op) . "</h2><div id='container'><table border='1'><tr>";
        switch ($op) {
            case 'Toti utilizatorii site-ului':
                $sql = "(SELECT nume, email FROM companii)
                        UNION
                        (SELECT nume, email FROM aplicanti)";
                break; 

            case 'Joburi fara aplicatii':
                $sql = "SELECT j.titlu, c.nume AS companie
                        FROM joburi j
                        JOIN companii c ON j.id_companie = c.id_companie
                        WHERE j.id_job NOT IN (
                            SELECT id_job FROM aplicari
                        )";
                break; 

            case 'Companii mai vechi de 10 ani':
                $sql = "SELECT nume, email, vechime FROM companii WHERE vechime > 10";
                break; 

            case 'Salariu oferit pe job':
                $sql = "SELECT j.titlu, c.nume AS companie, co.salariu FROM contracte co
                        JOIN joburi j ON co.id_job = j.id_job
                        JOIN companii c ON j.id_companie = c.id_companie";
                break; 

            case 'Joburi + Companii':
                $sql = "SELECT j.titlu, c.nume AS companie, j.locuri_valabile
                        FROM joburi j
                        JOIN companii c ON j.id_companie = c.id_companie";
                break; 

            case 'Joburi peste 5000 RON':
                $sql = "SELECT 
                            ap.nume AS NumeAplicant,
                            ap.prenume AS PrenumeAplicant,
                            ap.email AS EmailAplicant,
                            job_salariu_mare.titlu AS JobAplicat,
                            c.nume AS CompanieJob,
                            adr.oras AS OrasCompanie
                        FROM
                            (
                                SELECT
                                    j.id_job,
                                    j.titlu,
                                    j.id_companie
                                FROM
                                    joburi j
                                JOIN
                                    contracte co ON j.id_job = co.id_job
                                WHERE
                                    co.salariu > 4000
                            ) AS job_salariu_mare
                        JOIN
                            aplicari apl ON job_salariu_mare.id_job = apl.id_job
                        JOIN
                            aplicanti ap ON apl.id_aplicant = ap.id_aplicant
                        JOIN
                            companii c ON job_salariu_mare.id_companie = c.id_companie
                        JOIN
                            adrese adr ON c.id_adresa = adr.id_adresa
                        WHERE
                            adr.oras = 'Cluj-Napoca';";
                break; 

            case 'Joburi cu aplicatii':
                $sql = "SELECT
                                job_cu_aplicatii.titlu AS TitluJob,
                                c.nume AS NumeCompanie,
                                c.vechime AS VechimeCompanie
                            FROM
                                (
                                    SELECT
                                        j.id_job,
                                        j.titlu,
                                        j.id_companie
                                    FROM
                                        joburi j
                                    WHERE
                                        j.id_job IN (SELECT id_job FROM aplicari)
                                ) AS job_cu_aplicatii
                            JOIN
                                companii c ON job_cu_aplicatii.id_companie = c.id_companie
                            WHERE
                                c.vechime > 5";
                break; 
            case 'Companii+email':
                $sql = "SELECT nume, email from companii";
                break;


            default:
                $sql = "";
        }

        if (!empty($sql)) {
            $res = $conn->query($sql);
            if ($res && $res->num_rows > 0) {
                $fields = $res->fetch_fields();
                foreach ($fields as $field) {
                    echo "<th>" . htmlspecialchars($field->name) . "</th>";
                }
                echo "</tr>";
                while ($row = $res->fetch_assoc()) {
                    echo "<tr>";
                    foreach ($row as $cell) {
                        echo "<td>" . htmlspecialchars($cell) . "</td>";
                    }
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='10'>Niciun rezultat.</td></tr>";
            }
            echo "</table></div>";
        }
    }
    ?>

    <?php if ($op == ""): ?>
    <div id="container">
        <table border="1">
            <tr>
                <th>Nume</th>
                <th>Email</th>
                <th>Telefon</th>
                <th>Locație</th>
                <th>Vechime</th>
                <th>Acțiune</th>
            </tr>
            <?php
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $departament = htmlspecialchars($row['nume']);
                    $link = "firme.php?nume=" . urlencode($departament);
                    echo "<tr>
                        <td><a href='$link'>" . $row['nume'] . "</a></td>
                        <td>" . $row['email'] . "</td>
                        <td>" . $row['telefon'] . "</td>
                        <td>" . $row['oras'] . "</td>
                        <td>" . $row['vechime'] . "</td>
                        <td>
                            <form method='POST' action='sterge.php' onsubmit='return confirm(\"Sigur vrei să ștergi?\")'>
                                <input type='hidden' name='id_companie' value='" . $row['id_companie'] . "'>
                                <input type='submit' value='Șterge'>
                            </form>
                        </td>
                    </tr>";
                }
            } else {
                echo "<tr><td colspan='6'>Nu sunt companii disponibile.</td></tr>";
            }
            ?>
        </table>
    </div>
    <?php endif; ?>

</body>
</html>
<?php $conn->close(); ?>
