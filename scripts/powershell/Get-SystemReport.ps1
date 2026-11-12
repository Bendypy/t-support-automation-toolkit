# ---------------------------------------------------------
# Script: Get-SystemReport.ps1
# Doel (Goal / الهدف): Systeeminformatie ophalen en exporteren naar Kladblok (Export System Info to Notepad / استخراج معلومات النظام وعرضها في مفكرة)
# ---------------------------------------------------------

Write-Host "Verzamelen van systeemgegevens... (Gathering system data...)" -ForegroundColor Cyan

# 1. Variabelen ophalen (Fetching Variables / جمع المتغيرات من النظام)
$Date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$OS = (Get-CimInstance Win32_OperatingSystem).Caption
$CPU = (Get-CimInstance Win32_Processor).Name

# RAM berekening (RAM Calculation / حساب الذاكرة)
$RAM_Total = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
$RAM_Free = [math]::Round((Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1MB, 2)

# Opslag berekening (Storage Calculation / حساب مساحة القرص C)
$Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$Disk_Total = [math]::Round($Disk.Size / 1GB, 2)
$Disk_Free = [math]::Round($Disk.FreeSpace / 1GB, 2)

# 🇸🇦 AR: تحديد حالة القرص (تحذير إذا كانت المساحة أقل من 15 جيجا) باللغتين الإنجليزية والهولندية
$DiskStatus_EN = if ($Disk_Free -lt 15) { "WARNING: Low Space!" } else { "Healthy" }
$DiskStatus_NL = if ($Disk_Free -lt 15) { "LET OP: Weinig ruimte!" } else { "Gezond" }

# 2. Rapport Tekst Opstellen (Formatting the Report / صياغة شكل التقرير النهائي)
# 🇸🇦 AR: نستخدم @" "@ لإنشاء كتلة نصية متعددة الأسطر بسهولة وتنسيقها كما ستظهر للمستخدم
$ReportContent = @"
===================================================
SYSTEM DIAGNOSTIC REPORT / SYSTEEM DIAGNOSE RAPPORT
Date / Datum: $Date
===================================================

[1] OPERATING SYSTEM / BESTURINGSSYSTEEM:
EN: $OS
NL: $OS

[2] PROCESSOR / PROCESSOR (CPU):
EN: $CPU
NL: $CPU

[3] MEMORY / WERKGEHEUGEN (RAM):
EN: Available: $RAM_Free GB / Total: $RAM_Total GB
NL: Beschikbaar: $RAM_Free GB / Totaal: $RAM_Total GB

[4] STORAGE / OPSLAGRUIMTE (Disk C:):
EN: $DiskStatus_EN - $Disk_Free GB free of $Disk_Total GB
NL: $DiskStatus_NL - $Disk_Free GB vrij van $Disk_Total GB

===================================================
Please verify this information with your IT support.
Controleer a.u.b. deze informatie met ICT-beheer.
===================================================
"@

# 3. Exporteren en Openen (Export and Open / تصدير الملف وفتحه للمستخدم)
# 🇸🇦 AR: تحديد مسار الحفظ على سطح مكتب المستخدم الحالي
$ReportPath = "$env:USERPROFILE\Desktop\System_Report.txt"

# 🇸🇦 AR: كتابة النص داخل الملف بترميز UTF8 لضمان سلامة الحروف
$ReportContent | Out-File -FilePath $ReportPath -Encoding UTF8

# 🇸🇦 AR: أمر تشغيل برنامج المفكرة (Notepad) وفتح الملف الذي أنشأناه للتو بداخله
Start-Process notepad.exe $ReportPath

Write-Host "Rapport is succesvol geopend in Kladblok! (Report opened successfully in Notepad!)" -ForegroundColor Green