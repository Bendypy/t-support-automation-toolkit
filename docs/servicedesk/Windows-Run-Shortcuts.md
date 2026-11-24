# ⚡ Windows Run (`Win + R`) Snelkoppelingen
*(Windows Run Shortcuts / اختصارات نافذة التشغيل السريع)*

**Doel (الهدف):** 
Direct toegang krijgen tot systeemtools zonder te zoeken in Windows-menu's. (الوصول المباشر لأدوات النظام دون البحث في قوائم ويندوز المتغيرة).

**Architectuur (النمط البرمجي):**
* `.cpl` = Control Panel (لوحة التحكم الكلاسيكية)
* `.msc` = Microsoft Management Console (أدوات إدارة النظام العميقة)
* `shell:` / `%...%` = Systeemmappen (مجلدات النظام المخفية)

---

## 🛠️ 1. Systeem & Hardware (النظام والعتاد)
| Commando | NL / EN Naam | Gebruik (الاستخدام الميداني) |
| :--- | :--- | :--- |
| **`sysdm.cpl`** | Systeemeigenschappen / System Properties | PC-naam wijzigen, Domain Join, en **Herstelpunten** (نقاط الاستعادة). |
| **`devmgmt.msc`** | Apparaatbeheer / Device Manager | Drivers controleren en hardwarefouten (zoals Code 10) oplossen. |
| **`diskmgmt.msc`** | Schijfbeheer / Disk Management | Partities beheren, schijven formatteren of schijfletters wijzigen. |
| **`eventvwr.msc`** | Logboeken / Event Viewer | Foutmeldingen en BSOD-crashes analyseren. |
| **`services.msc`** | Services | Vastgelopen diensten herstarten (bijv. *Print Spooler* voor printers). |
| **`msinfo32`** | Systeeminformatie / System Info | Volledig overzicht van moederbord, BIOS-versie en hardware. |

## 🌐 2. Netwerk & Remote (الشبكة والوصول عن بُعد)
| Commando | NL / EN Naam | Gebruik (الاستخدام الميداني) |
| :--- | :--- | :--- |
| **`ncpa.cpl`** | Netwerkverbindingen / Network Connections | Snel IP-adres en DNS aanpassen op netwerkkaarten. |
| **`mstsc`** | Extern bureaublad / Remote Desktop | Verbinding maken met een andere PC of server (RDP). |
| **`wf.msc`** | Windows Firewall | Geavanceerde firewallregels (inkomend/uitgaand) beheren. |

## 🧹 3. Onderhoud & Mappen (الصيانة والمجلدات)
| Commando | NL / EN Naam | Gebruik (الاستخدام الميداني) |
| :--- | :--- | :--- |
| **`appwiz.cpl`** | Programma's en onderdelen | Software snel verwijderen via het klassieke configuratiescherm. |
| **`rstrui`** | Systeemherstel / System Restore | Windows terugzetten naar een eerder herstelpunt. |
| **`shell:startup`** | Opstartmap / Startup Folder | Programma's beheren die automatisch starten met Windows. |
| **`%temp%`** | Tijdelijke bestanden | Tijdelijke gebruikersbestanden handmatig opschonen. |