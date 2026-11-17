# 🌐 Netwerk Basis & Examen Kennisbank
*(Networking Fundamentals & Exam Knowledge Base / أساسيات الشبكات ومرجع الامتحانات)*

**Doel (الهدف):** 
Een snelle referentie voor netwerkconcepten, hardware, en het OSI-model. (مرجع سريع لمفاهيم الشبكات، العتاد، ونموذج OSI لحل المشاكل الميدانية).

---

## 🏗️ DEEL 1: Netwerk Hardware & Infrastructuur (العتاد والبنية التحتية)

### 1. Waar lopen de kabels die achter een outlet (muurpoort) zitten heen?
* **Antwoord (الإجابة):** Naar het **Patchpaneel** in de Patchkast (Serverruimte), en vanaf daar met een korte kabel naar de **Switch**.
* **Why? (لماذا؟):** 
  * **EN:** Wall outlets route cables through the building directly to the patch panel to keep wiring organized before connecting to the active switch.
  * **AR:** مقبس الحائط يمرر الكابل داخل الجدران ليصل إلى لوحة التوزيع (Patch panel) في خزانة السيرفرات، ومن هناك نربطه بالمحول (Switch) كما فعلت في تدريبك العملي[span_1](start_span)[span_1](end_span).

### 2. Hub vs Switch (De misleidende stelling)
* **Stelling in examen:** "Een Hub maakt gebruik van MAC adressen... en een Switch kijkt niet naar de zender en ontvanger."
* **Antwoord (الإجابة):** **ONWAAR (FALSE / خطأ تماماً)**. Het is precies andersom!
* **Why? (لماذا؟):** 
  * **EN:** A Switch is smart; it uses a MAC address table to send data *only* to the correct recipient. A Hub is dumb; it broadcasts data to everyone.
  * **AR:** المحول (Switch) ذكي لأنه يحفظ عناوين הـ MAC ليرسل البيانات للجهاز المقصود فقط، بينما الـ Hub غبي يرسل البيانات لجميع المنافذ (وهذا ما تعلمته عند تصميم مخطط الشبكة في Visio).

### 3. Wat is de primaire functie van een firewall?
* **Antwoord (الإجابة):** Het filteren en blokkeren van inkomend en uitgaand netwerkverkeer op basis van veiligheidsregels.
* **Why? (لماذا؟):** 
  * **EN:** It acts as a security guard between the internal LAN and the external internet, stopping unauthorized access.
  * **AR:** تعمل كحارس أمن يفحص البيانات الداخلة والخارجة، وتمنع المتسللين من دخول الشبكة الداخلية.

### 4. Welke kabel gebruik je in welke situatie?
* **Antwoord (الإجابة):** 
  * **UTP (Koper):** Voor LAN verbindingen binnen een gebouw (tot 100 meter).
  * **Glasvezel (Fiber):** Voor lange afstanden en extreem hoge snelheden tussen gebouwen of servers.
* **Why? (لماذا؟):** 
  * **AR:** كابلات النحاس (UTP) رخيصة وممتازة للمكاتب، بينما الألياف الضوئية (Fiber) تنقل البيانات بسرعة الضوء لمسافات طويلة دون فقدان الإشارة.

---

## 📡 DEEL 2: Protocollen & IP-Configuratie (البروتوكولات والعناوين)

### 5. Wat is een shared folder?
* **Antwoord (الإجابة):** Een map op een server of PC die toegankelijk is voor meerdere gebruikers in hetzelfde netwerk.
* **Why? (لماذا؟):** 
  * **EN:** It allows users to collaborate and share files centrally instead of emailing them.
  * **AR:** مجلد موجود على الشبكة يسمح للموظفين بتبادل الملفات، تماماً مثل مجلد "Data" الذي أنشأته وشاركته على أجهزة Windows و QNAP NAS.

