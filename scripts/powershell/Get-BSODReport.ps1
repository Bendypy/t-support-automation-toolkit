# ---------------------------------------------------------
# Script: Get-BSODReport.ps1 (v2.0 - Smart Analyzer)
# Doel: Automatisch BSOD analyseren en een kant-en-klare ticketsamenvatting maken
# الهدف: تحليل الشاشة الزرقاء آلياً وتجهيز ملخص جاهز للكتابة في التذكرة مباشرة
# ---------------------------------------------------------

$ReportPath = "$env:TEMP\BSOD_Summary_Ticket.txt"
$Date = Get-Date -Format "yyyy-MM-dd HH:mm"

# 1. Kennisbank (Hash Table) voor veelvoorkomende Stopcodes
$StopCodeMap = @{
    "0x0000001a" = "MEMORY_MANAGEMENT (Waarschijnlijk RAM / Hardware fout)"
    "0x0000000a" = "IRQL_NOT_LESS_OR_EQUAL (Driver of geheugen conflict)"
    "0x000000d1" = "DRIVER_IRQL_NOT_LESS_OR_EQUAL (Specifieke driver fout, bijv. netwerk/GPU)"
    "0x00000050" = "PAGE_FAULT_IN_NONPAGED_AREA (Defecte RAM of corrupte driver/schijf)"
    "0x0000007e" = "SYSTEM_THREAD_EXCEPTION_NOT_HANDLED (Driver incompatibiliteit / BIOS)"
    "0x0000007a" = "KERNEL_DATA_INPAGE_ERROR (Harde schijf / SSD leesfout of losse kabel)"
    "0x000000ef" = "CRITICAL_PROCESS_DIED (Corrupt Windows systeembestand)"
    "0x00000116" = "VIDEO_TDR_FAILURE (Videokaart / GPU driver crash)"
    "0x00000124" = "WHEA_UNCORRECTABLE_ERROR (Ernstige hardware fout: CPU / Voltage / Hitte)"
}

Write-Host "⚡ Bezig met slimme BSOD-analyse... (Running smart analysis...)" -ForegroundColor Cyan

# 2. Data verzamelen
$Minidumps = Get-ChildItem -Path "C:\Windows\Minidump" -Filter "*.dmp" -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending
$BSODEvents = Get-WinEvent -FilterHashtable @{LogName='System'; Id=1001} -MaxEvents 5 -ErrorAction SilentlyContinue
$PowerEvents = Get-WinEvent -FilterHashtable @{LogName='System'; Id=41} -MaxEvents 5 -ErrorAction SilentlyContinue
$LastUpdate = Get-HotFix -ErrorAction SilentlyContinue | Sort-Object InstalledOn -Descending | Select-Object -First 1

# 3. Analyse & Conclusie logica
$LastBSOD = $BSODEvents | Select-Object -First 1
$Status = "🟢 STABIEL (Geen recente BSOD in de laatste 7 dagen)"
$HexCode = "Geen"
$Meaning = "N.v.t."
$LastCrashDate = "Geen crashes gevonden"

if ($LastBSOD) {
    $LastCrashDate = $LastBSOD.TimeCreated.ToString("yyyy-MM-dd HH:mm")
    if ($LastBSOD.TimeCreated -gt (Get-Date).AddDays(-7)) {
        $Status = "🔴 ACTIE VEREIST (Recente BSOD gedetecteerd!)"
    }
    # Regex om de 0x000000xx code uit de tekst te halen
    if ($LastBSOD.Message -match "0x[0-9a-fA-F]{8}") {
        $HexCode = $Matches[0].ToLower()
        if ($StopCodeMap.ContainsKey($HexCode)) {
            $Meaning = $StopCodeMap[$HexCode]
        } else {
            $Meaning = "Onbekende code (Zoek op Google: 'BSOD $HexCode')"
        }
    }
}

# 4. Bouw het korte, directe rapport op (Klaar om te kopiëren!)
$Output = @"
=========================================================
📋 KANT-EN-KLARE TICKET SAMENVATTING (COPY-PASTE)
=========================================================
PC Naam         : $env:COMPUTERNAME
Analyse Datum   : $Date
Status          : $Status

--- RESULTAAT ---
Laatste BSOD    : $LastCrashDate
Stopcode        : $HexCode
Waarschijnlijke : $Meaning
Aantal Minidumps: $($Minidumps.Count) bestand(en) in C:\Windows\Minidump
Onverwachte uit : $($PowerEvents.Count)x (Kernel-Power ID 41)
Laatste Update  : $($LastUpdate.HotFixID) op $($LastUpdate.InstalledOn)

--- ADVIES / VOLGENDE STAP ---
$(if ($Minidumps.Count -gt 0) { "-> Open nieuwste dump ($($Minidumps[0].Name)) in WhoCrashed voor de exacte .sys driver." } else { "-> Geen minidump aanwezig. Controleer Event Viewer of hardware (RAM/SSD)." })

=========================================================
📌 KORTE TIJDLIJN (LAATSTE 3 CRASHES)
=========================================================
"@

if ($BSODEvents) {
    foreach ($ev in ($BSODEvents | Select-Object -First 3)) {
        $code = if ($ev.Message -match "0x[0-9a-fA-F]{8}") { $Matches[0] } else { "Onbekend" }
        $Output += "`n- [$($ev.TimeCreated.ToString('yyyy-MM-dd HH:mm'))] BSOD Code: $code"
    }
} else {
    $Output += "`n- Geen BSOD-events in het logboek."
}

# Opslaan en openen
$Output | Out-File -FilePath $ReportPath -Encoding UTF8
Write-Host "✅ Analyse voltooid! Samenvatting geopend." -ForegroundColor Green
Start-Process notepad.exe $ReportPath