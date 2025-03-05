# Pentaho
Zautomatyzowany proces ETL w Pentaho: pobieranie danych sprzedażowych z MySQL, ich przetwarzanie i eksport raportów do Excela oraz CSV.

ETL – Automatyzacja przetwarzania danych sprzedażowych

Opis projektu

Ten projekt to proces ETL (Extract, Transform, Load) zbudowany w Pentaho Data Integration (PDI), który:

Pobiera dane sprzedażowe z bazy MySQL (XAMPP),

Filtruje i transformuje dane,

Eksportuje raporty do pliku Excel i CSV,

Automatycznie wykonuje job w ustalonych odstępach czasu.

Projekt może być wykorzystany do automatycznego przetwarzania i analizy danych sprzedażowych, a także do generowania raportów dla biznesu.

🛠 Wykorzystane technologie

Pentaho Data Integration (PDI) – Spoon, Kitchen

MySQL (XAMPP) – baza danych

CSV, Excel – formaty eksportu

⚙ Jak uruchomić projekt?

Wymagania

Zainstalowany Pentaho Data Integration (PDI)

Zainstalowany XAMPP (MySQL)

Pobranie i zaimportowanie bazy danych (plik .sql dostępny w repozytorium)

Kroki do uruchomienia

Importuj bazę MySQL:

Otwórz phpMyAdmin (localhost/phpmyadmin)

Utwórz bazę danych sprzedaz i zaimportuj plik sprzedaz.sql

Otwórz pliki ETL w Pentaho.
