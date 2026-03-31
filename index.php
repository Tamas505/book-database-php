<?php
require "config/config.php";

/*
Oldalanként ennyi könyvet jelenítünk meg.
*/
$limit = 10;

/*
Aktuális oldalszám az URL-ből.
Ha nincs megadva, akkor 1.
*/
$page = isset($_GET['page']) ? (int) $_GET['page'] : 1;

if ($page < 1) {
    $page = 1;
}

/*
Kiszámoljuk, honnan induljon a lekérdezés.
*/
$offset = ($page - 1) * $limit;

/*
Lekérjük az összes könyv számát.
*/
$countSql = "SELECT COUNT(*) FROM books";
$countStmt = $pdo->query($countSql);
$totalBooks = $countStmt->fetchColumn();

/*
Összes oldalszám.
*/
$totalPages = ceil($totalBooks / $limit);

/*
Lekérjük csak az aktuális oldal könyveit.
*/
$sql = "SELECT * FROM books ORDER BY id ASC LIMIT :limit OFFSET :offset";
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
$stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
$stmt->execute();

$books = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo "Ezen az oldalon lekért könyvek száma: " . count($books);
/*
Az URL-ből kiolvassuk a kiválasztott könyv id-ját.
Példa: index.php?id=2
Ha nincs ilyen paraméter, akkor null lesz.
*/
$selectedId = $_GET['id'] ?? null;

/*
Alapértelmezetten az első könyvet választjuk ki.
Ha nincs könyv, akkor null lesz.
*/
$selectedBook = $books[0] ?? null;

/*
Ha van kiválasztott id az URL-ben,
akkor megkeressük a hozzá tartozó könyvet.
*/
if ($selectedId !== null) {
    foreach ($books as $book) {
        if ($book['id'] == $selectedId) {
            $selectedBook = $book;
            break;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Könyvtáram</title>

    <!-- Bootstrap CSS -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Saját CSS -->
    <link rel="stylesheet" href="assets/css/style.css?v=2">
    
</head>
<body>

    <div class="page-wrapper">
        <main class="app-shell">

            <aside class="sidebar">
                <div class="sidebar-header">
                    <h2 class="sidebar-title">Könyvek</h2>

                    <input
                        type="text"
                        class="form-control search-input"
                        placeholder="Keresés..."
                    >

                    <a href="books/new-book.php" class="btn btn-book mt-3">+ Új könyv</a>
                </div>

                <div class="book-list">

                <?php foreach ($books as $book): ?>
                    <a 
                        href="index.php?id=<?= $book['id'] ?>&page=<?= $page ?>" 
                            class="book-item <?= ($selectedBook && $selectedBook['id'] == $book['id']) ? 'active' : '' ?>"
>
                        <div class="book-item-title">
                            <?= htmlspecialchars($book['title']) ?>
                        </div>

                        <div class="book-item-meta">
                            <?= htmlspecialchars($book['author']) ?> · <?= htmlspecialchars($book['published_year']) ?>
                        </div>
                    </a>
                <?php endforeach; ?>

            </div>
                      <div class="pagination-controls mt-3">
    <?php if ($page > 1): ?>
        <a href="index.php?page=<?= $page - 1 ?>" class="btn btn-sm btn-book">Előző</a>
    <?php endif; ?>

    <?php if ($page < $totalPages): ?>
        <a href="index.php?page=<?= $page + 1 ?>" class="btn btn-sm btn-book">Következő</a>
    <?php endif; ?>
</div>  

            </aside>

            <section class="content-panel">
                <div class="content-header">
                    <h1 class="app-title">Könyvtáram</h1>
                    <p class="app-subtitle">Könyv adatbázis és jegyzetek</p>
                </div>

                <div class="book-details">
    <div class="row g-4 align-items-start">

        <div class="col-md-4">
            <div class="book-cover-wrap">
                <?php if ($selectedBook && !empty($selectedBook['cover_image'])): ?>
                    <img 
                        src="<?= htmlspecialchars($selectedBook['cover_image']) ?>" 
                        alt="Könyv borító"
                        class="book-cover"
                    >
                <?php else: ?>
                    <div class="book-cover-placeholder">
                        <div class="book-cover-icon">📖</div>
                        <div class="book-cover-text">Nincs borító</div>
                    </div>
                <?php endif; ?>
            </div>
        </div>

        <div class="col-md-8">
    <div class="book-meta">
        <div class="detail-label">Cím</div>
        <div class="detail-value">
            <?= $selectedBook ? htmlspecialchars($selectedBook['title']) : 'Nincs kiválasztott könyv' ?>
        </div>

        <div class="detail-label">Szerző</div>
        <div class="detail-value">
            <?= $selectedBook ? htmlspecialchars($selectedBook['author']) : 'Nincs kiválasztott szerző' ?>
        </div>

        <div class="detail-label">Kiadás éve</div>
        <div class="detail-value">
            <?= $selectedBook ? htmlspecialchars($selectedBook['published_year']) : 'Nincs kiválasztott kiadás éve' ?>
        </div>
    </div>
    
</div>
<div class="detail-block mt-4">
    <div class="detail-label">Leírás</div>
    <div class="book-description">
        <?= $selectedBook ? htmlspecialchars($selectedBook['description']) : 'Nincs még könyv az adatbázisban.' ?>
    </div>
</div>

<?php if ($selectedBook): ?>
    <div class="action-buttons mt-4">
        <a href="books/edit-book.php?id=<?= $selectedBook['id'] ?>" class="btn btn-soft">Szerkeszt</a>
        <a 
            href="books/delete-book.php?id=<?= $selectedBook['id'] ?>" 
            class="btn btn-danger-soft"
            onclick="return confirm('Biztosan törölni szeretnéd ezt a könyvet?')"
        >Törlés</a>
    </div>
<?php endif; ?>
    </div>
</div>
            </section>

        </main>

        <footer>
            <p>© 2026 Könyvtáram</p>
        </footer>
    </div>

    <!-- Bootstrap JS -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

    <!-- Saját JS -->
    <script src="assets/js/script.js?v=2"></script>
    
</body>
</html>