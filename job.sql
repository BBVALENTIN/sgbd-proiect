-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2025 at 08:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job`
--

-- --------------------------------------------------------

--
-- Table structure for table `adrese`
--

CREATE TABLE `adrese` (
  `id_adresa` int(11) NOT NULL,
  `oras` varchar(100) DEFAULT NULL,
  `strada` varchar(255) DEFAULT NULL,
  `cod_postal` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adrese`
--

INSERT INTO `adrese` (`id_adresa`, `oras`, `strada`, `cod_postal`) VALUES
(1, 'București', 'Strada Lalelelor 1', '010101'),
(2, 'Cluj-Napoca', 'Strada Rozelor 2', '400400'),
(3, 'Timișoara', 'Strada Florilor 3', '300300'),
(4, 'București', 'Strada Garoafelor 4', '010102'),
(5, 'Cluj-Napoca', 'Strada Teiului 5', '400401'),
(6, 'Timișoara', 'Strada Vișinilor 6', '300301'),
(7, 'Iași', 'Strada Castanilor 7', '700700'),
(8, 'Constanța', 'Strada Fagului 8', '900900'),
(9, 'Oradea', 'Strada Plopilor 9', '410410'),
(10, 'Brașov', 'Strada Păcii 10', '500500'),
(11, 'Ploiești', 'Strada Soarelui 11', '100100'),
(12, 'Galați', 'Strada Lunii 12', '800800'),
(13, 'Sibiu', 'Strada Neptun 13', '550550'),
(14, 'Baku', 'Strada Stejarului 14', 'AZ1000'),
(15, 'Zlatoust', 'Strada Nucului 15', 'RU1001'),
(16, 'Leningrad', 'Strada Bradului 16', 'RU1002'),
(17, 'Riga', 'Strada Salcâmului 17', 'LV1003'),
(18, 'Tbilisi', 'Strada Jupiter 18', 'GE1004'),
(19, 'Moscow', 'Strada Venus 19', 'RU1005'),
(20, 'St. Petersburg', 'Strada Saturn 20', 'RU1006'),
(21, 'Moscow', 'Strada Uranus 21', 'RU1007'),
(22, 'Kiev', 'Strada Mercur 22', 'UA1008'),
(23, 'Tuapse', 'Strada Marte 23', 'RU1009'),
(24, 'Bryansk', 'Strada Terra 24', 'RU1010'),
(25, 'Moscow', 'Strada Pluto 25', 'RU1011'),
(26, 'St. Petersburg', 'Strada Apollo 26', 'RU1012'),
(27, 'Moscow', 'Strada Artemis 27', 'RU1013'),
(28, 'Lviv', 'Strada Hera 28', 'UA1014'),
(29, 'Moscow', 'Strada Zeus 29', 'RU1015'),
(30, 'Elista', 'Strada Ares 30', 'RU1016'),
(31, 'Simferopol', 'Strada Hades 31', 'UA1017'),
(32, 'Moscow', 'Strada Demeter 32', 'RU1018'),
(33, 'Ryazan', 'Strada Athena 33', 'RU1019'),
(34, 'Saratov', 'Strada Hermes 34', 'RU1020'),
(35, 'St. Petersburg', 'Strada Dionysos 35', 'RU1021'),
(36, 'St. Petersburg', 'Strada Helios 36', 'RU1022'),
(37, 'Omsk', 'Strada Cronos 37', 'RU1023'),
(38, 'St. Petersburg', 'Strada Gaia 38', 'RU1024'),
(39, 'Chelyabinsk', 'Strada Oceanus 39', 'RU1025'),
(40, 'Cluj-Napoca', 'Strada Eroilor 102', '400402'),
(41, 'Timișoara', 'Aleea Castanilor 3', '300302'),
(42, 'Cluj-Napoca', 'Bd. Libertății 88', '400403'),
(43, 'București', 'Strada Vișinilor 27', '010103'),
(44, 'Iași', 'Strada Justiției 9', '700701'),
(45, 'București', 'Calea Moșilor 14', '010104'),
(46, 'București', 'Strada Frasinului 21', '010105'),
(47, 'Timișoara', 'Bd. Muncii 50', '300303'),
(48, 'București', 'Strada Zorilor 6', '010106'),
(49, 'București', 'Strada Gării 124', '010107'),
(50, 'Brașov', 'Strada Salcâmilor 32', '500501'),
(51, 'Cluj-Napoca', 'Aleea Teiului 19', '400404'),
(52, 'Ploiesti', 'Strada Lalelelor 15A', '100101'),
(53, 'Boldesti', 'Str. Dealului', '105300'),
(54, 'Scaeni', 'Str. Primaverii', '105300'),
(55, 'Targu Mures', 'Str. Muntelui', '155300'),
(56, 'Marseilles', 'Rue du Rome', '165300');

-- --------------------------------------------------------

--
-- Table structure for table `aplicanti`
--

