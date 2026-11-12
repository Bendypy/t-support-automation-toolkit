# 🛠️ SOP-01: Diagnose en Herstel van een Trage PC
*(SOP: Standard Operating Procedure / خطة العمل القياسية للتعامل مع بطء الأجهزة)*

**Wanneer gebruik je dit? (متى نستخدم هذه الخطة؟):** 
Als een gebruiker meldt dat Windows traag is, programma's vastlopen, of het opstarten lang duurt. (عندما يشتكي الموظف من بطء ويندوز أو تجمد البرامج).

---

## 🟢 STAP 1: Informatie Verzamelen (جمع المعلومات)
Gok nooit, meet altijd! (لا تخمن أبداً، افحص الأرقام أولاً).
* **Actie:** Voer het script `scripts\powershell\Get-SystemReport.ps1` uit.
* **Beoordeel de resultaten (شجرة القرارات بناءً على التقرير):**
  * ➔ **Scenario A:** Disk C: is rood (Minder dan 15GB vrij). Ga naar **STAP 2A**.
  * ➔ **Scenario B:** RAM 'Beschikbaar' is bijna 0 GB. Ga naar **STAP 2B**.
  * ➔ **Scenario C:** Hardware is prima, maar PC is nog steeds traag. Ga naar **STAP 2C**.

---

## 🟡 STAP 2: Actie en Oplossing (تنفيذ الحلول حسب السيناريو)

### Scenario A: Opslag is vol (القرص C ممتلئ)
Windows heeft minimaal 10-15% vrije ruimte nodig op de C-schijf voor de "Pagefile" (geheugen op de schijf). 
* **Oplossing (الحل):** 
  Voer het script `Setup-Workstation.ps1` uit (Specifiek het Opschonen-deel) om de Temp-mappen te legen.
* **Foutafhandeling (ماذا لو لم تُحل المشكلة؟):** 
  Als het script niet genoeg ruimte vrijmaakt, open dan **TreeSize Free** of Windows Opslaginstellingen om te zoeken naar grote persoonlijke bestanden en laat de gebruiker deze verplaatsen.

### Scenario B: RAM is vol (الذاكرة ممتلئة)
De gebruiker heeft waarschijnlijk te veel zware applicaties open (bijv. 30 Chrome tabbladen + VMware).
* **Oplossing (الحل):** 
  Open Taakbeheer (`Ctrl + Shift + Esc`). Kijk welk proces het meeste RAM verbruikt. Sluit dit proces (Task Kill).
* **Foutafhandeling (ماذا لو تكررت المشكلة يومياً؟):** 
  Maak een notitie in het ticketsysteem (bijv. TOPdesk) dat de gebruiker een RAM-upgrade nodig heeft (Hardware Request).

### Scenario C: Verborgen Malware of Corruptie (فيروسات أو ملفات تالفة)
Als hardware goed is, is het probleem softwarematig (Malware of kapotte Windows bestanden).
* **Oplossing (الحل):**
  1. Voer `Scan-Malware.ps1` uit voor een diepe virusscan.
  2. Open CMD als Administrator en typ: `sfc /scannow` (Systeemherstel voor corrupte bestanden).
* **Foutafhandeling (ماذا لو فشل فحص SFC؟):**
  Voer het DISM-commando uit om de image te herstellen: `DISM /Online /Cleanup-Image /RestoreHealth`.

---

## 🔴 STAP 3: Afronding en Ticketing (إغلاق التذكرة)
Nadat het probleem is opgelost:
1. Laat de gebruiker de PC herstarten.
2. Vraag of de snelheid is verbeterd.
3. Sluit de melding in het ticketsysteem met de beschrijving van de uitgevoerde actie. (سجل خطواتك في التذكرة ليعرف المدير ما فعلت).
4.