<?php
require "../config/config.php";
?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Új könyv hozzáadása</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >

    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>

    <div class="page-wrapper">
<main class="app-shell">

<aside class="sidebar">
    <div class="sidebar-header">
        <h2 class="sidebar-title">Könyvek</h2>
    </div>
</aside>

<section class="content-panel">
    <h1 class="mb-4">Új könyv hozzáadása</h1>
    
    <?php if (isset($_GET['error']) && $_GET['error'] === 'missing'): ?>
    <div class="alert alert-danger">
        A cím, a szerző és a kiadás éve kötelező mezők.
    </div>
<?php endif; ?>

    <a href="../index.php" class="btn btn-secondary mb-3">← Vissza</a>

    <form action="add-book.php" method="post" enctype="multipart/form-data">

        <div class="mb-3">
            <label for="title" class="form-label">Cím</label>
            <input 
                type="text" 
                name="title" 
                id="title" 
                class="form-control"
                value="<?= htmlspecialchars($_GET['title'] ?? '') ?>"
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
                value="<?= htmlspecialchars($_GET['author'] ?? '') ?>"
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
                value="<?= htmlspecialchars($_GET['published_year'] ?? '') ?>"
                required
>
        </div>

        <div class="mb-3">
           
            <div class="mb-3">
                <label for="cover" class="form-label">Könyv borító</label>
                 <input type="file" name="cover" id="cover" class="form-control" accept="image/*">
            </div>
             <label for="description" class="form-label">Leírás</label>
            <textarea 
                name="description" 
                id="description" 
                class="form-control" 
                rows="5"
            ><?= htmlspecialchars($_GET['description'] ?? '') ?></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Mentés</button>

    </form>
    </section>

</main>

<footer>
    <p>© 2026 Könyvtáram - Kőműves Tamás</p>
</footer>

</div>
</div>

</body>
</html>