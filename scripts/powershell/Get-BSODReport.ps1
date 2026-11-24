# ---------------------------------------------------------
# Script: Get-BSODReport.ps1
# Doel: Automatisch BSOD bewijs verzamelen (Minidumps, Event Logs, Recente Updates)
# الهدف: جمع أدلة الشاشة الزرقاء والتغييرات الأخيرة تلقائياً لتوثيق التذكرة
# ---------------------------------------------------------

$ReportPath = "$env:TEMP\BSOD_Evidence_Report.txt"
$Date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Host "🔍 Bezig met verzamelen van BSOD-bewijs... (Collecting BSOD evidence...)" -ForegroundColor Cyan

# Start rapport opbouw
$Report = @()
$Report += "========================================================="
$Report += "BSOD DIAGNOSTIC & EVIDENCE REPORT / STORINGSRAPPORT"
$Report += "Datum / Date: $Date | PC: $env:COMPUTERNAME"
$Report += "=========================================================`n"

# 1. Controleer Minidump bestanden (فحص ملفات الـ Minidump)
$Report += "[1] MINIDUMP FILES (C:\Windows\Minidump):"
$Minidumps = Get-ChildItem -Path "C:\Windows\Minidump" -Filter "*.dmp" -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending
if ($Minidumps) {
    foreach ($Dump in $Minidumps) {
        $Report += " - Bestand: $($Dump.Name) | Datum: $($Dump.LastWriteTime) | Grootte: $([math]::Round($Dump.Length / 1KB, 2)) KB"
    }
} else {
    $Report += " - Geen minidump bestanden gevonden (No minidumps found / لا توجد ملفات انهيار)."
}
$Report += ""

# 2. Haal recente BugChecks (1001) en Onverwachte herstarts (41) uit Logboeken
# (سحب أخطاء الشاشة الزرقاء وإعادة التشغيل المفاجئ من سجل النظام)
$Report += "[2] EVENT LOGS - RECENT CRASHES (Event ID 1001 = BSOD, 41 = Kernel-Power):"
$Events = Get-WinEvent -FilterHashtable @{LogName='System'; Id=1001,41} -MaxEvents 10 -ErrorAction SilentlyContinue
if ($Events) {
    foreach ($Event in $Events) {
        $ShortMsg = ($Event.Message -split "`n")[0]
        $Report += " - [$($Event.TimeCreated)] ID: $($Event.Id) | $ShortMsg"
    }
} else {
    $Report += " - Geen recente crash-events gevonden in System Log."
}
$Report += ""

# 3. Controleer recente Windows Updates (التحقق من آخر التغييرات والتحديثات)
$Report += "[3] RECENTE WIJZIGINGEN - LAATSTE 5 WINDOWS UPDATES:"
$Updates = Get-HotFix -ErrorAction SilentlyContinue | Sort-Object InstalledOn -Descending | Select-Object -First 5
if ($Updates) {
    foreach ($Update in $Updates) {
        $Report += " - $($Update.HotFixID) ($($Update.Description)) | Geïnstalleerd op: $($Update.InstalledOn)"
    }
} else {
    $Report += " - Kon update-geschiedenis niet ophalen."
}
$Report += "`n========================================================="
$Report += "Tip: Gebruik dit rapport voor je ticketregistratie of escalatie."

# Opslaan en openen in Kladblok
$Report | Out-File -FilePath $ReportPath -Encoding UTF8
Write-Host "✅ Rapport opgeslagen in $ReportPath" -ForegroundColor Green
Start-Process notepad.exe $ReportPath