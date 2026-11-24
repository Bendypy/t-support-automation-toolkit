# 🗂️ Veilig werken met het Windows-register (`regedit`)
*(Working Safely with the Windows Registry / العمل الآمن مع سجل نظام ويندوز)*

**Waarschuwing (تحذير):** 
> Een willekeurige registerwijziging kan Windows of software onbruikbaar maken. Werk alleen met een **bekende sleutel** en een **duidelijke instructie**.

---

## 🛡️ 1. De 4 Veiligheidsstappen (خطوات الأمان الأربع)
Voer deze stappen altijd in deze volgorde uit:
1. **Back-up maken:** Maak een *herstelpunt* (`sysdm.cpl`) of **exporteer de sleutel** (`.reg` bestand) vóór je iets aanpast.
2. **Oude waarde noteren:** Schrijf de oorspronkelijke waarde op.
3. **Eén instelling wijzigen:** Pas nooit meerdere sleutels tegelijk aan, zodat je de oorzaak van eventuele fouten direct weet.
4. **Testen en terugdraaien:** Test de wijziging; bij problemen dubbelklik je op het geëxporteerde `.reg` bestand om terug te draaien.

---

## 🏗️ 2. Architectuur & Belangrijkste Hives (البنية البرمجية)
Het register is een hiërarchische *Key-Value database* voor systeem- en gebruikersinstellingen:

* **`HKEY_LOCAL_MACHINE` (`HKLM`):** Instellingen voor de gehele PC (hardware, drivers, services — geldt voor **alle gebruikers**).
* **`HKEY_CURRENT_USER` (`HKCU`):** Instellingen alleen voor de **huidige ingelogde gebruiker**.
* **`HKEY_CLASSES_ROOT` (`HKCR`):** Bestandskoppelingen (bijv. welk programma een `.txt` of `.ps1` opent).

**Veelvoorkomende Waardetypen (Data Types):**
* `REG_SZ` = Tekst (`String`)
* `REG_DWORD` = 32-bit getal (vaak `0` = Uit / `1` = Aan)
*