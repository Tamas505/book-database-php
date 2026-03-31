1 Mi a cél?
--------------------------------------------------------------------------
A PHP-nak kapcsolódnia kell az adatbázishoz.

Ehhez 4 információ kell:

adatbázis szerver
adatbázis neve
felhasználó
jelszó

XAMPP esetén ezek:

localhost
bookdb
root
(nincs jelszó)

--------------------------------------------------------------------------
2 Változók létrehozása

$host = "localhost";
$dbname = "bookdb";
$username = "root";
$password = "";


--------------------------------------------------------------------------

3 Adatbázis kapcsolat létrehozása

(PHP-ban az egyik modern megoldás a PDO.)


$pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);

-- A $pdo változóban fogjuk tárolni az adatbázis kapcsolat objektumát.
    new PDO(...)= új adatbázis kapcsolat létrehozása.

-- "mysql:host=$host;dbname=$dbname;charset=utf8mb4"
    Ez az úgynevezett DSN (Data Source Name). Ez mondja meg: milyen adatbázishoz hol milyen kódolással kapcsolódjunk.

Jelentése: Hozz létre egy új PDO adatbázis kapcsolatot a MySQL szerverhez, a localhost címen, a bookdb adatbázishoz, utf8mb4 karakterkódolással, a root felhasználóval. És ezt a kapcsolatot tárold a $pdo változóban.


--------------------------------------------------------------------------

4 Hibakezelés

Ha az adatbázis nem érhető el, a program ne omoljon össze.

Ezért tesszük try-catch blokkba.

try {

} catch (PDOException $e) {

}

------------------------------------------------------------------------
5 A teljes logika

A négy lépés összerakva

<?php

$host = "localhost";
$dbname = "bookdb";
$username = "root";
$password = "";

try {

    $pdo = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
        $username,
        $password
    );

    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch (PDOException $e) {

    die("Adatbázis kapcsolódási hiba: " . $e->getMessage());

}
