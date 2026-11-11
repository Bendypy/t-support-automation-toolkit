@echo off
chcp 65001 >nul
echo ==========================================
echo ⏱️ Geplande Systeem Uitschakeling (Auto-Shutdown / إيقاف التشغيل المجدول)
echo ==========================================
echo.

:: 🇳🇱 NL: Vraag de gebruiker hoeveel minuten de PC moet wachten.
:: 🇬🇧 EN: Ask the user how many minutes to wait before shutdown.
:: 🇸🇦 AR: نطلب من المستخدم (عبر متغير) تحديد عدد الدقائق قبل إطفاء الجهاز.
set /p minuten="Voer in na hoeveel minuten de PC moet afsluiten (bijv. 60): "

:: 🇳🇱 NL: Bereken seconden (minuten * 60) omdat het shutdown commando in seconden werkt.
:: 🇬🇧 EN: Calculate seconds (minutes * 60) because the shutdown command works in seconds.
:: 🇸🇦 AR: أمر الإيقاف في ويندوز يحسب الوقت بالثواني، لذا نقوم بعملية رياضية لتحويل الدقائق إلى ثوانٍ.
set /a seconden=%minuten% * 60

:: 🇳🇱 NL: Voer het shutdown commando uit. /s = Shutdown, /f = Forceer, /t = Tijd.
:: 🇬🇧 EN: Execute the shutdown command. /s = Shutdown, /f = Force, /t = Time.
:: 🇸🇦 AR: ننفذ الإيقاف. المعامل /f خطير جداً لأنه يجبر البرامج المفتوحة على الإغلاق دون حفظ البيانات!
shutdown /s /f /t %seconden% /c "Het systeem wordt afgesloten door ICT-beheer voor onderhoud."

echo.
echo ✅ Waarschuwing: PC sluit af over %minuten% minuten! (Warning: PC shuts down in %minuten% minutes / تحذير: سيتم إيقاف الجهاز بعد %minuten% دقيقة!)
echo 🛑 Typ 'shutdown /a' in CMD als je dit wilt annuleren (Type to cancel / اكتب هذا الأمر في موجه الأوامر للإلغاء).
echo.
pause