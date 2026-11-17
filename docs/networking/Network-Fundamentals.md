# 🌐 Netwerk Architectuur & Diagnostiek
*(Network Architecture & Diagnostics / الهندسة المعمارية للشبكات والتشخيص)*

**Doel (الهدف):** 
Een complete naslaggids voor netwerkcomponenten, IP-configuraties en troubleshooting (Ping, Tracert, IPConfig) voor de BPV-stage. (دليل مرجعي كامل لمكونات الشبكات، إعدادات الـ IP، واكتشاف الأخطاء لحل مشاكل التدريب العملي).

---

## 🏗️ THEMA 1: Infrastructuur & Bekabeling (البنية التحتية)

### 1. Kabels en Connectoren (الكابلات والموصلات)
* **UTP-kabel:** Bevat **8 aders** verdeeld over **4 getwiste paren** (أربع أزواج مجدولة لتقليل التشويش)[span_2](start_span)[span_2](end_span). De standaard stekker is de **RJ45**[span_3](start_span)[span_3](end_span).
  * **Straight-through:** De moderne standaard voor verbindingen tussen PC en Switch. (الكابل العادي لربط الأجهزة بالمحولات)[span_4](start_span)[span_4](end_span).
  * **Cross-over:** Historisch gebruikt voor directe PC-tot-PC verbindingen (تاريخياً كان يستخدم لربط جهازين معاً مباشرة)[span_5](start_span)[span_5](end_span).
* **Glasvezel (Fiber):** Werkt met licht in plaats van stroom (يعمل بالضوء). Het is extreem snel, ongevoelig voor storingen, maar kwetsbaar bij scherp buigen (سريع جداً ومقاوم للتشويش، لكنه ينكسر إذا تم ثنيه بقوة)[span_6](start_span)[span_6](end_span).

### 2. De Patchkast (خزانة الشبكة)
* **Cable Management:** Nette kabels en labels in de patchkast versnellen het onderhoud en het oplossen van storingen. (ترتيب الكابلات ووضع الملصقات يسرع من اكتشاف الأعطال وحلها)[span_7](start_span)[span_7](end_span).
* **De Route:** Een goede IT'er volgt de kabel van de **Outlet (muur)** ➔ **Bekabeling (gebouw)** ➔ **Patchpanel** ➔ **Switch**[span_8](start_span)[span_8](end_span).

---

## 🧠 THEMA 2: Apparatuur & Logica (الأجهزة والمنطق)

### 1. Netwerkkaarten en Adressen
* **NIC (Network Interface Card):** De netwerkkaart (bekabeld of wifi) die data verzendt en ontvangt (كارت الشبكة الذي يرسل ويستقبل البيانات)[span_9](start_span)[span_9](end_span).
* **MAC-adres vs. IP-adres:**
  * **MAC-adres:** Fysiek adres (bijv. `08:00:27:CE:75:FE`). Werkt op Laag 2. Wordt door **Switches** gebruikt voor verkeer *binnen* het LAN[span_10](start_span)[span_10](end_span).
  * **IP-adres:** Logisch adres (bijv. `192.168.1.34`). Werkt op Laag 3. Wordt door **Routers** gebruikt voor communicatie *tussen* netwerken[span_11](start_span)[span_11](end_span).

### 2. Switch vs. Hub vs. Router
* **Hub:** Dom apparaat. Stuurt ontvangen data naar *alle* poorten (غبي، يرسل البيانات لكل المنافذ)[span_12](start_span)[span_12](end_span).
* **Switch:** Slim apparaat. Stuurt frames naar de juiste poort op basis van het **MAC-adres** (ذكي، يرسل البيانات للمنفذ الصحيح بناءً على عنوان الـ MAC)[span_13](start_span)[span_13](end_span).
* **Router:** Stuurt pakketten tussen verschillende netwerken (bijv. van LAN naar WAN). (يربط بين شبكتك الداخلية والإنترنت)[span_14](start_span)[span_14](end_span).

---

## 📡 THEMA 3: IP-Configuratie (إعدادات العناوين)

### 1. IPv4, IPv6 en NAT
* **IPv4:** 32 bits lang (ongeveer 4,3 miljard adressen)[span_15](start_span)[span_15](end_span).
* **IPv6:** 128 bits lang (veel grotere adresruimte)[span_16](start_span)[span_16](end_span).
* **Privéranges (IPv4):** `10.0.0.0/8`, `172.16.0.0/12`, en `192.168.0.0/16`[span_17](start_span)[span_17](end_span). Deze adressen zijn onzichtbaar op het internet.
* **NAT (Network Address Translation):** Vertaalt de privé IP-adressen van het LAN naar één publiek IP-adres op de router om op internet te surfen (التقنية التي تترجم عناوين أجهزة الشركة الداخلية إلى عنوان واحد خارجي للإنترنت)[span_18](start_span)[span_18](end_span).

### 2. Subnetting en Services
* **Subnetmasker:** Bepaalt welk deel van het IP-adres het **Network ID** (Netwerk) is, en welk deel de **Host ID** (Apparaat) is (يحدد أي جزء من العنوان يمثل الشبكة، وأي جزء يمثل الجهاز)[span_19](start_span)[span_19](end_span).
* **DHCP:** Geeft apparaten automatisch een IP-adres, subnetmasker, default gateway en DNS-server (يوزع العناوين والإعدادات آلياً)[span_20](start_span)[span_20](end_span).
* **DNS:** Vertaalt namen (zoals *ict-flex.nl*) naar IP-adressen (zoals *77.72.149.240*) (يحول أسماء المواقع إلى أرقام IP)[span_21](start_span)[span_21](end_span).

---

## 🛠️ THEMA 4: Troubleshooting Tools (أدوات التشخيص للمهندسين)
*(Gebruik de Command Prompt (CMD) of PowerShell)*

1. **`ipconfig /all` (Windows) of `ip a` (Linux):** 
   Laat de huidige netwerkconfiguratie zien (IP, Subnet, Gateway, MAC)[span_22](start_span)[span_22](end_span).
2. **`ping 8.8.8.8`:** 
   Test bereikbaarheid, reactietijd (ms) en pakketverlies (يختبر الوصول للهدف، ويقيس سرعة الاستجابة وفقدان البيانات)[span_23](start_span)[span_23](end_span).
3. **`tracert ict-flex.nl` (Trace Route):** 
   Toont via welke routers (hops) een pakket reist. Perfect om te zien *waar* de verbinding precies wegvalt (يظهر لك كل الروترات التي تمر بها البيانات، ممتاز لمعرفة أين انقطع الاتصال بالضبط)[span_24](start_span)[span_24](end_span).
4. **Het OSI-Model in Troubleshooting:**
   Als er geen "Link-lampje" brandt op de netwerkkaart, controleer je Laag 1 (Fysiek / Kabel). Als er een verkeerd IP-adres is, controleer je Laag 3 (Netwerk / DHCP)[span_25](start_span)[span_25](end_span).