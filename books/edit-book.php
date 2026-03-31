<?php
require "../config/config.php";

/*
Az URL-ből kiolvassuk a könyv id-ját.
*/
$id = $_GET['id'] ?? null;

if (!$id) {
    header("Location: ../index.php");
    exit;
}

/*
Lekérjük az adott könyvet.
*/
$sql = "SELECT * FROM books WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute([':id' => $id]);
$book = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$book) {
    header("Location: ../index.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Könyv szerkesztése</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >

    <link rel="stylesheet" href="../assets/css/style.css?v=4">
</head>
<body>

<div class="page-wrapper">
    <main class="app-shell">

        <aside class="sidebar">
            <h2 class="sidebar-title">Könyvek</h2>
        </aside>

        <section class="content-panel">
            <div class="content-header">
                <h1 class="app-title">Könyv szerkesztése</h1>
                <p class="app-subtitle">Itt módosíthatod a kiválasztott könyv adatait.</p>
            </div>

            <form action="update-book.php" method="post" enctype="multipart/form-data" class="edit-form">
                <input type="hidden" name="id" value="<?= htmlspecialchars($book['id']) ?>">

                <div class="mb-3">
                    <label for="title" class="form-label">Cím</label>
                    <input
                        type="text"
                        name="title"
                        id="title"
                        class="form-control"
                        value="<?= htmlspecialchars($book['title']) ?>"
                        required
                    >
                </div>

                <div class="mb-3">
                    <label for="author" class="form-label">Szerző</label>
                    <input
                        type="text"
                        name="author"
                        id="author"
                        class="form-control"
                        value="<?= htmlspecialchars($book['author']) ?>"
                        required
                    >
                </div>

                <div class="mb-3">
                    <label for="published_year" class="form-label">Kiadás éve</label>
                    <input
                        type="number"
                        name="published_year"
                        id="published_year"
                        class="form-control"
                        value="<?= htmlspecialchars($book['published_year']) ?>"
                        required
                    >
                </div>

                <div class="mb-3">
                    <label for="cover_image" class="form-label">Könyv borító</label>
                    <input
                        type="file"
                        name="cover_image"
                        id="cover_image"
                        class="form-control"
                        accept="image/*"
                    >
                </div>

                <?php if (!empty($book['cover_image'])): ?>
    <div class="mb-3">
        <label class="form-label">Jelenlegi borító</label><br>

        <img
            src="../<?= htmlspecialchars($book['cover_image']) ?>"
            alt="Jelenlegi borító"
            class="form-preview-image"
        >

        <div class="form-check mt-2">
            <input
                class="form-check-input"
                type="checkbox"
                name="delete_cover"
                id="delete_cover"
                value="1"
            >
            <label class="form-check-label" for="delete_cover">
                Borító törlése
            </label>
        </div>
    </div>
<?php endif; ?>

                <div class="mb-3">
                    <label for="description" class="form-label">Leírás</label>
                    <textarea
                        name="description"
                        id="description"
                        class="form-control"
                        rows="7"
                    ><?= htmlspecialchars($book['description']) ?></textarea>
                </div>

                <div class="d-flex gap-2 mt-4">
                    <button type="submit" class="btn btn-book">Mentés</button>
                    <a href="../index.php?id=<?= htmlspecialchars($book['id']) ?>" class="btn btn-secondary">Mégse</a>
                </div>
            </form>
        </section>

    </main>

    <footer>
        <p>© 2026 Könyvtáram</p>
    </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>