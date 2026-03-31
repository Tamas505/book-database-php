-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Már 31. 07:46
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `bookdb`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL COMMENT 'Elsődleges kulcs',
  `user_id` int(11) NOT NULL COMMENT 'Melyik felh. tartozik',
  `title` varchar(255) NOT NULL COMMENT 'Könyv címe',
  `author` varchar(150) NOT NULL COMMENT 'Szerző',
  `published_year` int(4) NOT NULL COMMENT 'Kiadás éve',
  `description` text NOT NULL COMMENT 'Leírás',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Létrehozás ideje',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Módosítás ideje',
  `cover_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `books`
--

INSERT INTO `books` (`id`, `user_id`, `title`, `author`, `published_year`, `description`, `created_at`, `updated_at`, `cover_image`) VALUES
(15, 1, 'Léghajó', 'Kőműves Tamás', 2021, 'A Mexikói-öböl felett egy hőlégballont sodor a szél, mindössze egyetlen utasa van, Louis Hugo, aki akarata ellenére került a gondolába. Eszméletlen volt, amikor a hajót magával ragadta a vihar, és csak ködös emlékképei vannak arról, hogy mi történt vele indulás előtt. Szerencsére üzemanyag van elégséges, de irányítani már képtelen az elszabadult szerkezetet. Az elemek játékszerévé válik, és ahogyan az idő telik, Louis úgy döbben rá arra, hogy eddig az élete is pontosan úgy hánykolódott, mint az elszabadult léghajó. Csigalassúsággal követik egymást a kényszerből ébren töltött órák, nem alhat el, mert akkor a vízbe zuhan, ami biztos halál lenne. Élete elfeledettnek hitt pillanatai bukkannak elő sorra, gyermekkorától egészen a közelmúltig, és mire feltűnnek Mexikó partjai, már arra is rájön, hogy miért kapta a sorstól ezt az embert próbáló utazást.', '2026-03-14 16:36:14', '2026-03-14 17:03:01', 'uploads/covers/cover_69b594c5f1f8a4.83120166.jpg'),
(28, 1, 'Replay', 'Nemere István', 2026, 'Az éjszaka csendjét villámok tépik szét.\r\nEgy hegyek közé zárt völgyben valami megmozdul - valami, ami nem tartozik ide.\r\n\r\nEgy idegen bukkan fel a semmiből.\r\nEgy újságíró szemtanúja lesz a lehetetlennek.\r\n\r\nA világ közben nyugtalan jelektől zsong: óriási test sodródik partra, fehér hajú alakok tűnnek fel a semmiből, és titokzatos üzenet száguld át a csillagokon.\r\n\r\nValami közeledik. Valami, ami mindent megváltoztat.\r\nA valóság repedezni kezdett.\r\n\r\nA kérdés csak ennyi: barát jön, vagy ellenség? Béke vagy pusztulás?\r\n\r\nReplay - egy sodró erejű történet a félelemről, a bizalomról és a legnagyobb titokról, amit az emberiség valaha megismert.', '2026-03-14 17:07:00', '2026-03-14 17:07:00', 'uploads/covers/1773508020_4952210-forced_bg300-forced_bg450.jpg'),
(29, 1, 'Titkok titka', 'Dan Brown', 2025, 'A világ leghíresebb thrillerszerzője új, lenyűgöző regénnyel tér vissza – egy lendületes, fordulatos, gondolatébresztő mesterművel, amely úgy szórakoztatja az olvasókat, ahogy arra csak Dan Brown képes.\r\n\r\nRobert Langdon, a szimbolika professzora Prágába utazik, hogy részt vegyen egy meglepő előadáson, amelyet az a neves noétikus kutató, Katherine Solomon tart, akivel nemrég kezdett romantikus kapcsolatot. Katherine egy különleges könyv megjelentetésének küszöbén áll, amely forradalmi tudományos felfedezéseket ismertet az emberi tudat természetével kapcsolatban… és ezek a felismerések a több évszázados, beágyazott hitrendszerek szétrombolásával fenyegetnek.\r\n\r\nAmikor egy brutális gyilkosság káoszba taszítja az egész utazást, Katherine hirtelen eltűnik, a kézirata pedig megsemmisül. Langdon kétségbeesetten próbálja megtalálni a nőt, akit szeret, és hátborzongató versenyfutás kezdődik Prága misztikus városrészeiben. Könyörtelenül vadászik rá egy nagy hatalmú szervezet, valamint egy ijesztő alak a város ősi mitológiájából.\r\n\r\nMiközben a cselekmény kiterjed New Yorkra és Londonra, Langdon beleveti magát a futurisztikus tudományok és a történelmi tanok kettős világába, és a kódok és szimbólumok labirintusán keresztül felfedi a sokkoló igazságot egy titkos programról, amely örökre megváltoztathatja azt, ahogy az emberi elméről vélekedünk.\r\n\r\nDAN BROWN nyolc sikerlista-vezető regény szerzője, egyebek közt A Da Vinci-kódé, amely minden idők egyik legtöbb példányban eladott könyvévé vált. A Robert Langdon-thrillerek – köztük Az elveszett jelkép, az Angyalok és démonok, az Inferno és az Eredet – világszerte elvarázsolták az olvasókat, és intellektuális vitákat, párbeszédeket, találgatásokat hívtak életre. Brown regényei 56 nyelven jelentek meg a világ minden táján, összesen több mint 250 millió példányban.', '2026-03-14 17:08:37', '2026-03-14 17:08:37', 'uploads/covers/1773508117_Titkoktitka.jpg'),
(30, 1, 'Az utolsó gyufaszál', 'Marie Vareille', 2024, 'Abigaëlle több mint húsz éve visszavonult egy burgundiai kolostorba, ahol tökéletes magányban telnek a napjai. Múltjáról csak szórványos, homályos emlékei vannak, még azt az eseményt sem tudja felidézni, amely megváltoztatta a sorsát, és arra kényszerítette, hogy kivonuljon a világból, hogy odahagyja az otthonát, ahol a családjával élt.\r\nA bátyja kéthetente meglátogatja őt, ő pedig a távolból követi Gabriel életét, aki felnőve sikeres és népszerű íróvá vált. Elérkezik azonban a nap, amikor Gabrielt egy véletlen összesodorja a csodálatos Zoéval. Hiába indul gyönyörűen ez a történet, Abigaëlle mégis fél, mert ő az egyetlen, aki tudja, hogy miféle démonokkal küzd a bátyja, hogy miféle pokol volt a gyermekkoruk a kiszámíthatatlan és veszélyes apjuk mellett, aki folyamatosan bántalmazta menekülni képtelen édesanyjukat, és rettegésben tartotta őket.\r\nMarie Vareille felkavaróan izgalmas, az utolsó oldalig megdöbbentő fordulatokban gazdag regénye egy mély empátiával megírt pokoljárás története. A felnőttek és a gyermekek testét-lelkét egyaránt romboló, kiutat nagyon nehezen kínáló családon belüli erőszak azon ritka irodalmi ábrázolásai közé tartozik ez a mű, amelyek minden szakmai, lélektani hitelességük ellenére is fordulatos és lebilincselő olvasmányt jelentenek, és a puszta borzongatáson, az olcsó együttérzésen túl is komoly tanulsággal szolgálnak, elgondolkodtatják az olvasót.', '2026-03-14 17:10:08', '2026-03-14 17:10:08', 'uploads/covers/1773508208_utolsogyufa.jpg'),
(31, 1, 'A ​Hail Mary-küldetés', 'Andy Weir', 2025, 'Ryland Grace egyedül maradt: az utolsó esélyként indított küldetés egyetlen túlélőjeként nem vallhat kudarcot, különben az egész Föld és vele az emberiség is elpusztul. Csakhogy éppenséggel ezt ő maga sem tudja. A saját nevére sem emlékszik, nemhogy arra, hogy hol van, és mit is kéne tennie.\r\n\r\nCsak annyit tud, hogy évekig tartó öntudatlanságból ébresztik fel, sok millió kilométerre az otthonától, két holttest társaságában.\r\n\r\nRylandnak lépésről lépésre kell feltárnia a múltját. Így apránként szembesül az előtte álló lehetetlen feladattal: a bolygó kormányai összefogásában sebtiben összetákolt, majd az űr mélyébe kilőtt hajó fedélzetén egymagában kell elhárítania az emberiség kihalásával fenyegető, felfoghatatlan súlyú katasztrófát.\r\n\r\nHa beszámítjuk a képletbe váratlan szövetségesét, talán még sikerrel is járhat.\r\n\r\nA hazánkban is lehengerlő sikert aratott A marsi – Mentőexpedíció és az Artemis után a #1 New York Times-bestsellerszerző Andy Weir ismét lélegzetelállító útra hív a világegyetem mélyére eddigi talán legizgalmasabb könyvében.', '2026-03-14 17:11:03', '2026-03-14 17:11:03', 'uploads/covers/1773508263_covers_673056.jpg'),
(32, 1, 'Lebegők', 'Leslie L Lawrence', 1997, 'Nehéz napok járnak Takcang kolostorára. Korán beköszöntött e tél, beragadt a nagy imahenger tengelye, macskadémon riogatja a szerzeteseket, sőt még Kribjang apát is a vártnál korábban tér haza indiai útjáról. Gyanús kincskeresők árasztják el a kolostort, s a zűrzavarban gyilkosság történik. A gyilkos biztonságban érezhetné magát a jámbor szerzetesek között, ha nem tartózkodna a kolostorban a ritka kéziratokat tanulmányozó Blobzang rinpócse, azaz Leslie L. Lawrence.', '2026-03-14 17:12:56', '2026-03-14 17:12:56', 'uploads/covers/1773508376_lebegok.jpg'),
(33, 1, 'Holdanyó ​fényes arca', 'Leslie L. Lawrence', 1987, 'Leslie L. Lawrence a rovartudós és keletkutató ismét úton van: célja ezúttal a hajdani fejvadászok birodalma, Nágaföld. Hősünket most is titokzatos események veszik körül: kegyetlen gyilkosok irtják az őserdőbe menekült harikrisna szekta tagjait; megmagyarázhatatlan jelenségek rémítgetik a dzsungelba települt szeretetotthon lakóit; egy nága kobrát dob az öregasszonyokat ápoló orvosokra; felbukkan a bolond lány, és furcsa énekével megváltoztatja tudósunk terveit. És ismét feltűnik a Gonosz, Leslie L. Lawrence örök ellenfele…', '2026-03-14 17:14:12', '2026-03-14 17:14:12', 'uploads/covers/1773508452_holdanyo.jpg'),
(34, 1, 'Csöd', 'Leslie L. Lawrence', 2002, 'A békés bhutáni kolostor, Litang nem kerülheti el a sorsát: felbukkan a falai között Leslie L. Lawrence, hogy egy frissiben felfedezett, régi könyvet tanulmányozzon. Ettől a perctől kezdve a rémület napjai köszöntenek Nyömden apátra és a mit sem sejtő szerzetesekre. Gyilkosság gyilkosságot követ: titokzatos szertartások zajlanak a közeli temetőben, magányos lelkek kóborolnak a kolostor körül.\r\nLeslie L. Lawrence foga közé szorítja pipáját, kezébe veszi Smith and Wessonját és a kegyetlen gyilkos nyomába ered.', '2026-03-14 17:14:57', '2026-03-14 17:14:57', 'uploads/covers/1773508497_csod.jpg'),
(35, 1, 'Naraszinha ​oszlopa', 'Leslie L. Lawrence', 1992, 'Leslie L. Lawrence ezúttal Indiába készül, hogy elkísérje Lord Lovert, Bentonshire urát Káli anya elrejtett templomába, s hogy mellesleg megkeresse a mindeddig ismeretlen óriási sünbogarakat. Az expedíció útját azonban nem kíséri szerencse: felbukkannak a rettegett fojtogató szekta hívei, a thugok: a békés őserdő a rémület dzsungelévé változik át. Leslie L. Lawrence fogai közé szorítja elmaradhatatlan pipáját, kezébe veszi 38-as Smith and Wessonját, és elindul a titokzatos Sivalingamot rejtő Káli-szentély felé…', '2026-03-14 17:16:01', '2026-03-14 17:16:01', 'uploads/covers/1773508561_narsz.jpg'),
(36, 1, 'Csillagok háborúja', 'George Lucas', 1984, 'Réges régen, egy messzi-messzi galaxisban…\r\n\r\nLuke Skywalker a nagybátyja farmján dolgozik a félreeső Tatuin bolygón. A hétköznapi munka unalma helyett izgalmas csillagközi kalandokról ábrándozik. Kalandokról, melyek a legtávolabbi galaxisok idegen világaiba vezetnék.\r\nLuke álma hamarosan teljesül: titkos üzenet birtokába jut, miszerint a gyönyörű Leia hercegnőt Darth Vader, a hatalmas és gonosz sith nagyúr tartja fogva. Eddig soha nem hallott a nőről, de tudja, hogy meg kell mentenie, méghozzá késlekedés nélkül.\r\nÖsszetalálkozik a jedi Ben Kenobival, akinek az útmutatójával, a tőle kapott fénykarddal és bátorsággal felfegyverkezve Luke hirtelen a valaha volt legkegyetlenebb űrháború kellős közepén találja magát, és hamarosan egy elkeseredett összecsapásban vesz részt a Birodalom rettegett űrállomása, a Halálcsillag ellen…\r\n\r\nA Csillagok háborúja 1976-ban indult útjára, és a későbbi mozifilmek a sci-fi legnépszerűbb és legnagyobb hatású alkotásává tették, sikere évtizedeken átívelve, mindmáig töretlen. Az olvasó az eredeti regény újra szerkesztett, napjaink nyelvezetéhez és az azóta hatalmas méretűre nőtt Star Wars univerzumhoz pontosabban illeszkedő kiadását tartja a kezében.', '2026-03-14 17:17:22', '2026-03-14 17:17:27', 'uploads/covers/cover_69b59827e2c169.75643863.jpg'),
(37, 1, 'Háború és béke', 'Lev Tolsztoj', 1869, 'Tolsztoj két (külön-külön is sok ágú) szálból szőtte hatalmas regényét. Az egyik Rosztov gróf, Bolkonszkij herceg és több más család öregjeinek és fiataljainak regénye, mely híven tükrözi az orosz nemesség életét I. Sándor cár korában.\r\nA regény másik szála az 1812-es napóleoni hadjárat leglényegesebb cselekményeinek története. Bemutatja azt az igazságos védelmi háborút, amelyet az orosz nép, hallatlan szenvedések közepette, diadalmasan vívott meg a betolakodók ellen. Valóságos eposz ez, melynek hőse maga a nép.\r\nA regény ezernyi epizódjában rengeteg ember jelenik meg előttünk, de Tolsztoj jellemábrázoló ereje valamennyit elevenné s feledhetetlenné teszi. Mindenütt meglátja és megmutatja azt, ami általános érvényű. Ezért él és hat ez a csodás regény örökké, és minden kor számára van mondanivalója.', '2026-03-14 17:18:47', '2026-03-14 17:18:47', 'uploads/covers/1773508727_haboru.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'tamas', 'tamas@bookdb.local', '12345', '2026-03-08 16:41:00');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Elsődleges kulcs', AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
