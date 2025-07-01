<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_companie'])) {
    include 'db.php';

    $id = $_POST['id_companie'];

    $stmt = $conn->prepare("DELETE FROM companii WHERE id_companie = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    header("Location: index.php");
    exit();
}
?>
