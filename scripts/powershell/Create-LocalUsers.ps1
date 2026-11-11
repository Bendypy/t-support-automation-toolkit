# ---------------------------------------------------------
# Script: Create-LocalUsers.ps1
# Doel (Goal / الهدف): Lokale gebruikers aanmaken (Create Local Users / إنشاء حسابات مستخدمين محليين)
# ---------------------------------------------------------

Write-Host "👤 Geautomatiseerd Gebruikersbeheer (Automated User Management / إدارة المستخدمين الآلية)" -ForegroundColor Cyan

# 🇳🇱 NL: De lijst met gebruikers die we in één keer willen aanmaken.
# 🇬🇧 EN: The list of users to create at once.
# 🇸🇦 AR: قائمة بأسماء المستخدمين الذين نريد إنشاؤهم دفعة واحدة.
$NewUsers = @("Stagiair1", "Stagiair2", "BeheerderTemp")

# 🇳🇱 NL: Een standaard wachtwoord instellen (Moet als 'SecureString' geconverteerd worden voor veiligheid).
# 🇬🇧 EN: Set a default password (Must be converted to SecureString).
# 🇸🇦 AR: إعداد كلمة مرور موحدة. PowerShell يرفض استخدام كلمات المرور كنص عادي لأسباب أمنية، لذلك نحولها إلى نص مشفر (SecureString).
$Password = ConvertTo-SecureString "WelkomDeltion2026!" -AsPlainText -Force

foreach ($User in $NewUsers) {
    Write-Host "[+] Bezig met aanmaken van gebruiker: $User" -ForegroundColor Yellow
    
    # 🇳🇱 NL: Foutafhandeling voor als de gebruiker al bestaat.
    # 🇸🇦 AR: استخدام ErrorAction للمتابعة بصمت إذا كان المستخدم موجوداً مسبقاً لمنع انهيار السكربت.
    try {
        New-LocalUser -Name $User -Password $Password -FullName "$User (Stage Account)" -Description "Aangemaakt via automatisering" -ErrorAction Stop
        Write-Host "  -> ✅ Gebruiker $User succesvol aangemaakt!" -ForegroundColor Green
    }
    catch {
        Write-Host "  -> ⚠️ Fout: Gebruiker $User bestaat waarschijnlijk al." -ForegroundColor Red
    }
}

Write-Host ""
pause