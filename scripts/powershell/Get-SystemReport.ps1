# ---------------------------------------------------------
# Script: Get-SystemReport.ps1
# Doel (Goal / الهدف): Systeeminformatie ophalen (Get System Info / جلب تقرير سريع عن حالة الجهاز)
# ---------------------------------------------------------

Write-Host "📊 Systeem Diagnose Rapport (System Diagnostic Report / تقرير فحص النظام)" -ForegroundColor Cyan
Write-Host "---------------------------------------------------"

# 1. Besturingssysteem (OS)
$OS = (Get-CimInstance Win32_OperatingSystem).Caption
Write-Host "🖥️ OS (نظام التشغيل):" -ForegroundColor Yellow -NoNewline
Write-Host " $OS"

# 2. Processor (CPU)
$CPU = (Get-CimInstance Win32_Processor).Name
Write-Host "⚙️ CPU (المعالج):" -ForegroundColor Yellow -NoNewline
Write-Host " $CPU"

# 3. Werkgeheugen (RAM)
# 🇳🇱 NL: Omrekenen van Bytes naar Gigabytes en afronden.
$RAM_Total = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
$RAM_Free = [math]::Round((Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1MB, 2)
Write-Host "🧠 RAM (الذاكرة العشوائية):" -ForegroundColor Yellow -NoNewline
Write-Host " Beschikbaar (متاح): $RAM_Free GB / Totaal (الكلي): $RAM_Total GB"

# 4. Opslagruimte (Disk C:)
$Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$Disk_Total = [math]::Round($Disk.Size / 1GB, 2)
$Disk_Free = [math]::Round($Disk.FreeSpace / 1GB, 2)
# 🇳🇱 NL: Bepaal de statuskleur (Rood als er minder dan 15GB over is).
# 🇸🇦 AR: إذا كانت المساحة المتبقية أقل من 15 جيجا، اطبعها باللون الأحمر للتحذير.
Write-Host "💾 Disk C: (القرص الصلب):" -ForegroundColor Yellow -NoNewline
if ($Disk_Free -lt 15) {
    Write-Host " LET OP! (تحذير) Slechts $Disk_Free GB vrij van $Disk_Total GB" -ForegroundColor Red
} else {
    Write-Host " Gezond (سليم) - $Disk_Free GB vrij van $Disk_Total GB" -ForegroundColor Green
}

Write-Host "---------------------------------------------------"
Write-Host "✅ Rapport voltooid! Gebruik deze info voor de SOP." -ForegroundColor Cyan
Write-Host ""
pause