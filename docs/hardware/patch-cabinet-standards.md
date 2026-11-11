# Patchkast & Netwerk Infrastructuur Standaarden
*Enterprise Hardware & Cabling Documentation*

Dit document beschrijft de richtlijnen voor het fysiek patchen, kabelbeheer en de logische IP-configuratie binnen een standaard IT-infrastructuur (MBO Niveau 2/3 Standaard).

## 1. Fysieke Laag: Patchpaneel vs. Switch
Het gebruik van een patchpaneel is verplicht voor **bescherming, toegankelijkheid en onderhoud**.

* **Stugge kabels (Solid core):** Lopen door de muren naar de LSA-stroken aan de achterkant van het patchpaneel. Mogen niet bewogen worden om kabelbreuk te voorkomen.
* **Soepele kabels (Stranded patchkabels):** Worden gebruikt aan de voorkant om het patchpaneel met de switch te verbinden. 

### Standaard Patching Procedure (Voorbeeld)
Voor een overzichtelijke patchkast hanteren we de 1-op-1 patching methode waar mogelijk, en scheiden we de uplink-poorten van de access-poorten:
* **LSA Poort 1, 2, 7** ➔ **Switch Poort 21, 22, 1** (Werkplekken / Access Ports)
* **Router / Gateway (LAN P3)** ➔ **Switch Poort 24** (Uplink / Trunk Port)

## 2. Kabelbeheer (Cable Management)
* Gebruik horizontale en verticale kabelgeleiders (D-rings).
* Respecteer de buigradius (Bend Radius) van UTP-kabels; geen scherpe knikken.
* Zorg dat LED-indicatoren op de switch te allen tijde zichtbaar blijven voor snelle probleemopsporing (Troubleshooting).

## 3. Logische Netwerkconfiguratie (IPv4 Standaard)
Bij het inrichten van een lokaal testnetwerk of beheer-VLAN, wordt vaak een vaste (Static) IP-reeks gebruikt. 

**Standaard Configuratie Template:**
* **IPv4-adres:** `172.16.0.10` (of vergelijkbaar in de reeks)
* **Subnetmasker:** `255.255.255.0` (/24)
* **Standaardgateway (Router):** `172.16.0.1`
* **Primaire DNS:** `8.8.8.8`
* **Secundaire DNS:** `8.8.4.4`

## 4. Verificatie & Diagnose
Na het fysiek patchen en configureren, moeten de volgende netwerkdiensten worden getest:
1. Pingen van de Gateway (`172.16.0.1`).
2. Testen van netwerkbronnen (bijv. FTP-server op `172.16.0.2` en Webserver op `172.16.0.3`).
3. Uitvoeren van een poortscan (via Nmap of Advanced IP Scanner) om actieve services in de reeks te verifiëren.
4.