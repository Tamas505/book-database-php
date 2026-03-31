<?php

require "../config/config.php";

$user_id = 1;

$title = trim($_POST['title']);
$author = trim($_POST['author']);
$year = trim($_POST['published_year']);
$description = trim($_POST['description']);

$coverImage = null;

/*
Ha választottak fájlt, elmentjük az uploads/covers mappába.
*/
if (isset($_FILES['cover']) && $_FILES['cover']['error'] === 0) {
    $fileName = time() . "_" . basename($_FILES['cover']['name']);
    $targetPath = "../uploads/covers/" . $fileName;

    move_uploaded_file($_FILES['cover']['tmp_name'], $targetPath);

    $coverImage = "uploads/covers/" . $fileName;
}

/*
Szerveroldali ellenőrzés:
ha a kötelező mezők üresek, leállítjuk a mentést.
*/
if ($title === '' || $author === '' || $year === '') {
    $query = http_build_query([
        'error' => 'missing',
        'title' => $title,
        'author' => $author,
        'published_year' => $year,
        'description' => $description
    ]);

    header("Location: new-book.php?" . $query);
    exit;
}

$sql = "INSERT INTO books (user_id, title, author, published_year, description, cover_image)
        VALUES (:user_id, :title, :author, :year, :description, :cover)";

$stmt = $pdo->prepare($sql);

$stmt->execute([
    ':user_id' => $user_id,
    ':title' => $title,
    ':author' => $author,
    ':year' => $year,
    ':description' => $description,
    ':cover' => $coverImage
]);

$newBookId = $pdo->lastInsertId();

header("Location: ../index.php?id=" . $newBookId);
exit;