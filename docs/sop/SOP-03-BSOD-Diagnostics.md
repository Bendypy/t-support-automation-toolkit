# 🟦 SOP-03: Blue Screen (BSOD) Diagnostiek & Registratie
*(BSOD Troubleshooting & Ticket Documentation / خطة تشخيص الشاشة الزرقاء وتوثيق التذاكر)*

**Doel (الهدف):** 
Systematisch analyseren van een Blue Screen (Kernel-Mode Exception), bewijs verzamelen uit logboeken, en het correct vastleggen van de storing in een ticket.

---

## 🔍 FASE 1: Eerste Controle (الفحص الأولي)
Voer deze stappen uit voordat je iets aanpast aan het systeem:
1. **Noteer de Stopcode:** Schrijf de exacte foutcode op (bijv. `DRIVER_IRQL_NOT_LESS_OR_EQUAL` of `PAGE_FAULT_IN_NONPAGED_AREA`).
2. **Moment van de fout:** Wanneer gebeurde het? (Tijdens opstarten, zware belasting, of willekeurig?).
3. **Recente wijzigingen:** Zijn er recent Windows Updates, nieuwe hardware, of nieuwe drivers geïnstalleerd?

---

## 🛠️ FASE 2: Verdieping & Oplossen (التعمق والحل المتشعب)
Draai eerst `scripts\powershell\Get-BSODReport.ps1` om automatisch bewijs te verzamelen. Kies daarna het juiste pad:

### Pad A: Driver / Software Probleem (مشكلة تعريفات)
* **Bewijs:** Minidump (via *WhoCrashed* of *BlueScreenView*) wijst naar een specifiek `.sys` bestand.
* **Actie:** 
  1. Open `devmgmt.msc` ➔ Zoek het apparaat ➔ **Vorig stuurprogramma** (Roll Back).
  2. *Let op bij Netwerkdrivers:* Download eerst een stabiele versie voordat je de oude verwijdert!
  3. Start indien nodig op in **Veilige Modus (Safe Mode)**.

### Pad B: Hardware Probleem (مشكلة عتاد)
* **Bewijs:** Willekeurige stopcodes onder belasting, of `MEMORY_MANAGEMENT` fouten.
* **Actie:** Voer een geheugentest uit (`mdsched.exe` of *Memtest86+*) en controleer RAM-stabiliteit/voltage in de BIOS.

### Pad C: Escalatie (التصعيد للفريق الأعلى)
Als de oorzaak onduidelijk blijft, **escaleer** het ticket naar 2e-lijns support met het `.dmp` bestand uit `C:\Windows\Minidump` als bijlage.

---

## 📝 FASE 3: Ticketregistratie (ماذا تكتب في ورقة المشاكل؟)
Gebruik deze structuur voor collega's of je stagebegeleider:

* **Klacht / Symptoom:** PC crasht met BSOD (Stopcode: `[vul in]`) op `[datum/tijd]` tijdens `[activiteit]`.
* **Onderzoek:** `Logboeken` (Event ID 1001/41) en `Minidump` gecontroleerd. Laatste wijziging: `[update/driver]`. Verdachte module: `[bijv. nvnetfd.sys]`.
* **Uitgevoerde Acties:** 
  1. Rapport gedraaid via `Get-BSODReport.ps1`.
  2. Stuurprogramma `[naam]` teruggedraaid / opnieuw geïnstalleerd.
* **Resultaat / Status:** Systeem getest onder belasting, geen nieuwe crashes. *(Of: Geëscaleerd naar 2e lijn met minidump-bijlage).*
*