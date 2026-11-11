#!/bin/bash
# ---------------------------------------------------------
# Script: ubuntu-setup.sh
# Doel (Goal / الهدف): Ubuntu updaten & Netwerktools installeren (Update Ubuntu & Install net-tools / تحديث النظام وتثبيت أدوات الشبكة)
# ---------------------------------------------------------

echo "🐧 Starten met Ubuntu configuratie (Starting Ubuntu setup / بدء إعداد أوبونتو)..."

# 1. Pakketlijst updaten (Update package list / تحديث قائمة الحزم)
# 🇳🇱 NL: Vraagt de nieuwste softwareversies op bij de Ubuntu servers.
# 🇬🇧 EN: Fetches the latest software versions from Ubuntu repositories.
# 🇸🇦 AR: أمر apt update لا يثبت شيئاً، فقط يجلب قائمة بأحدث الإصدارات المتوفرة على سيرفرات لينكس.
sudo apt update

# 2. Systeem upgraden (Upgrade system / ترقية النظام فعلياً)
# 🇳🇱 NL: Installeert de updates daadwerkelijk. De -y parameter zegt automatisch 'Ja'.
# 🇬🇧 EN: Installs the updates. The -y flag answers 'Yes' to prompts.
# 🇸🇦 AR: يقوم بتثبيت التحديثات. معامل -y مهم جداً في السكربتات لأنه يجيب بـ "نعم" تلقائياً لكي لا يتوقف السكربت.
sudo apt upgrade -y

# 3. Netwerktools installeren (Install network tools / تثبيت أدوات الشبكات)
# 🇳🇱 NL: Installeert essentiële tools zoals 'ifconfig' en 'netstat'.
# 🇬🇧 EN: Installs essential tools like 'ifconfig' and 'netstat'.
# 🇸🇦 AR: يثبت الحزمة التي تحتوي على أوامر الشبكات المهمة التي قد لا تكون موجودة في النسخ الحديثة.
sudo apt install net-tools traceroute -y

echo "✅ Ubuntu configuratie is voltooid! (Setup complete / اكتمل الإعداد!)"