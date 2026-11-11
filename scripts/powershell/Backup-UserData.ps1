# ---------------------------------------------------------
# Script: Backup-UserData.ps1
# Doel (Goal / الهدف): Gebruikersdata veiligstellen (Backup User Data / النسخ الاحتياطي لبيانات المستخدم)
# ---------------------------------------------------------

Write-Host "💾 Starten met geautomatiseerde back-up (Starting automated backup / بدء النسخ الاحتياطي الآلي)..." -ForegroundColor Cyan

# 🇳🇱 NL: Haal de naam op van de huidige ingelogde gebruiker.
# 🇬🇧 EN: Get the username of the currently logged-in user.
# 🇸🇦 AR: يجلب اسم المستخدم الذي يسجل الدخول حالياً بشكل آلي.
$User = $env:USERNAME
$SourceFolder = "C:\Users\$User"

# 🇳🇱 NL: Bepaal de bestemming (bijv. een D-schijf of externe USB). Verander dit indien nodig.
# 🇬🇧 EN: Define the backup destination (e.g., D-drive or USB).
# 🇸🇦 AR: مسار الحفظ. يمكنك تغييره إلى مسار الفلاش ميموري الخاص بك (مثلاً E:\Backup).
$DestPath = "C:\Backup_$User.zip"

# 🇳🇱 NL: Lijst met mappen die we willen veiligstellen.
# 🇬🇧 EN: List of folders to backup.
# 🇸🇦 AR: المجلدات الحساسة التي ننسخها دائماً قبل الفرمتة.
$FoldersToBackup = @(
    "$SourceFolder\Desktop",
    "$SourceFolder\Documents"
)

Write-Host "[+] Bezig met comprimeren van bestanden naar (Compressing files to / جاري ضغط الملفات إلى): $DestPath" -ForegroundColor Yellow

# 🇳🇱 NL: Maak een ZIP-bestand aan met Compress-Archive.
# 🇬🇧 EN: Create a ZIP file using Compress-Archive.
# 🇸🇦 AR: استخدام أمر الضغط المدمج في ويندوز لصنع ملف ZIP يحتوي على كل البيانات لسهولة نقلها.
Compress-Archive -Path $FoldersToBackup -DestinationPath $DestPath -Force -ErrorAction SilentlyContinue

Write-Host "✅ Back-up voltooid! Bestanden zijn veilig opgeslagen. (Backup complete! / تمت عملية النسخ بنجاح!)" -ForegroundColor Green
Write-Host ""
pause