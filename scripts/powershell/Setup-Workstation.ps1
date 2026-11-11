# ---------------------------------------------------------
# Script: Setup-Workstation.ps1
# Doel (Goal / الهدف): Basissoftware installeren & systeem opschonen (Install software & clean system / تثبيت البرامج الأساسية وتنظيف النظام)
# ---------------------------------------------------------

Write-Host "🚀 Starten met geautomatiseerde installatie (Automated Installation)..." -ForegroundColor Cyan

# 1. Installatie van essentiële software (Stille modus / Silent install / التثبيت الصامت)
# 🇳🇱 NL: Je kunt hier later meer App-ID's toevoegen voor geautomatiseerde installatie.
# 🇬🇧 EN: You can add more App-IDs here for automated deployment.
# 🇸🇦 AR: يمكنك إضافة المزيد من معرفات البرامج هنا لتثبيتها تلقائياً بدون تدخل منك.
$Apps = @(
    "Google.Chrome",
    "7zip.7zip",
    "VideoLAN.VLC"
)

foreach ($App in $Apps) {
    Write-Host "[+] Bezig met installeren van (Installing / جاري تثبيت): $App..." -ForegroundColor Yellow
    # 🇳🇱 NL: --silent zorgt ervoor dat de gebruiker geen schermen ziet, --accept-package-agreements omzeilt vragen.
    # 🇬🇧 EN: --silent hides the installation screens, --accept-package-agreements bypasses prompts.
    # 🇸🇦 AR: المعامل --silent يخفي نوافذ التثبيت عن المستخدم، والمعامل الأخير يتجاوز أسئلة الموافقة على الشروط.
    winget install --id $App --silent --accept-source-agreements --accept-package-agreements
}

Write-Host "✅ Software installatie voltooid! (Installation Complete / اكتمل التثبيت بنجاح!)" -ForegroundColor Green
Write-Host ""

# 2. Systeem opschonen (Temp files verwijderen / Clean temporary files / مسح الملفات المؤقتة)
Write-Host "🧹 Systeem opschonen (Cleaning System / تنظيف النظام)..." -ForegroundColor Cyan

# 🇳🇱 NL: Paden naar tijdelijke mappen in Windows.
# 🇬🇧 EN: Paths to Windows temporary directories.
# 🇸🇦 AR: مسارات المجلدات التي تخزن فيها ويندوز ملفاتها المؤقتة.
$TempFolders = @("$env:TEMP\*", "C:\Windows\Temp\*")

foreach ($Folder in $TempFolders) {
    Write-Host "Leegmaken van map (Emptying folder / جاري تفريغ المجلد): $Folder"
    # 🇳🇱 NL: SilentlyContinue voorkomt dat het script stopt als een bestand in gebruik is.
    # 🇬🇧 EN: SilentlyContinue prevents the script from stopping if a file is in use.
    # 🇸🇦 AR: هذا المعامل يمنع توقف السكربت في حال كان هناك ملف مؤقت قيد الاستخدام ولا يمكن حذفه.
    Remove-Item -Path $Folder -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host "✅ Systeem is succesvol opgeschoond! (System successfully cleaned / تم تنظيف النظام بنجاح!)" -ForegroundColor Green
Write-Host ""
pause