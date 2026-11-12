# 🛠️ SOP-02: Snelle Toegang & Cloud Script Executie
*(SOP: Remote Script Execution & Quick Repo Access / خطة التشغيل السحابي والوصول السريع)*

**Doel (الهدف):** 
Snel toegang krijgen tot de IT-Toolkit zonder in te loggen, en scripts direct uitvoeren op client-pc's zonder beveiligingswaarschuwingen. (الوصول السريع للمكتبة بدون تسجيل دخول، وتشغيل السكربتات على أجهزة الموظفين وتخطي الحماية بأمان).

---

## 🚀 DEEL 1: Snelle Toegang tot de Repository (الوصول السريع للمكتبة)
Zoek NOOIT via de algemene GitHub zoekbalk naar je eigen repo! (لا تستخدم شريط بحث قيت هاب أبداً لأنه يبحث عن المشاريع المشهورة فقط).

* **De Actie (الطريقة الصحيحة):** 
  Typ de directe URL in de adresbalk van de browser (اكتب الرابط المباشر في المتصفح):
  👉 `https://github.com/Bendypy/it-support-automation-toolkit`
* **Raw Link Krijgen (الحصول على الرابط الخام للسكربت):** 
  Open het `.ps1` bestand ➔ Klik op **Raw** ➔ Kopieer de URL uit de adresbalk. (افتح الملف، اضغط على Raw، وانسخ الرابط من الأعلى).

---

## ☁️ DEEL 2: Scripts Uitvoeren (طرق تشغيل السكربتات)

### Methode A: Direct in RAM (Fileless Execution / التشغيل المباشر في الذاكرة)
De snelste "Hacker-stijl" methode. Laat geen sporen achter op de harde schijf. (الطريقة الأسرع، لا تترك أي ملفات على الجهاز).
* **Commando:** `irm 'RAW_URL' | iex`
* **Wanneer gebruiken?** Als de PC geen zware Windows Defender restricties heeft. (استخدمها إذا لم يكن الويندوز مقفلاً بحماية صارمة).

### Methode B: De Temp Workaround (De Veilige Download / خدعة التحميل المؤقت)
Als Methode A faalt (zoals bij AMSI-blokkades), download het script tijdelijk en omzeil de blokkade. (إذا فشلت الطريقة الأولى، نحمل السكربت في مجلد Temp المخفي ونشغله بتخطي الحماية).
* **Commando 1 (Downloaden):** 
  `irm 'RAW_URL' -OutFile "$env:TEMP\script.ps1"`
* **Commando 2 (Uitvoeren & Omzeilen):** 
  `powershell -ExecutionPolicy Bypass -File "$env:TEMP\script.ps1"`

### Methode C: USB / Lokale Bypass (تشغيل السكربتات من الفلاشة)
Als je scripts vanaf een USB-stick draait, breek dan nooit de veiligheid van de hele PC! (إذا كنت تستخدم فلاشة، لا تكسر حماية الجهاز بالكامل).
* **Commando:** 
  `Set-ExecutionPolicy Bypass -Scope Process -Force`
* **Uitleg:** Dit staat scripts toe *alleen in dit venster*. Zodra PowerShell sluit, is de PC weer veilig. (هذا يسمح بتشغيل السكربتات في هذه النافذة فقط، وبمجرد إغلاقها يعود الويندوز آمناً).

---

## 🛑 DEEL 3: Foutoplossing (Troubleshooting / حل المشاكل)

* ❌ **Fout:** Rode tekst met `iex` / AMSI Blocked.
  * **Oorzaak:** Windows Defender ziet de Fileless executie als een bedreiging. (جدار الحماية اعتبر التشغيل المباشر تهديداً).
  * **Oplossing:** Gebruik **Methode B** (Temp Workaround).
* ❌ **Fout:** "cannot be loaded because running scripts is disabled".
  * **Oorzaak:** Execution Policy staat op Restricted. (سياسة تشغيل السكربتات مقفلة).
  * **Oplossing:** Gebruik **Methode C** voor USB, of **Methode B** voor Cloud.