CREATE TABLE `aplicanti` (
  `id_aplicant` int(11) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `prenume` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `CNP` varchar(255) DEFAULT NULL,
  `telefon` varchar(50) DEFAULT NULL,
  `cv_link` varchar(255) DEFAULT NULL,
  `id_adresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aplicanti`
--

INSERT INTO `aplicanti` (`id_aplicant`, `nume`, `prenume`, `email`, `CNP`, `telefon`, `cv_link`, `id_adresa`) VALUES
(1, 'Ion', 'Popescu', 'ion.popescu@mail.com', '5040809297249', '0756789012', 'cv/Ion_Popescu.pdf', 1),
(2, 'Ionescu', 'Ion', 'maria.ionescu@mail.com', '5010101123456', '0767890123', 'cv/JohnJohnny.pdf', 2),
(3, 'George', 'Mihai', 'george.vasile@mail.com', '2670918785632', '0745678901', 'cv/MirceaBravo.pdf', 3),
(4, 'Popescu', 'Andrei', 'andrei.popescu@example.com', '1981010123456', '0721123456', 'cv/andrei_popescu.pdf', 4),
(5, 'Ionescu', 'Maria', 'maria.ionescu@example.com', '2960306457890', '0744333222', 'cv/maria_ionescu.pdf', 5),
(6, 'Georgescu', 'Paul', 'paul.georgescu@example.com', '1950609345123', '0733777888', 'cv/paul_georgescu.pdf', 6),
(7, 'Dumitrescu', 'Elena', 'elena.dumitrescu@example.com', '2981123245678', '0755444333', 'cv/elena_dumitrescu.pdf', 7),
(8, 'Stan', 'Mihai', 'mihai.stan@example.com', '1940512234567', '0722999888', 'cv/mihai_stan.pdf', 8),
(9, 'Pop', 'Ana', 'ana.pop@example.com', '2970418234567', '0766111222', 'cv/ana_pop.pdf', 9),
(10, 'Tudor', 'Gabriel', 'gabriel.tudor@example.com', '1921001567890', '0777333444', 'cv/gabriel_tudor.pdf', 10),
(11, 'Barbu', 'Ioana', 'ioana.barbu@example.com', '2950729567890', '0733222111', 'cv/ioana_barbu.pdf', 11),
(12, 'Radu', 'Cristian', 'cristian.radu@example.com', '1900922123456', '0788777666', 'cv/cristian_radu.pdf', 12),
(13, 'Ilie', 'Daniela', 'daniela.ilie@example.com', '2991231123456', '0799000111', 'cv/daniela_ilie.pdf', 13),
(14, 'Kasparov', 'Garry', 'g.kasparov@mail.ru', '1900101123456', '+7-495-111-2233', 'https://cv.com/kasparov', 14),
(15, 'Karpov', 'Anatoly', 'a.karpov@mail.ru', '1900123456789', '+7-495-222-3344', 'https://cv.com/karpov', 15),
(16, 'Spassky', 'Boris', 'b.spassky@mail.ru', '1900234567890', '+7-495-333-4455', 'https://cv.com/spassky', 16),
(17, 'Tal', 'Mikhail', 'm.tal@mail.ru', '1900345678901', '+7-495-444-5566', 'https://cv.com/tal', 17),
(18, 'Petrosian', 'Tigran', 't.petrosian@mail.ru', '1900456789012', '+7-495-555-6677', 'https://cv.com/petrosian', 18),
(19, 'Smyslov', 'Vasily', 'v.smyslov@mail.ru', '1900567890123', '+7-495-666-7788', 'https://cv.com/smyslov', 19),
(20, 'Botvinnik', 'Mikhail', 'm.botvinnik@mail.ru', '1900678901234', '+7-495-777-8899', 'https://cv.com/botvinnik', 20),
(21, 'Alekhine', 'Alexander', 'a.alekhine@mail.ru', '1900789012345', '+7-495-888-9900', 'https://cv.com/alekhine', 21),
(22, 'Bronstein', 'David', 'd.bronstein@mail.ru', '1900890123456', '+7-495-999-0011', 'https://cv.com/bronstein', 22),
(23, 'Kramnik', 'Vladimir', 'v.kramnik@mail.ru', '1900912345678', '+7-495-123-4567', 'https://cv.com/kramnik', 23),
(24, 'Nepomniachtchi', 'Ian', 'i.nepo@mail.ru', '1900123987654', '+7-495-111-4422', 'https://cv.com/nepo', 24),
(25, 'Grischuk', 'Alexander', 'a.grischuk@mail.ru', '1900987654321', '+7-495-222-5533', 'https://cv.com/grischuk', 25),
(26, 'Svidler', 'Peter', 'p.svidler@mail.ru', '1900876543210', '+7-495-333-6644', 'https://cv.com/svidler', 26),
(27, 'Dreev', 'Alexey', 'a.dreev@mail.ru', '1900765432109', '+7-495-444-7755', 'https://cv.com/dreev', 27),
(28, 'Morozevich', 'Alexander', 'a.morozevich@mail.ru', '1900654321098', '+7-495-555-8866', 'https://cv.com/morozevich', 28),
(29, 'Rubinstein', 'Akiba', 'a.rubinstein@mail.ru', '1900543210987', '+7-495-666-9977', 'https://cv.com/rubinstein', 29),
(30, 'Ivanchuk', 'Vassily', 'v.ivanchuk@mail.ru', '1900432109876', '+7-495-777-1088', 'https://cv.com/ivanchuk', 30),
(31, 'Bareev', 'Evgeny', 'e.bareev@mail.ru', '1900321098765', '+7-495-888-2199', 'https://cv.com/bareev', 31),
(32, 'Zvjaginsev', 'Vadim', 'v.zvjaginsev@mail.ru', '1900210987654', '+7-495-999-3200', 'https://cv.com/zvjaginsev', 32),
(33, 'Dlugy', 'Maxim', 'm.dlugy@mail.ru', '1900109876543', '+7-495-123-4311', 'https://cv.com/dlugy', 33),
(34, 'Inarkiev', 'Ernesto', 'e.inarkiev@mail.ru', '1900987653210', '+7-495-234-5422', 'https://cv.com/inarkiev', 34),
(35, 'Karjakin', 'Sergey', 's.karjakin@mail.ru', '1900876542109', '+7-495-345-6533', 'https://cv.com/karjakin', 35),
(36, 'Dubov', 'Daniil', 'd.dubov@mail.ru', '1900765431098', '+7-495-456-7644', 'https://cv.com/dubov', 36),
(37, 'Andreikin', 'Dmitry', 'd.andreikin@mail.ru', '1900654320987', '+7-495-567-8755', 'https://cv.com/andreikin', 37),
(38, 'Tomashevsky', 'Evgeny', 'e.tomashevsky@mail.ru', '1900543219876', '+7-495-678-9866', 'https://cv.com/tomashevsky', 38),
(39, 'Matlakov', 'Maxim', 'm.matlakov@mail.ru', '1900432108765', '+7-495-789-0977', 'https://cv.com/matlakov', 39),
(40, 'Fedoseev', 'Vladimir', 'v.fedoseev@mail.ru', '1900321097654', '+7-495-890-1088', 'https://cv.com/fedoseev', 41),
(41, 'Artemiev', 'Vladislav', 'v.artemiev@mail.ru', '1900210986543', '+7-495-901-2199', 'https://cv.com/artemiev', 40),
(42, 'Goganov', 'Aleksandr', 'a.goganov@mail.ru', '1900109875432', '+7-495-123-3300', 'https://cv.com/goganov', 43),
(43, 'Ponkratov', 'Pavel', 'p.ponkratov@mail.ru', '1900999888777', '+7-495-321-4433', 'https://cv.com/ponkratov', 1);

-- --------------------------------------------------------

--
-- Table structure for table `aplicari`
--

CREATE TABLE `aplicari` (
  `id_aplicare` int(11) NOT NULL,
  `id_job` int(11) NOT NULL,
  `id_aplicant` int(11) NOT NULL,
  `data_aplicare` date DEFAULT curdate(),
  `id_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aplicari`
--

INSERT INTO `aplicari` (`id_aplicare`, `id_job`, `id_aplicant`, `data_aplicare`, `id_status`) VALUES
(40, 2, 1, '2025-05-01', 2),
(41, 3, 2, '2025-05-02', 1),
(42, 5, 3, '2025-05-03', 3),
(43, 6, 4, '2025-05-03', 2),
(44, 7, 5, '2025-05-04', 1),
(45, 8, 6, '2025-05-05', 2),
(46, 9, 7, '2025-05-06', 2),
(47, 10, 8, '2025-05-06', 2),
(48, 11, 9, '2025-05-07', 1),
(49, 12, 10, '2025-05-08', 2),
(50, 13, 11, '2025-05-09', 2),
(51, 14, 12, '2025-05-10', 2),
(52, 15, 13, '2025-05-11', 2),
(149, 16, 14, '2025-05-12', 1),
(150, 17, 15, '2025-05-13', 3),
(151, 19, 17, '2025-05-15', 1),
(152, 20, 18, '2025-05-16', 2),
(153, 21, 19, '2025-05-17', 2),
(154, 22, 20, '2025-05-18', 3),
(155, 23, 21, '2025-05-19', 2),
(156, 24, 22, '2025-05-20', 2),
(157, 25, 23, '2025-05-21', 1),
(158, 26, 24, '2025-05-22', 2),
(159, 27, 25, '2025-05-23', 3),
(160, 28, 1, '2025-05-24', 2),
(161, 29, 2, '2025-05-25', 2),
(162, 30, 3, '2025-05-26', 1),
(163, 31, 4, '2025-05-27', 3),
(164, 32, 5, '2025-05-28', 2),
(165, 33, 6, '2025-05-29', 2),
(166, 2, 7, '2025-05-30', 2),
(167, 3, 8, '2025-05-31', 1),
(168, 5, 10, '2025-06-02', 2),
(169, 6, 11, '2025-06-03', 2),
(170, 7, 12, '2025-06-04', 1),
(171, 8, 13, '2025-06-05', 3),
(172, 9, 14, '2025-06-06', 2),
(173, 10, 15, '2025-06-07', 2),
(174, 11, 16, '2025-06-08', 1),
(175, 12, 17, '2025-06-09', 2);

-- --------------------------------------------------------

--
-- Table structure for table `companii`
--

CREATE TABLE `companii` (
  `id_companie` int(11) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` varchar(50) DEFAULT NULL,
  `vechime` int(11) DEFAULT NULL,
  `descriere` text DEFAULT NULL,
  `id_adresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companii`
--

INSERT INTO `companii` (`id_companie`, `nume`, `email`, `telefon`, `vechime`, `descriere`, `id_adresa`) VALUES
(2, 'InnoGroup', 'info@innogroup.ro', '0734123456', 2, 'Furnizor de top de echipamente medicale avansate și consumabile, cu un portofoliu diversificat ce include dispozitive inovatoare pentru diagnosticare, tratament și monitorizare, susținute de servicii personalizate de training și mentenanță, cu angajament puternic față de calitatea serviciilor și satisfacția clienților din sistemul medical public și privat.', 44),
(3, 'GlobalSoft', 'support@globalsoft.com', '0745123456', 1, 'Birou de arhitectură cu o abordare holistică, specializat în proiectarea de clădiri sustenabile, folosind tehnologii ecologice și materiale reciclabile, care promovează un design modern, funcțional și estetic, adaptat nevoilor clientului și respectând reglementările locale și internaționale de protecție a mediului și siguranță.', 45),
(4, 'SoftVision', 'contact@softvision.ro', '0214567890', 12, 'Startup fintech dedicat dezvoltării de platforme digitale de plăți și gestionare financiară, care utilizează inteligența artificială și blockchain pentru a crea soluții transparente, sigure și ușor accesibile utilizatorilor, având ca misiune democratizarea accesului la servicii financiare pentru toți categoriile sociale.', 46),
(5, 'Bitdefender', 'hr@bitdefender.com', '0314001234', 20, 'Producător artizanal de cosmetice naturale, folosind ingrediente organice certificate și procese sustenabile, care oferă o gamă largă de produse pentru îngrijirea pielii și părului, cu un angajament ferm față de protejarea mediului și promovarea unui stil de viață sănătos și responsabil.', 47),
(6, 'Endava', 'jobs@endava.com', '0372123456', 15, 'Cabinet de avocatură specializat în drept comercial și civil, oferind consultanță juridică, redactare și negociere contracte, reprezentare în litigii și soluționarea disputelor, cu o echipă de avocați experimentați care prioritizează interesele clienților și oferă soluții personalizate pentru fiecare caz.', 48),
(7, 'eMAG', 'careers@emag.ro', '0212003030', 21, 'Studio creativ de animație digitală și efecte vizuale, colaborând cu agenții de publicitate, dezvoltatori de jocuri video și producători multimedia, creând conținut captivant, inovativ și adaptat pentru diverse platforme digitale și medii interactive.', 49),
(8, 'Zitec', 'recrutare@zitec.com', '0213102030', 19, 'Distribuitor specializat în produse alimentare destinate sectorului HoReCa, cu livrări rapide, stocuri extinse și relații solide cu producători locali și importatori, oferind produse proaspete, congelate și ambalate, adaptate cerințelor specifice ale clienților din industria ospitalității.', 50),
(9, 'Accenture', 'romania@accenture.com', '0219876543', 17, 'Companie de consultanță în resurse umane, oferind servicii complete de recrutare, selecție, training și dezvoltare organizațională, adaptate nevoilor specifice ale fiecărui client, cu accent pe creșterea performanței angajaților și a satisfacției la locul de muncă.', 51),
(10, 'UiPath', 'jobs@uipath.com', '0211112222', 9, 'Atelier de mobilier personalizat, care proiectează și produce piese unice, adaptate preferințelor clienților și spațiului disponibil, folosind materiale de calitate superioară și tehnici moderne de prelucrare, oferind soluții pentru design interior rezidențial și comercial.', 52),
(11, 'Adobe Romania', 'contact@adobe.ro', '0319876543', 14, 'Companie națională de logistică și transport, oferind servicii rapide și sigure de curierat, depozitare și distribuție, folosind tehnologii moderne pentru monitorizarea coletelor și optimizarea rutelor, cu o rețea extinsă pentru acoperire eficientă pe întreg teritoriul.', 53),
(12, 'Luxoft', 'hr@luxoft.com', '0217654321', 11, 'Agenție de marketing digital care oferă servicii complete de promovare online, SEO, social media, content marketing și publicitate PPC, personalizate pentru fiecare client, cu scopul de a crește vizibilitatea brandului și conversiile pe canalele digitale.', 54),
(13, 'NTT Data', 'jobs@nttdata.ro', '0264123456', 13, 'Furnizor de servicii IT și infrastructură cloud, care oferă soluții scalabile și securizate pentru companii mici și mijlocii, asigurând continuitatea afacerii prin suport tehnic 24/7, monitorizare proactivă și consultanță personalizată în domeniul digitalizării.', 55),
(18, 'Simavi', 'support@simavi.com', '0734864921', 8, 'Companie lider în dezvoltarea de soluții software complexe, care integrează inteligența artificială, analiza datelor mari și automatizarea proceselor pentru optimizarea operațiunilor în sectoare precum financiar, sănătate și industrie, oferind suport tehnic continuu și consultanță strategică pentru transformarea digitală a afacerilor.', 56);

-- --------------------------------------------------------

--
-- Table structure for table `competente`
--

CREATE TABLE `competente` (
  `id_competenta` int(11) NOT NULL,
  `ani_experienta` int(11) DEFAULT NULL,
  `nume_competenta` varchar(255) DEFAULT NULL,
  `id_nivel_competenta` int(11) DEFAULT NULL,
  `id_nivel_studii` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competente`
--

INSERT INTO `competente` (`id_competenta`, `ani_experienta`, `nume_competenta`, `id_nivel_competenta`, `id_nivel_studii`) VALUES
(1, 3, 'PHP', 2, 1),
(2, 1, 'Vânzări - Digitale', 1, 2),
(3, 9, 'Vânzări', 3, 3),
(4, 2, 'HR', 1, 2),
(5, 5, 'PHP', 3, 2),
(6, 3, 'SQL', 2, 1),
(7, 1, 'JavaScript', 1, 2),
(8, 5, 'Management de proiect', 3, 1),
(9, 3, 'Machine Learning', 2, 3),
(10, 1, 'Testare software', 1, 1),
(11, 6, 'Dezvoltare aplicații mobile', 3, 3),
(12, 2, 'Design grafic', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `competente_aplicanti`
--

CREATE TABLE `competente_aplicanti` (
  `id_competenta` int(11) DEFAULT NULL,
  `id_aplicant` int(11) DEFAULT NULL,
  `certificare` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competente_aplicanti`
--

INSERT INTO `competente_aplicanti` (`id_competenta`, `id_aplicant`, `certificare`) VALUES
(3, 1, 1),
(5, 1, 2),
(1, 2, 2),
(6, 2, 1),
(2, 3, 2),
(4, 3, 1),
(7, 4, 2),
(10, 4, 1),
(9, 5, 2),
(3, 5, 1),
(8, 6, 2),
(2, 6, 1),
(1, 7, 2),
(12, 7, 1),
(11, 8, 2),
(4, 8, 2),
(5, 9, 1),
(6, 10, 1),
(7, 11, 2),
(12, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `competente_cerute`
--

CREATE TABLE `competente_cerute` (
  `id_job` int(11) NOT NULL,
  `id_competenta` int(11) NOT NULL,
  `prioritate` int(11) DEFAULT NULL,
  `id_tip_job` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competente_cerute`
--

INSERT INTO `competente_cerute` (`id_job`, `id_competenta`, `prioritate`, `id_tip_job`) VALUES
(2, 2, 2, 1),
(3, 3, 2, 1),
(2, 2, 1, 3),
(2, 7, 2, 1),
(3, 6, 1, 1),
(3, 9, 2, 2),
(5, 12, 1, 1),
(5, 1, 2, 2),
(6, 2, 1, 1),
(6, 11, 2, 2),
(7, 10, 1, 1),
(7, 4, 2, 3),
(8, 7, 1, 2),
(8, 5, 2, 1),
(9, 8, 1, 1),
(9, 3, 2, 3),
(10, 9, 1, 1),
(10, 6, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `contracte`
--

CREATE TABLE `contracte` (
  `id_contract` int(11) NOT NULL,
  `id_job` int(11) DEFAULT NULL,
  `salariu` decimal(10,2) DEFAULT NULL,
  `data_inceput` date DEFAULT NULL,
  `data_sfarsit` date DEFAULT NULL,
  `tip_salariu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contracte`
--

INSERT INTO `contracte` (`id_contract`, `id_job`, `salariu`, `data_inceput`, `data_sfarsit`, `tip_salariu`) VALUES
(2, 2, 3500.00, '2025-03-01', '2025-11-30', 2),
(3, 3, 4000.00, '2025-01-15', '2025-12-31', 1),
(4, 5, 5300.00, '2024-01-10', '2025-01-10', 1),
(5, 6, 8000.00, '2024-02-01', '2025-02-01', 1),
(6, 7, 4800.00, '2023-12-01', '2024-12-01', 2),
(7, 8, 5200.00, '2024-04-01', '2025-04-01', 1),
(8, 9, 4600.00, '2023-11-15', '2024-11-15', 2),
(9, 10, 9000.00, '2024-05-01', '2025-05-01', 1),
(10, 11, 8500.00, '2024-03-20', '2025-03-20', 1),
(11, 12, 8200.00, '2024-06-01', '2025-06-01', 2),
(12, 13, 6100.00, '2024-01-01', '2025-01-01', 1),
(13, 14, 7200.00, '2023-10-01', '2024-10-01', 2),
(14, 15, 4900.00, '2024-02-15', '2025-02-15', 1),
(15, 16, 4300.00, '2024-03-10', '2025-03-10', 1),
(16, 17, 5600.00, '2024-04-10', '2025-04-10', 2),
(17, 19, 6700.00, '2023-12-05', '2024-12-05', 1),
(18, 20, 6000.00, '2024-05-05', '2025-05-05', 1),
(19, 21, 7100.00, '2024-01-20', '2025-01-20', 2),
(20, 22, 7500.00, '2024-06-10', '2025-06-10', 1),
(21, 23, 6800.00, '2024-02-25', '2025-02-25', 1),
(22, 24, 7000.00, '2025-03-15', '2031-12-17', 2),
(23, 25, 7000.00, '2024-06-01', '2025-06-01', 1),
(24, 26, 4500.50, '2024-07-15', '2025-07-15', 2),
(25, 27, 6000.00, '2024-05-10', '2025-05-10', 1),
(26, 28, 3500.00, '2024-08-01', '2025-08-01', 1),
(27, 29, 4000.75, '2024-06-20', '2025-06-20', 2),
(28, 30, 5200.00, '2024-09-01', '2025-09-01', 1),
(29, 31, 6700.00, '2024-07-01', '2025-07-01', 2),
(30, 32, 4800.00, '2024-10-01', '2025-10-01', 1),
(31, 33, 5500.00, '2024-06-15', '2025-06-15', 1),
(95, 29, 7200.50, '2025-06-05', '2026-06-05', 2),
(96, 30, 5800.00, '2025-06-10', '2026-06-10', 1),
(97, 31, 6000.00, '2025-06-15', '2026-06-15', 1),
(98, 32, 7000.00, '2025-06-20', '2026-06-20', 2),
(99, 33, 6300.00, '2025-06-25', '2026-06-25', 1),
(100, 54, 6700.00, '2025-07-01', '2026-07-01', 2),
(101, 55, 7100.00, '2025-07-05', '2026-07-05', 1),
(102, 56, 6400.00, '2025-07-10', '2026-07-10', 1),
(103, 57, 5900.00, '2025-07-15', '2026-07-15', 2),
(104, 58, 7500.00, '2025-07-20', '2026-07-20', 1),
(105, 59, 6800.00, '2025-07-25', '2026-07-25', 2),
(106, 60, 6600.00, '2025-08-01', '2026-08-01', 1),
(107, 61, 6900.00, '2025-08-05', '2026-08-05', 1),
(108, 62, 7200.00, '2025-08-10', '2026-08-10', 2),
(109, 63, 7100.00, '2025-08-15', '2026-08-15', 1),
(110, 64, 6300.00, '2025-08-20', '2026-08-20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `departamente`
--

CREATE TABLE `departamente` (
  `id_departament` int(11) NOT NULL,
  `nume` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departamente`
--

INSERT INTO `departamente` (`id_departament`, `nume`) VALUES
(1, 'Marketing'),
(2, 'Vânzări'),
(3, 'Analiză date'),
(4, 'Management proiecte'),
(5, 'Design'),
(6, 'Resurse umane'),
(7, 'IT'),
(8, 'Management produs'),
(9, 'Analiză business'),
(10, 'Financiar'),
(11, 'HR');

-- --------------------------------------------------------

--
-- Table structure for table `joburi`
--

CREATE TABLE `joburi` (
  `id_job` int(11) NOT NULL,
  `titlu` varchar(255) NOT NULL,
  `descriere` text DEFAULT NULL,
  `id_companie` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `locuri_valabile` int(11) DEFAULT NULL,
  `id_departament` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `joburi`
--

INSERT INTO `joburi` (`id_job`, `titlu`, `descriere`, `id_companie`, `status`, `locuri_valabile`, `id_departament`) VALUES
(2, 'Specialist Marketing Digital', 'Căutăm un specialist în marketing digital pentru promovare online.', 2, 2, 12, 1),
(3, 'Manager Vânzări', 'Căutăm un manager pentru echipa de vânzări.', 3, 1, 5, 2),
(5, 'Data Analyst', 'Analizează și interpretează datele pentru a ajuta la luarea deciziilor.', 2, 1, 34, 3),
(6, 'Project Manager', 'Coordonează echipele și resursele pentru finalizarea proiectelor la timp.', 3, 1, 2, 4),
(7, 'UX/UI Designer', 'Crează interfețe intuitive și atractive pentru utilizatori.', 4, 1, 6, 5),
(8, 'Marketing Specialist', 'Elaborează strategii de marketing pentru promovarea produselor și serviciilor.', 5, 1, 65, 1),
(9, 'HR Specialist', 'Găsește și selectează candidați pentru diverse poziții din companie.', 6, 1, 32, 6),
(10, 'DevOps Engineer', 'Gestionarea infrastructurii IT și automatizarea proceselor de dezvoltare.', 7, 1, 3, 7),
(11, 'Sales Manager', 'Responsabil pentru creșterea vânzărilor și gestionarea echipelor de vânzări.', 8, 1, 40, 2),
(12, 'Product Owner', 'Definirea și prioritizarea cerințelor pentru produsele companiei.', 9, 1, 23, 8),
(13, 'Business Analyst', 'Identifică nevoile de business și propune soluții pentru optimizarea proceselor.', 10, 1, 1, 9),
(14, 'Frontend Developer', 'Dezvoltă interfețe web moderne pentru utilizatori.', 4, 1, 15, 7),
(15, 'Graphic Designer', 'Realizează materiale vizuale pentru campanii de promovare.', 5, 1, 10, 5),
(16, 'HR Assistant', 'Oferă suport în procesele de recrutare și administrare personal.', 6, 1, 8, 6),
(17, 'Social Media Manager', 'Gestionează prezența online a companiei pe rețele sociale.', 7, 1, 12, 1),
(19, 'Financial Analyst', 'Evaluează performanțele financiare și face rapoarte lunare.', 2, 1, 5, 10),
(20, 'Technical Recruiter', 'Recrutează personal tehnic pentru poziții IT.', 3, 1, 6, 11),
(21, 'Sales Representative', 'Promovează și vinde produsele către clienți.', 8, 1, 20, 2),
(22, 'Scrum Master', 'Facilitează procesul Agile și sprijină echipele de dezvoltare.', 9, 1, 4, 4),
(23, 'BI Developer', 'Creează soluții de business intelligence pe baza datelor.', 10, 1, 9, 3),
(24, 'Fullstack Developer', 'O sa realizeze treburi care tin atat de Frontend, cat si de Backend', 4, 1, 3, 7),
(25, 'Data Scientist', 'Analizează date complexe pentru a sprijini deciziile.', 2, 1, 8, 3),
(26, 'QA Engineer', 'Testează software-ul pentru a asigura calitatea produsului.', 3, 1, 10, 7),
(27, 'Mobile Developer', 'Dezvoltă aplicații mobile pentru Android și iOS.', 4, 1, 5, 7),
(28, 'Content Writer', 'Creează conținut relevant pentru site-uri și bloguri.', 5, 1, 7, 1),
(29, 'Customer Support Specialist', 'Oferă suport clienților prin diverse canale.', 6, 1, 12, 6),
(30, 'Network Administrator', 'Gestionează rețelele și infrastructura IT.', 7, 1, 4, 7),
(31, 'Business Development Manager', 'Identifică oportunități de dezvoltare a afacerii.', 8, 1, 3, 2),
(32, 'UX Researcher', 'Studiază comportamentul utilizatorilor pentru a îmbunătăți designul.', 4, 1, 2, 5),
(33, 'Database Administrator', 'Administrează și optimizează bazele de date.', 7, 1, 6, 7),
(54, 'Marketing Analyst', 'Analizează campaniile de marketing și tendințele pieței.', 2, 1, 5, 1),
(55, 'Technical Writer', 'Documentează produse și procese tehnice.', 9, 1, 4, 8),
(56, 'IT Support Technician', 'Asigură suport tehnic pentru utilizatori.', 6, 1, 9, 6),
(57, 'SEO Specialist', 'Optimizează site-urile pentru motoarele de căutare.', 5, 1, 3, 1),
(58, 'Product Manager', 'Coordonează dezvoltarea produselor companiei.', 9, 1, 2, 8),
(59, 'Operations Manager', 'Gestionează operațiunile zilnice ale companiei.', 3, 1, 1, 4),
(60, 'Cybersecurity Specialist', 'Protejează infrastructura IT împotriva atacurilor cibernetice.', 7, 1, 4, 7),
(61, 'Graphic Animator', 'Creează animații și elemente vizuale pentru proiecte.', 5, 1, 6, 5),
(62, 'HR Coordinator', 'Coordonează activitățile departamentului de resurse umane.', 6, 1, 5, 6),
(63, 'Logistics Manager', 'Planifică și coordonează lanțul de aprovizionare.', 8, 1, 3, 2),
(64, 'Cloud Engineer', 'Dezvoltă și administrează infrastructura cloud.', 7, 1, 4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `nivel_competenta`
--

CREATE TABLE `nivel_competenta` (
  `id_nivel_competenta` int(11) NOT NULL,
  `denumire` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nivel_competenta`
--

INSERT INTO `nivel_competenta` (`id_nivel_competenta`, `denumire`) VALUES
(1, 'Incepator'),
(2, 'Intermediar'),
(3, 'Avansat');

-- --------------------------------------------------------

--
-- Table structure for table `nivel_studii`
--

CREATE TABLE `nivel_studii` (
  `id_nivel_studii` int(11) NOT NULL,
  `denumire` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nivel_studii`
--

INSERT INTO `nivel_studii` (`id_nivel_studii`, `denumire`) VALUES
(1, 'liceu'),
(2, 'facultate'),
(3, 'master');

-- --------------------------------------------------------

--
-- Table structure for table `status_aplicare`
--

CREATE TABLE `status_aplicare` (
  `id_status` int(11) NOT NULL,
  `denumire` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status_aplicare`
--

INSERT INTO `status_aplicare` (`id_status`, `denumire`) VALUES
(1, 'in curs'),
(2, 'acceptat'),
(3, 'respins');

-- --------------------------------------------------------

--
-- Table structure for table `tip_job`
--

CREATE TABLE `tip_job` (
  `id_tip_job` int(11) NOT NULL,
  `denumire` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tip_job`
--

INSERT INTO `tip_job` (`id_tip_job`, `denumire`) VALUES
(1, 'full-time'),
(2, 'part-time'),
(3, 'internship');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adrese`
--
ALTER TABLE `adrese`
  ADD PRIMARY KEY (`id_adresa`);

--
-- Indexes for table `aplicanti`
--
ALTER TABLE `aplicanti`
  ADD PRIMARY KEY (`id_aplicant`),
  ADD UNIQUE KEY `CNP` (`CNP`),
  ADD KEY `id_adresa` (`id_adresa`);

--
-- Indexes for table `aplicari`
--
ALTER TABLE `aplicari`
  ADD PRIMARY KEY (`id_aplicare`),
  ADD KEY `id_job` (`id_job`),
  ADD KEY `id_aplicant` (`id_aplicant`),
  ADD KEY `id_status` (`id_status`);

--
-- Indexes for table `companii`
--
ALTER TABLE `companii`
  ADD PRIMARY KEY (`id_companie`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_adresa` (`id_adresa`);

--
-- Indexes for table `competente`
--
ALTER TABLE `competente`
  ADD PRIMARY KEY (`id_competenta`),
  ADD KEY `id_nivel_competenta` (`id_nivel_competenta`),
  ADD KEY `id_nivel_studii` (`id_nivel_studii`);

--
-- Indexes for table `competente_aplicanti`
--
ALTER TABLE `competente_aplicanti`
  ADD KEY `id_competenta` (`id_competenta`),
  ADD KEY `id_aplicant` (`id_aplicant`);

--
-- Indexes for table `competente_cerute`
--
ALTER TABLE `competente_cerute`
  ADD KEY `fk_competente_cerute` (`id_competenta`),
  ADD KEY `fk_id_job` (`id_job`),
  ADD KEY `id_tip_job` (`id_tip_job`);

--
-- Indexes for table `contracte`
--
ALTER TABLE `contracte`
  ADD PRIMARY KEY (`id_contract`),
  ADD KEY `id_job` (`id_job`);

--
-- Indexes for table `departamente`
--
ALTER TABLE `departamente`
  ADD PRIMARY KEY (`id_departament`);

--
-- Indexes for table `joburi`
--
ALTER TABLE `joburi`
  ADD PRIMARY KEY (`id_job`),
  ADD KEY `fk_joburi_companii` (`id_companie`),
  ADD KEY `fk_departament` (`id_departament`);

--
-- Indexes for table `nivel_competenta`
--
ALTER TABLE `nivel_competenta`
  ADD PRIMARY KEY (`id_nivel_competenta`);

--
-- Indexes for table `nivel_studii`
--
ALTER TABLE `nivel_studii`
  ADD PRIMARY KEY (`id_nivel_studii`);

--
-- Indexes for table `status_aplicare`
--
ALTER TABLE `status_aplicare`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `tip_job`
--
ALTER TABLE `tip_job`
  ADD PRIMARY KEY (`id_tip_job`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adrese`
--
ALTER TABLE `adrese`
  MODIFY `id_adresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `aplicanti`
--
ALTER TABLE `aplicanti`
  MODIFY `id_aplicant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `aplicari`
--
ALTER TABLE `aplicari`
  MODIFY `id_aplicare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `companii`
--
ALTER TABLE `companii`
  MODIFY `id_companie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `competente`
--
ALTER TABLE `competente`
  MODIFY `id_competenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contracte`
--
ALTER TABLE `contracte`
  MODIFY `id_contract` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `departamente`
--
ALTER TABLE `departamente`
  MODIFY `id_departament` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `joburi`
--
ALTER TABLE `joburi`
  MODIFY `id_job` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `nivel_studii`
--
ALTER TABLE `nivel_studii`
  MODIFY `id_nivel_studii` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aplicanti`
--
ALTER TABLE `aplicanti`
  ADD CONSTRAINT `aplicanti_ibfk_1` FOREIGN KEY (`id_adresa`) REFERENCES `adrese` (`id_adresa`);

--
-- Constraints for table `aplicari`
--
ALTER TABLE `aplicari`
  ADD CONSTRAINT `aplicari_ibfk_1` FOREIGN KEY (`id_job`) REFERENCES `joburi` (`id_job`) ON DELETE CASCADE,
  ADD CONSTRAINT `aplicari_ibfk_2` FOREIGN KEY (`id_aplicant`) REFERENCES `aplicanti` (`id_aplicant`) ON DELETE CASCADE,
  ADD CONSTRAINT `aplicari_ibfk_3` FOREIGN KEY (`id_status`) REFERENCES `status_aplicare` (`id_status`);

--
-- Constraints for table `companii`
--
ALTER TABLE `companii`
  ADD CONSTRAINT `companii_ibfk_1` FOREIGN KEY (`id_adresa`) REFERENCES `adrese` (`id_adresa`);

--
-- Constraints for table `competente`
--
ALTER TABLE `competente`
  ADD CONSTRAINT `competente_ibfk_1` FOREIGN KEY (`id_nivel_competenta`) REFERENCES `nivel_competenta` (`id_nivel_competenta`),
  ADD CONSTRAINT `competente_ibfk_2` FOREIGN KEY (`id_nivel_studii`) REFERENCES `nivel_studii` (`id_nivel_studii`);

--
-- Constraints for table `competente_aplicanti`
--
ALTER TABLE `competente_aplicanti`
  ADD CONSTRAINT `competente_aplicanti_ibfk_1` FOREIGN KEY (`id_competenta`) REFERENCES `competente` (`id_competenta`) ON DELETE CASCADE,
  ADD CONSTRAINT `competente_aplicanti_ibfk_2` FOREIGN KEY (`id_aplicant`) REFERENCES `aplicanti` (`id_aplicant`) ON DELETE CASCADE;

--
-- Constraints for table `competente_cerute`
--
ALTER TABLE `competente_cerute`
  ADD CONSTRAINT `competente_cerute_ibfk_1` FOREIGN KEY (`id_job`) REFERENCES `joburi` (`id_job`) ON DELETE CASCADE,
  ADD CONSTRAINT `competente_cerute_ibfk_2` FOREIGN KEY (`id_competenta`) REFERENCES `competente` (`id_competenta`) ON DELETE CASCADE,
  ADD CONSTRAINT `competente_cerute_ibfk_3` FOREIGN KEY (`id_tip_job`) REFERENCES `tip_job` (`id_tip_job`),
  ADD CONSTRAINT `fk_competente_cerute` FOREIGN KEY (`id_competenta`) REFERENCES `competente` (`id_competenta`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_competente_cerute_competente` FOREIGN KEY (`id_competenta`) REFERENCES `competente` (`id_competenta`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_competente_cerute_joburi` FOREIGN KEY (`id_job`) REFERENCES `joburi` (`id_job`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_id_job` FOREIGN KEY (`id_job`) REFERENCES `joburi` (`id_job`) ON DELETE CASCADE;

--
-- Constraints for table `contracte`
--
ALTER TABLE `contracte`
  ADD CONSTRAINT `contracte_ibfk_1` FOREIGN KEY (`id_job`) REFERENCES `joburi` (`id_job`) ON DELETE CASCADE;

--
-- Constraints for table `joburi`
--
ALTER TABLE `joburi`
  ADD CONSTRAINT `fk_departament` FOREIGN KEY (`id_departament`) REFERENCES `departamente` (`id_departament`),
  ADD CONSTRAINT `fk_joburi_companii` FOREIGN KEY (`id_companie`) REFERENCES `companii` (`id_companie`) ON DELETE CASCADE,
  ADD CONSTRAINT `joburi_ibfk_1` FOREIGN KEY (`id_companie`) REFERENCES `companii` (`id_companie`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
