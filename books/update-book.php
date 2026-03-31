<?php
require "../config/config.php";

/*
A formból megkapjuk a könyv adatait.
*/
$id = $_POST['id'] ?? null;
$title = trim($_POST['title'] ?? '');
$author = trim($_POST['author'] ?? '');
$year = trim($_POST['published_year'] ?? '');
$description = trim($_POST['description'] ?? '');

/*
Lekérjük a jelenlegi könyvet, hogy tudjuk a régi borító útvonalát.
*/
$sql = "SELECT * FROM books WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute([':id' => $id]);
$book = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$book) {
    header("Location: ../index.php");
    exit;
}

/*
Alapból marad a régi borító.
*/
$coverImage = $book['cover_image'];

/*
Ha a felhasználó bepipálta a borító törlését,
akkor null-ra állítjuk.
*/
if (isset($_POST['delete_cover']) && $_POST['delete_cover'] == '1') {
    $coverImage = null;
}

/*
Ha töltöttek fel új képet, feldolgozzuk.
*/
if (isset($_FILES['cover_image']) && $_FILES['cover_image']['error'] === 0) {
    $uploadDir = "../uploads/covers/";

    /*
    Ha a mappa nem létezik, létrehozzuk.
    */
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $tmpName = $_FILES['cover_image']['tmp_name'];
    $originalName = $_FILES['cover_image']['name'];

    /*
    Kinyerjük a fájl kiterjesztését.
    */
    $extension = strtolower(pathinfo($originalName, PATHINFO_EXTENSION));

    /*
    Engedélyezett képformátumok.
    */
    $allowedExtensions = ['jpg', 'jpeg', 'png', 'webp'];

    if (in_array($extension, $allowedExtensions)) {
        /*
        Egyedi fájlnevet készítünk.
        */
        $newFileName = uniqid('cover_', true) . '.' . $extension;

        $destination = $uploadDir . $newFileName;

        /*
        Átmozgatjuk a képet a végleges helyére.
        */
        if (move_uploaded_file($tmpName, $destination)) {
            /*
            Az adatbázisba mentendő relatív útvonal.
            */
            $coverImage = "uploads/covers/" . $newFileName;
        }
    }
}

/*
Frissítjük az adott könyv adatait az adatbázisban.
*/
$sql = "UPDATE books
        SET title = :title,
            author = :author,
            published_year = :year,
            description = :description,
            cover_image = :cover_image
        WHERE id = :id";

$stmt = $pdo->prepare($sql);

$stmt->execute([
    ':title' => $title,
    ':author' => $author,
    ':year' => $year,
    ':description' => $description,
    ':cover_image' => $coverImage,
    ':id' => $id
]);

header("Location: ../index.php?id=" . $id);
exit;