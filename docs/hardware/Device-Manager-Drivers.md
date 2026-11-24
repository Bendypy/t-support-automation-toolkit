# 🔌 Apparaatbeheer (`devmgmt.msc`) & Drivers
*(Device Manager & Driver Troubleshooting / إدارة الأجهزة والتعريفات)*

**Kernregel (القاعدة الأساسية):** 
> Installeer drivers bij voorkeur via **Windows Update** of direct via de website van **de fabrikant** (Dell, HP, Lenovo, NVIDIA, Intel).

---

## 🛠️ 1. De 4 Hoofdfuncties van Apparaatbeheer
1. **Hardware en foutmeldingen bekijken:**
   * *Geel uitroepteken:* Driver ontbreekt of geeft een foutcode (bijv. Code 10 of Code 28).
   * *Pijltje omlaag:* Apparaat is handmatig uitgeschakeld (`Disabled`).
2. **Driver bijwerken of terugzetten (`Update / Roll Back`):**
   * Gebruik **Vorig stuurprogramma** als een probleem direct na een recente driver-update is ontstaan.
3. **Apparaat uitschakelen of verwijderen (`Disable / Uninstall`):**
   * Handig om een vastgelopen USB-poort, Wi-Fi-kaart of Bluetooth-module te resetten.
4. **Hardware opnieuw laten detecteren (`Scan for hardware changes`):**
   * Forceert Windows om aangesloten hardware opnieuw te scannen en te initialiseren na een verwijdering.

---

## ⚡ 2. Snelle CLI-check (PowerShell One-Liner)
Om direct alle apparaten met een foutcode te zien zonder te scrollen in Apparaatbeheer:
```powershell
Get-PnpDevice | Where-Object { $_.Status -ne 'OK' } | Select-Object Status, Class, FriendlyName