<?php

require "../config/config.php";

$sql = "SELECT * FROM books";

$stmt = $pdo->query($sql);

$books = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($books as $book) {
    echo "<h3>" . $book['title'] . "</h3>";
    echo "Szerző: " . $book['author'] . "<br>";
    echo "Kiadás éve: " . $book['published_year'] . "<br>";
    echo "<hr>";
}