# ⚡ Servicedesk Quick Actions: Sneltoetsen & CLI One-Liners
*(Keyboard Shortcuts & Fast CLI Commands / اختصارات لوحة المفاتيح وأوامر سطر الأوامر السريعة)*

**Doel (الهدف):** 
Maximale snelheid bij eerstelijns ondersteuning door directe toetsenbordacties en tekstuele CLI-commando's te combineren zonder tijdverlies in menu's.

---

## ⌨️ DEEL 1: Windows Sneltoetsen (اختصارات لوحة المفاتيح الفورية)
Acties die je uitvoert zonder een extra venster of terminal te openen:

| Sneltoets | NL / EN Naam | Praktisch Gebruik (الاستخدام الميداني) |
| :--- | :--- | :--- |
| **`Win + X`** | Quick Link Menu | Het geheime beheerdersmenu: direct naar *Terminal (Admin)*, *Apparaatbeheer* en *Schijfbeheer*. |
| **`Ctrl + Shift + Esc`** | Taakbeheer / Task Manager | Direct vastgelopen processen afsluiten zonder het tussenscherm van `Ctrl + Alt + Del`. |
| **`Win + V`** | Klembordgeschiedenis / Clipboard | Toont de laatste 25 gekopieerde items (ideaal om ticketnummers, foutcodes en hostnames tegelijk te beheren). |
| **`Win + L`** | Vergrendelen / Lock Screen | Direct vergrendelen bij het verlaten van je werkplek (verplicht volgens bedrijfsbeveiliging / *security policy*). |
| **`Win + Shift + S`** | Knipprogramma / Snipping Tool | Snel een screenshot van een foutmelding maken om direct in een ticket te plakken. |

---

## 💻 DEEL 2: CLI One-Liners (`CMD` & `PowerShell`)
Commando's die direct tekstuele output geven of systeemwijzigingen forceren zonder GUI:

### 1. Identificatie & Netwerk (التعريف والشبكة)
| Commando | Wat doet het? | Wanneer gebruik je dit? (متى تستخدمه؟) |
| :--- | :--- | :--- |
| **`hostname`** | Toont de computernaam | Om direct de exacte PC-naam te kopiëren voor een ticket of *Extern bureaublad (RDP)*. |
| **`whoami`** | Toont domein + gebruikersnaam | Controleren onder welk account en domein de gebruiker is ingelogd (`BEDRIJF\gebruiker`). |
| **`ipconfig /flushdns`** | Leegt de lokale DNS-cache | Als een website of interne server net van IP is veranderd maar de PC nog naar het oude adres wijst. |

### 2. Beleid, Systeem & Herstel (السياسات والإصلاح الفوري)
| Commando | Wat doet het? | Wanneer gebruik je dit? (متى تستخدمه؟) |
| :--- | :--- | :--- |
| **`gpupdate /force`** | Groepsbeleid (*Group Policy*) vernieuwen | Forceert de PC om direct nieuwe rechten, netwerkschijven of printers van de server op te halen. |
| **`sfc /scannow`** | System File Checker *(Admin)* | Scant en repareert corrupte Windows-systeembestanden automatisch. |
| **`taskkill /f /im [naam.exe]`** | Proces geforceerd stoppen | Als een programma (bijv. `outlook.exe`) volledig vastzit en zelfs Taakbeheer traag reageert. |
| **`shutdown /r /t 0`** | Direct herstarten (`0` seconden) | Snel herstarten zonder te wachten op trage Windows-afsluitmenu's. |