# 💿 Schijfbeheer (`diskmgmt.msc`) — Keuzes & Valkuilen
*(Disk Management Options & Pitfalls / خيارات إدارة الأقراص وفخاخها الشائعة)*

**Doel:** Begrijpen welke opties je kiest bij het inrichten van schijven in plaats van blind op *Volgende* te klikken.

---

## 1. Initialiseren: GPT vs. MBR
* **GPT (Standaard):** Voor alle moderne UEFI-systemen. Ondersteunt schijven **> 2 TB** en tot 128 partities.
* **MBR (Verouderd):** Alleen voor oude Legacy BIOS-systemen. **Limiet:** Maximaal 2 TB en maximaal 4 primaire partities.

## 2. Volume & Bestandssysteem Kiezen
* **Volume Type:** Kies voor een enkele schijf altijd **Eenvoudig volume (Simple Volume)**.
* **Bestandssysteem:**
  * **`NTFS`:** Standaard voor interne Windows-schijven (ondersteunt bestandsrechten en grote bestanden).
  * **`exFAT`:** Ideaal voor USB-sticks/SD-kaarten (werkt op Windows én macOS, geen 4 GB limiet).
  * **`FAT32`:** Verouderd (maximaal 4 GB per bestand).
* **Clustergrootte:** Altijd op **Standaard** laten staan.

## 3. Regels voor Verkleinen / Uitbreiden & Veiligheid
* **Uitbreiden (`Extend`):** Werkt alleen als de *Niet-toegewezen ruimte* **direct rechts** naast het volume ligt.
* **Veiligheidsregel:** Laat **EFI- en herstelpartities** altijd met rust[span_6](start_span)[span_6](end_span); verwijderen maakt Windows onopstartbaar.
*