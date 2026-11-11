# 🚀 Stage Cheatsheet: Dagelijkse ICT-Routines
*Snelreferentie voor netwerk, back-ups en hardware patching.*

## 1. 🌐 Netwerk Diagnose Commando's (Snel opsporen van fouten)
Als een gebruiker geen internet of netwerkverbinding heeft, voer deze commando's uit in CMD:

* `ipconfig /all` ➔ Bekijk het volledige IP-adres, Subnetmasker, Gateway en MAC-adres.
* `ping 8.8.8.8` ➔ Test de externe internetverbinding (Google DNS).
* `tracert 8.8.8.8` ➔ Ontdek waar de verbinding wegvalt tussen de pc en het internet.
* `ipconfig /release` ➔ Laat het huidige IP-adres vrij en verbreekt de verbinding.
* `ipconfig /renew` ➔ Vraagt een nieuw IP-adres aan bij de DHCP-server.
* `nslookup deltion.nl` ➔ Controleer of de DNS-server namen correct omzet naar IP-adressen.

## 2. 🖧 Patchkast & Server Aansluitplan (Basisregels)
* **Kleurcodes:** Gebruik altijd een vaste kleur voor specifieke verbindingen (bijv. Blauw voor werkplekken, Rood voor servers/uplinks).
* **Uplink naar Firewall/Router:** Verbind poort LAN P3 van de router altijd naar een vaste hoge poort op de switch (bijv. Poort 24 of SFP).
* **Werkplekken (1-op-1):** LSA Poort 1 op het patchpaneel gaat altijd met een korte patchkabel naar Switch Poort 1.

## 3. 💾 Back-up Procedures (Data Veiligstellen)
Voordat je een pc formatteert of vervangt, controleer deze standaard locaties:
* **Gebruikersmap:** `C:\Users\[Gebruikersnaam]\` (Kopieer Desktop, Documents, Downloads, Pictures).
* **Browser Favorieten:** Exporteer de bladwijzers (Bookmarks) vanuit Chrome/Edge naar een `.html` bestand.
* **E-mail (Thunderbird):** Ga via Windows Run (Win + R) naar `%appdata%\Thunderbird` (of `C:\Users\[Gebruikersnaam]\AppData\Roaming\Thunderbird`) en kopieer de map 'Profiles' om alle e-mails en instellingen veilig te stellen.
* **Software:** Gebruik EaseUS Todo Backup voor het maken van een volledige systeem image (Clone) indien vereist door de SLA.

## 4. 🔑 Handige Windows Sneltoetsen & Run-commando's (Win + R)
* `appwiz.cpl` ➔ Programma's en onderdelen (Software verwijderen).
* `ncpa.cpl` ➔ Netwerkverbindingen (Netwerkadapters in- of uitschakelen).
* `compmgmt.msc` ➔ Computerbeheer (Lokale gebruikers en groepen beheren).
*