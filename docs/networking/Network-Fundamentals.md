# 🌐 Netwerk Concepten & IT-Infrastructuur
*(Networking Concepts & Infrastructure / المفاهيم الأساسية للشبكات والبنية التحتية)*

**Doel (الهدف):** 
Een diepgaande kennisbank over hoe netwerken fysiek en logisch zijn opgebouwd, bedoeld als naslagwerk voor de BPV-stage en IT-architectuur. (مرجع هندسي عميق لفهم كيفية بناء الشبكات فيزيائياً ومنطقياً، للرجوع إليه أثناء التدريب العملي).

---

## 🏗️ THEMA 1: Netwerk Infrastructuur (البنية التحتية الفيزيائية)
De fysieke ruggengraat van elk bedrijf. Zonder goede bekabeling faalt de rest van de IT. (العمود الفقري لأي شركة. بدون بنية تحتية سليمة، تنهار كل الأنظمة الأخرى).

### 1. De Patchkast (خزانة الشبكات المركزية)
* **Het Patchpaneel:** Dit is een passief doorgeefluik. Kabels uit de muur (Wall Outlets) van kantoren komen hierin samen. Het organiseert de chaos van kabels. (لوحة التوزيع هي نقطة تجميع سلبية، تأتي إليها الكابلات الممتدة داخل جدران المبنى لتنظيمها قبل ربطها بالأجهزة الذكية).
* **De Switch (المحول):** Het actieve hart van het LAN. Verbindt alle apparaten met elkaar met behulp van korte patchkabels vanaf het patchpaneel. 

### 2. Bekabeling (أنواع الكابلات)
* **UTP (Unshielded Twisted Pair):** Koperkabels (Copper). Gebruikt voor werkplekken binnen een gebouw. Maximale lengte is 100 meter. (كابلات النحاس المجدولة، ممتازة للمسافات القصيرة داخل نفس المبنى).
* **Glasvezel (Fiber Optic):** Gebruikt licht in plaats van elektriciteit. Extreem snel, immuun voor storingen, en gebruikt om switches of gebouwen over lange afstanden te verbinden. (الألياف الضوئية، تنقل البيانات عبر الضوء. نستخدمها لربط السيرفرات ببعضها أو ربط مبنيين لتجنب فقدان الإشارة).

---

## 🧠 THEMA 2: Apparatuur & Logica (الأجهزة والمنطق الشبكي)
Hoe apparaten beslissen waar data heen moet. (كيف تقرر الأجهزة مسار البيانات).

### 1. Hub vs. Switch (الفرق بين الغباء والذكاء)
* **De Hub (Verouderd/Obsolete):** Werkt op **Laag 1**. Hij is 'dom' en stuurt inkomende data simpelweg naar *alle* poorten (Broadcast). Dit veroorzaakt netwerkbotsingen (Collisions).
* **De Switch (Huidige standaard):** Werkt op **Laag 2**. Hij is 'slim' en kijkt naar het **MAC-adres** (het fysieke adres van de netwerkkaart). Hij stuurt de data *alleen* naar de poort waar de ontvanger zit. (المحول ذكي لأنه يمتلك جدولاً بأسماء الأجهزة (MAC Table) ويرسل البيانات للمستلم المعني فقط، مما يوفر سرعة هائلة وأماناً).

### 2. De Router & Default Gateway (الموجه والبوابة الافتراضية)
* Werkt op **Laag 3**. Een router verbindt verschillende netwerken met elkaar (bijv. jouw LAN met het internet WAN).
* **De Default Gateway:** Dit is het IP-adres van de router (bijv. `172.16.0.1`). Als een PC data naar Google wil sturen, en ziet dat Google niet in het lokale netwerk zit, gooit hij de data naar de "Gateway" (de router), die het pad naar buiten kent. (البوابة الافتراضية هي عنوان الروتر. أي بيانات تخرج من شبكتك الداخلية إلى الإنترنت يجب أن تمر عبر هذه البوابة).

### 3. De Firewall (جدار الحماية)
* De beveiliger van het netwerk. Hij inspecteert al het inkomende en uitgaande verkeer (Data Packets) en blokkeert hackers of ongewenste poorten op basis van veiligheidsregels (Access Control Lists). (شرطي المرور الأمني؛ يفحص كل حزمة بيانات ويقرر هل يُسمح لها بالدخول لل
*