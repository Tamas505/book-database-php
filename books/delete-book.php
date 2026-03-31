<?php

require "../config/config.php";

$id = $_GET['id'];

$sql = "DELETE FROM books WHERE id = :id";

$stmt = $pdo->prepare($sql);

$stmt->execute([
    ':id' => $id
]);

header("Location: ../index.php");
exit;