### 6. Wat is het doel van het tooltje Ping?
* **Antwoord (الإجابة):** Controleren of een ander apparaat op het netwerk bereikbaar is (Connectiviteit testen) en de reactietijd meten.
* **Why? (لماذا؟):** 
  * **AR:** يرسل حزم بيانات صغيرة وينتظر الرد ليتأكد من وجود اتصال، كما استخدمته لفحص الوصول إلى سيرفر الـ FTP وعناوين الأجهزة الأخرى[span_2](start_span)[span_2](end_span).

### 7. Wat zijn andere namen voor het MAC address?
* **Antwoord (الإجابة):** Hardware address (Hardware adres) of Physical address (Fysiek adres).
* **Why? (لماذا؟):** 
  * **AR:** لأنه عنوان محفور فيزيائياً داخل كارت الشبكة (NIC) من قِبل المصنع ولا يمكن تغييره بسهولة، عكس عنوان الـ IP الذي يتغير.

### 8. Welk onderdeel van een IP configuratie geeft aan wat het adres van de router is?
* **Antwoord (الإجابة):** De **Default Gateway (Standaardgateway)**.
* **Why? (لماذا؟):** 
  * **AR:** البوابة الافتراضية هي عنوان الروتر الذي يأخذ بياناتك من الشبكة الداخلية ويخرجها للإنترنت (مثل العنوان 172.16.0.1 الذي قمت بضبطه في التدريب)[span_3](start_span)[span_3](end_span).

### 9. Welke IP adressen mag je gebruiken in een LAN omgeving?
* **Antwoord (الإجابة):** Private IP adressen (Privé-adressen).
* **Why? (لماذا؟):** 
  * **EN:** Ranges like 192.168.x.x, 172.16.x.x, or 10.x.x.x are reserved for local networks and cannot be routed on the public internet.
  * **AR:** عناوين خاصة لا تظهر على الإنترنت، مثل العناوين (192.168.1.10 و 172.16.0.10) التي أعددتها في مختبراتك السابقة[span_4](start_span)[span_4](end_span)[span_5](start_span)[span_5](end_span).

*(Opmerking voor foto-vragen: Een afbeelding van een router toont meestal Switch-poorten, een WAN-poort, en Wi-Fi antennes. Een server-dienst afbeelding toont vaak DHCP voor automatische IP's, of DNS voor het omzetten van namen naar IP's).*

---

## 🥞 DEEL 3: Het OSI Model (نموذج OSI للشبكات)
Het OSI model helpt IT'ers om netwerkproblemen stap voor stap te isoleren. (نموذج وهمي من 7 طبقات يساعد المهندس على تحديد مكان العطل).

1. **Laag 1: Physical (Fysieke laag) ➔ Bits**
   * **Wat past hierbij?** Kabels (UTP, Fiber), Hubs, en elektrische signalen (0 en 1).
   * **AR:** الطبقة الفيزيائية (الكابلات، المحولات القديمة Hubs، والإشارات الكهربائية).
2. **Laag 2: Data Link (Datalinklaag) ➔ Frames**
   * **Wat past hierbij?** MAC-adressen en Switches. 
   * **AR:** طبقة ربط البيانات (هنا تعمل المحولات ذكية Switches وعناوين الـ MAC).
3. **Laag 3: Network (Netwerklaag) ➔ Packets**
   * **Wat past hierbij?** IP-adressen en Routers. 
   * *(Antwoord op examenvraag: Op Laag 3 wordt het IP-adres toegevoegd aan een datapakket).*
   * **AR:** طبقة الشبكة (هنا يتم إضافة عنوان الـ IP لحزمة البيانات، وهنا يعمل الروتر).
4. **Laag 4: Transport (Transportlaag) ➔ Segments**
   * **Wat past hierbij?** TCP (betrouwbaar) en UDP (snel, voor video/gaming).
5. **Laag 5: Session (Sessielaag)**
   * **Wat past hierbij?** Het opbouwen en afsluiten van de verbinding.
6. **Laag 6: Presentation (Presentatielaag)**
   * **Wat past hierbij?** Encryptie (SSL/TLS) en data-opmaak (JPEG, ASCII).
7. **Laag 7: Application (Applicatielaag)**
   * **Wat past hierbij?** Wat de gebruiker ziet: HTTP (Web), FTP (Bestanden), SMTP (Email).