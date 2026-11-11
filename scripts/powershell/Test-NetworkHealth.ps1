# 1. تعريف الهدف (Doelwit configureren)
$Server = "google.com"

Write-Host "Bezig met testen van verbinding met $Server..."
Write-Host ""

# 2. فحص الاتصال مع معامل Quiet ليعيد True أو False
if (Test-Connection -ComputerName $Server -Count 1 -Quiet) {
    # حالة النجاح
    Write-Host "[OK] الاتصال سليم - Netwerk is online" -ForegroundColor Green
} else {
    # حالة الفشل
    Write-Host "[Fout] لا يوجد اتصال - Netwerk is offline" -ForegroundColor Red
}

Write-Host ""
pause