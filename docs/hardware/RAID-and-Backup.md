# 💾 RAID & Back-up Architectuur
*(RAID vs. Back-up & Redundancy / الفرق المعماري بين مصفوفات الأقراص والنسخ الاحتياطي)*

**Kernregel (القاعدة الذهبية):** 
> **RAID vervangt nooit een back-up.** (نظام RAID لا يعوّض أبداً عن النسخ الاحتياطي).

---

## ⚖️ 1. Wat lost elk systeem op? (ماذا يحل كل نظام؟)

| Kenmerk | RAID | Back-up |
| :--- | :--- | :--- |
| **Hoofddoel (الهدف)** | **Beschikbaarheid** (استمرارية العمل دون توقف). | **Herstel** (استعادة البيانات المفقودة أو التالفة). |
| **Beschermt tegen (يحمي من)** | Fysieke **schijfuitval** (تعطل قرص صلب فجأة). | **Verwijderen** (حذف)، **beschadiging** (تلف)، **ransomware**، of **verlies van het hele systeem** (احتراق/سرقة الجهاز). |
| **Werking (آلية العمل)** | Real-time mirroring of pariteit tussen schijven. | Periodieke kopie op een aparte locatie (extern / cloud). |

---

## 🧱 2. Belangrijkste RAID-vormen (أشهر مستويات RAID)
*Let op: Niet iedere RAID-vorm heeft redundantie!* (ليس كل نوع RAID يوفر حماية وتكراراً للبيانات).

* **RAID 0 (Striping — Geen redundantie):**
  * **Minimaal:** 2 schijven.
  * **Werking:** Verdeelt data over beide schijven voor maximale snelheid (`prestaties`).
  * **Risico:** Als 1 schijf uitvalt, is **alle data verloren**.
* **RAID 1 (Mirroring — Wel redundantie):**
  * **Minimaal:** 2 schijven.
  * **Werking:** Schrijft exact dezelfde data naar beide schijven (`spiegelen`).
  * **Capaciteit:** 50% van de totale schijfruimte (bijv. 2x 1TB = 1TB bruikbaar).
* **RAID 5 (Striping met Pariteit — Wel redundantie):**
  * **Minimaal:** 3 schijven.
  * **Werking:** Verdeelt data + herstelinformatie (`pariteit`) over alle schijven. Mag maximaal 1 schijf verliezen zonder dataverlies.
* **RAID 10 (RAID 1 + 0 — Snelheid + Redundantie):**
  * **Minimaal:** 4 schijven.
  * **Werking:** Combineert de snelheid van RAID 0 met de veiligheid van RAID 1.