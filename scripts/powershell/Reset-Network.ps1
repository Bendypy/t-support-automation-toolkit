# ---------------------------------------------------------
# Script: Reset-Network.ps1
# Doel (Goal / الهدف): Netwerkinstellingen volledig resetten (Full Network Reset / إعادة ضبط الشبكة بالكامل)
# ---------------------------------------------------------

Write-Host "🌐 Starten met netwerkherstel (Starting network repair / بدء إصلاح الشبكة)..." -ForegroundColor Cyan

# 1. IP Vrijgeven (Release IP / التخلي عن العنوان الحالي)
Write-Host "[1/4] Huidig IP-adres vrijgeven..." -ForegroundColor Yellow
ipconfig /release | Out-Null

# 2. DNS Cache Leegmaken (Flush DNS / تنظيف ذاكرة المواقع)
# 🇳🇱 NL: Lost problemen op waarbij websites naar verkeerde of oude IP-adressen verwijzen.
# 🇬🇧 EN: Clears the DNS resolver cache to fix website loading issues.
# 🇸🇦 AR: يمسح الذاكرة المؤقتة للـ DNS. مهم جداً إذا كان الموقع يعمل على الأجهزة الأخرى ولا يعمل على هذا الجهاز.
Write-Host "[2/4] DNS-cache leegmaken..." -ForegroundColor Yellow
ipconfig /flushdns | Out-Null

# 3. Nieuw IP Aanvragen (Renew IP / طلب عنوان جديد)
Write-Host "[3/4] Nieuw IP-adres aanvragen bij de DHCP-server..." -ForegroundColor Yellow
ipconfig /renew | Out-Null

# 4. Winsock Reset (Reset Windows Sockets / إصلاح محول الشبكة العميق)
# 🇳🇱 NL: Herstelt de netwerkstack van Windows. Essentieel na het verwijderen van malware!
# 🇬🇧 EN: Resets the Windows network stack. Essential after malware removal.
# 🇸🇦 AR: يعيد ضبط إعدادات محول الشبكة العميقة في ويندوز للوضع الافتراضي (مهم جداً بعد حذف الفيروسات).
Write-Host "[4/4] Winsock en TCP/IP stack resetten..." -ForegroundColor Yellow
netsh winsock reset | Out-Null
netsh int ip reset | Out-Null

Write-Host "✅ Netwerk succesvol gereset! (Network reset successful / تم إصلاح الشبكة بنجاح!)" -ForegroundColor Green
Write-Host "⚠️ Let op: Herstart de PC om alle wijzigingen toe te passen. (Reboot required / يجب إعادة تشغيل الجهاز)." -ForegroundColor Red
Write-Host ""
pause