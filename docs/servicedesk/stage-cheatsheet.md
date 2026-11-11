# 🚀 Stage Cheatsheet: Dagelijkse ICT-Routines & Troubleshooting
*Uitgebreide referentie voor netwerk, hardware, en systeembeheer (NL / EN / AR).*

---

## 1. 🌐 Netwerk Diagnose (Network Diagnostics - تشخيص الشبكات)
*Commando's voor het opsporen van netwerkfouten via de Command Prompt (CMD).*

* **`ipconfig /all`**
  * **🇳🇱 NL:** Toont volledige netwerkconfiguratie (IP, Subnet, Gateway, MAC-adres).
  * **🇬🇧 EN:** Displays full network configuration details.
  * **🇸🇦 AR:** يعرض كل تفاصيل الشبكة بما فيها العنوان الفيزيائي (MAC) والـ DNS.
* **`ping 8.8.8.8`**
  * **🇳🇱 NL:** Test de verbinding met een externe server (Google DNS).
  * **🇬🇧 EN:** Tests connectivity to an external server.
  * **🇸🇦 AR:** يفحص الاتصال بالإنترنت الخارجي.
* **`tracert 8.8.8.8`**
  * **🇳🇱 NL:** Traceert de route van pakketten; laat zien waar de verbinding uitvalt.
  * **🇬🇧 EN:** Traces the packet route to identify where the connection drops.
  * **🇸🇦 AR:** يتتبع مسار الاتصال لمعرفة أين ينقطع الإنترنت (في الروتر أم من مزود الخدمة).
* **`ipconfig /release` & `ipconfig /renew`**
  * **🇳🇱 NL:** Geeft het huidige IP vrij en vraagt een nieuwe aan bij de DHCP.
  * **🇬🇧 EN:** Releases the current IP and requests a new one from the DHCP server.
  * **🇸🇦 AR:** يمسح الـ IP الحالي ويجبر الجهاز على سحب IP جديد من السيرفر.

> ⚠️ **Let op (Waarschuwing / انتبه دائماً):**
> * **Firewall Block:** Als `ping` "Request timed out" geeft, controleer dan eerst de **Windows Firewall**. Deze blokkeert standaard ICMP (ping) pakketten! (جدار حماية ويندوز يمنع أوامر البينج افتراضياً، عطّله مؤقتاً للفحص).
> * **Static IP Conflict:** Geef nooit een handmatig (Static) IP-adres uit dat binnen de DHCP-pool (uitdeel-reeks) van de router valt, anders krijg je IP-conflicten! (لا تضع IP ثابت لجهاز إذا كان هذا الرقم موجوداً ضمن النطاق الذي يوزعه الروتر تلقائياً).

---

## 2. 🖧 Patchkast & Server Aansluitplan (Cabling & Infrastructure - البنية التحتية)

* **Kleurcodes (Color Coding - التمييز اللوني)**
  * **🇳🇱 NL:** Gebruik altijd een vaste kleur (bijv. Blauw=PC, Rood=Server).
  * **🇬🇧 EN:** Use standard colors for different connections.
  * **🇸🇦 AR:** استخدم ألوان كابلات ثابتة (مثلاً الأزرق للموظفين، والأحمر للسيرفرات).
* **Patchpaneel vs Switch (Patch Panel - لوحة التوزيع)**
  * **🇳🇱 NL:** Stugge kabels (in de muur) gaan naar het patchpaneel. Soepele patchkabels verbinden het paneel met de switch.
  * **🇬🇧 EN:** Solid cables go to the patch panel; stranded patch cables connect to the switch.
  * **🇸🇦 AR:** الكابلات الصلبة التي داخل الجدران تُربط بلوحة التوزيع لحمايتها، ونستخدم كابلات مرنة وقصيرة لربطها بالسويتش لسهولة الصيانة.

> ⚠️ **Let op (Waarschuwing / انتبه دائماً):**
> * **Looping (Loopback):** Verbind NOOIT twee poorten van dezelfde switch met elkaar via één kabel. Dit veroorzaakt een "Broadcast Storm" en legt het hele netwerk plat! (إياك أن توصل كابلاً بين منفذين في نفس السويتش، سيؤدي ذلك لعاصفة بيانات تسقط الشبكة بالكامل).

---

## 3. 💾 Back-up Procedures (Data Backup - النسخ الاحتياطي)

* **Gebruikersmap (User Directory - مجلد المستخدم)**
  * **🇳🇱 NL:** Kopieer altijd `C:\Users\[Naam]\` (Desktop, Documents, Downloads).
  * **🇬🇧 EN:** Always back up the primary user profile folders.
  * **🇸🇦 AR:** انسخ دائماً مجلدات سطح المكتب والمستندات والتنزيلات قبل فرمتة الجهاز.
* **E-mail (Thunderbird / Outlook - البريد الإلكتروني)**
  * **🇳🇱 NL:** Kopieer de verborgen map via `%appdata%\Thunderbird`.
  * **🇬🇧 EN:** Copy the hidden profile folder in AppData for Thunderbird.
  * **🇸🇦 AR:** ملفات الإيميل مخفية. استخدم `Win + R` واكتب `%appdata%` للوصول لمجلد Thunderbird ونسخه بالكامل.
* **Systeem Image (System Clone - استنساخ النظام)**
  * **🇳🇱 NL:** Gebruik tools zoals EaseUS Todo Backup voor een volledige bit-voor-bit kopie.
  * **🇬🇧 EN:** Use cloning tools for a complete sector-by-sector backup.
  * **🇸🇦 AR:** استخدم برامج مثل EaseUS لأخذ نسخة مطابقة للقرص الصلب تحسباً لأي طارئ.

> ⚠️ **Let op (Waarschuwing / انتبه دائماً):**
> * **Locked Files:** Zorg dat Outlook of Thunderbird volledig is afgesloten (check Taakbeheer/Task Manager) voordat je de back-up start, anders raakt het e-mailbestand corrupt! (تأكد من إغلاق برامج الإيميل من مدير المهام قبل نسخ بياناتها وإلا ستتلف الملفات).

---

## 4. 🖥️ Moederbord & Firmware (Motherboard & Boot - اللوحة الأم والإقلاع)

* **POST (Power-On Self-Test - الفحص الذاتي)**
  * **🇳🇱 NL:** Hardwarecontrole vóór het booten. Let op foutsignalen (Beep Codes).
  * **🇬🇧 EN:** Hardware diagnostic test run before booting.
  * **🇸🇦 AR:** فحص العتاد قبل الإقلاع. الصافرات تدل على أعطال الرام أو المعالج.
* **UEFI / BIOS (Firmware - النظام الأساسي)**
  * **🇳🇱 NL:** Moederbord software. UEFI is de moderne, veilige standaard.
  * **🇬🇧 EN:** Low-level firmware. UEFI replaces legacy BIOS.
  * **🇸🇦 AR:** نظام اللوحة الأم لتعديل إعدادات الأمان والإقلاع.
* **Boot Sequence (Opstartvolgorde - ترتيب الإقلاع)**
  * **🇳🇱 NL:** Bepaalt of de PC opstart via USB, SSD, of Netwerk (PXE).
  * **🇬🇧 EN:** The order of devices checked to load the OS.
  *