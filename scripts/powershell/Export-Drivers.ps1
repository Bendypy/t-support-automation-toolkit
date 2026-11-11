# ---------------------------------------------------------
# Script: Export-Drivers.ps1
# Doel (Goal / الهدف): Windows drivers exporteren (Export Windows Drivers / استخراج تعريفات الجهاز)
# ---------------------------------------------------------

Write-Host "🖧 Starten met driver export (Starting driver export / بدء استخراج التعريفات)..." -ForegroundColor Cyan

# 🇳🇱 NL: Maak een map aan voor de drivers op de C-schijf (of verander naar USB).
# 🇬🇧 EN: Create a destination folder for the drivers.
# 🇸🇦 AR: إنشاء مجلد مخصص لحفظ التعريفات. (يُفضل تغييره لاحقاً لمسار فلاش ميموري).
$DriverFolder = "C:\HardwareDrivers_Backup"

if (-not (Test-Path -Path $DriverFolder)) {
    New-Item -ItemType Directory -Path $DriverFolder | Out-Null
}

Write-Host "[+] Bezig met het kopiëren van alle third-party drivers naar (Copying drivers to / جاري نسخ التعريفات إلى): $DriverFolder" -ForegroundColor Yellow
Write-Host "⚠️ Dit kan enkele minuten duren... (This may take a few minutes / قد يستغرق هذا بضع دقائق...)" -ForegroundColor Red

# 🇳🇱 NL: Hét commando om alle niet-Microsoft drivers uit het systeem te halen.
# 🇬🇧 EN: The ultimate command to extract all third-party drivers from the running OS.
# 🇸🇦 AR: الأمر السحري الذي يستخرج ملفات (.inf و .sys) الخاصة بالتعريفات الأصلية من نظام ويندوز.
Export-WindowsDriver -Online -Destination $DriverFolder | Out-Null

Write-Host "✅ Alle drivers zijn succesvol geëxporteerd! (Drivers exported successfully / تم استخراج جميع التعريفات بنجاح!)" -ForegroundColor Green
Write-Host ""
pause