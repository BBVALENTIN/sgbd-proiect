# 🧾 EASY-JOBS

## 📌 Descriere generală

**EASY-JOBS** este o aplicație web dezvoltată în cadrul proiectului de **Sisteme de Gestiune a Bazelor de Date (SGBD)**.  
Scopul aplicației este gestionarea datelor referitoare la companii, joburi și aplicanți — similar platformelor de angajare precum **eJobs**, **LinkedIn** sau **BestJobs**.

Proiectul evidențiază utilizarea corectă a unui **SGBD relațional (MySQL)** și aplicarea principiilor de **normalizare** și **interogare SQL** printr-o interfață web construită în **PHP**.

---

## 🧠 Funcționalități principale

Aplicația oferă funcționalități de vizualizare, filtrare și analiză a datelor din baza de date, printre care:

- 🔍 Căutare companii după oraș  
- 📋 Listarea tuturor companiilor și detaliilor acestora (email, telefon, vechime etc.)  
- 🧾 Vizualizarea aplicanților și detaliilor aferente (CNP, CV, competențe, studii, certificări)  
- 💼 Listarea joburilor disponibile și legătura cu companiile  
- 🧠 Interogări complexe disponibile direct din interfață:
  - Toți utilizatorii platformei (companii + aplicanți)  
  - Joburi fără aplicații  
  - Companii cu vechime mai mare de 10 ani  
  - Salariul oferit pentru fiecare job  
  - Joburi și companiile asociate  
  - Joburi cu salariu peste 5000 RON  
  - Joburi care au aplicații active  
  - Companii și adrese de email  
  - Joburi medii plătite în Cluj-Napoca  

---

## 🧩 Structura bazei de date

Baza de date este implementată în **MySQL** și include tabele precum:

- `companii` – stochează informațiile despre firme (nume, email, telefon, vechime, id_adresa)  
- `joburi` – conține detalii despre posturi, locuri disponibile, companie asociată  
- `aplicanti` – stochează datele personale ale utilizatorilor care aplică la joburi  
- `adrese` – conține orașe și alte date de localizare  
- `aplicari` – leagă aplicanții de joburile la care au aplicat  
- `contracte`, `competente`, `nivel_competenta`, `nivel_studii`, `status_aplicare` etc. – pentru gestionarea informațiilor suplimentare

Datele respectă **Formele Normale (FN1–FN3, FNBC)** conform cerințelor de proiect SGBD.

---

## 🧱 Tehnologii utilizate

- **Backend:** PHP (procedural)  
- **Bază de date:** MySQL  
- **Frontend:** HTML5, CSS3  
- **Server local:** XAMPP / WAMP  
- **Altele:** Prepared statements (pentru securitate SQL), interfețe simple și clare

---

## ⚙️ Instalare și configurare

1. **Clonează repository-ul:**
   ```bash
   git clone https://github.com/BBVALENTIN/sgbd-proiect.git
   ```

2. **Deschide proiectul într-un server local** (ex: XAMPP):
   - Mută folderul în `htdocs` (sau în directorul public al serverului web).
   - Pornește serviciile **Apache** și **MySQL**.

3. **Creează baza de date:**
   - Accesează `phpMyAdmin`.
   - Creează o bază de date nouă (ex: `easyjobs`).
   - Importează fișierul `job.sql` din proiect.

4. **Configurează conexiunea la baza de date:**
   - Editează fișierul `db.php` cu datele tale locale:
     ```php
     $conn = new mysqli("localhost", "root", "", "easyjobs");
     ```

5. **Accesează aplicația în browser:**
   ```
   http://localhost/sgbd-proiect/index.php
   ```

---

## 📂 Structura proiectului

```
sgbd-proiect/
│
├── db.php                # Conexiune la baza de date
├── index.php             # Pagina principală (companii + interogări)
├── firme.php             # Detalii despre firme
├── aplicant.php          # Detalii despre aplicanți
├── sterge.php            # Funcție de ștergere firmă
├── job.sql               # Script SQL pentru baza de date
├── style.css             # Fișier CSS
├── interogari.txt        # Listează interogările SQL folosite
├── poze/                 # Capturi de ecran
└── Schema_conceptuala.png # Schema bazei de date
```

---

## 🧮 Operații SQL implementate

Aplicația demonstrează utilizarea:
- **Selecției** (`SELECT`, `WHERE`)
- **Proiecției** (coloane specifice)
- **Join-urilor** (`INNER JOIN`)
- **Operațiilor de mulțimi** (`UNION`, `EXCEPT`)
- **Funcțiilor agregate** (`AVG`, `COUNT`, etc.)
- **Filtrare avansată** prin interfața web

---
