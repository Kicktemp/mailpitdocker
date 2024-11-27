# Docker Compose Setup: Nginx, Mailpit & Certbot

Dieses Repository enthält ein Docker-Compose-Setup, um **Mailpit** über **Nginx** mit SSL-Verschlüsselung (bereitgestellt von **Certbot**) unter der Domain `maildemo.kicktemp.com` bereitzustellen.

## Inhaltsverzeichnis

1. [Verzeichnisstruktur](#verzeichnisstruktur)
2. [Voraussetzungen](#voraussetzungen)
3. [Einrichtung](#einrichtung)
4. [Dateien](#dateien)
5. [Nützliche Befehle](#nützliche-befehle)

---

## Verzeichnisstruktur

```plaintext
.
├── certbot/
│   ├── certbot-script.sh  # Script für die Zertifikatserstellung
├── nginx/
│   ├── nginx.conf         # Nginx-Konfiguration
├── docker-compose.yml     # Docker Compose Konfigurationsdatei
└── README.md              # Dokumentation
```

---

## Voraussetzungen

- **Domain**: Die Domain `maildemo.kicktemp.com` muss auf die IP-Adresse deines Servers zeigen.
- **Docker** und **Docker Compose** müssen installiert sein:
  - [Docker installieren](https://docs.docker.com/get-docker/)
  - [Docker Compose installieren](https://docs.docker.com/compose/install/)

---

## Einrichtung

### 1. Repository klonen
Kopiere dieses Repository auf deinen Server:
```bash
git clone https://github.com/your-username/your-repository-name.git
cd your-repository-name
```

### 2. Certbot-Skript ausführen
Rufe das SSL-Zertifikat für die Domain `maildemo.kicktemp.com` ab:
```bash
bash certbot/certbot-script.sh
```

> **Hinweis**: Stelle sicher, dass die Domain `maildemo.kicktemp.com` korrekt konfiguriert ist und auf die Server-IP zeigt.

### 3. Dienste starten
Starte die Dienste mit Docker Compose:
```bash
docker-compose up -d
```

### 4. Überprüfen
Besuche die Mailpit-Oberfläche unter:
```
https://maildemo.kicktemp.com
```

---

## Dateien

### 1. `docker-compose.yml`
Die Hauptkonfigurationsdatei, die die folgenden Dienste definiert:
- **nginx**: Reverse Proxy für Mailpit mit SSL-Unterstützung
- **mailpit**: SMTP-Server und Web-Interface
- **certbot**: Automatische Verwaltung von SSL-Zertifikaten

### 2. `nginx/nginx.conf`
Nginx-Konfigurationsdatei, die:
- Anfragen von HTTP zu HTTPS weiterleitet
- Mailpit über `https://maildemo.kicktemp.com` bereitstellt

### 3. `certbot/certbot-script.sh`
Skript zum Abrufen eines SSL-Zertifikats für die Domain `maildemo.kicktemp.com` mit Certbot.

### 4. `README.md`
Diese Dokumentation.

---

## Nützliche Befehle

### Logs anzeigen
- **Nginx**: `docker logs nginx`
- **Mailpit**: `docker logs mailpit`
- **Certbot**: `docker logs certbot`

### Dienste neu starten
```bash
docker-compose restart
```

### Docker Compose herunterfahren
```bash
docker-compose down
```

---

## Hinweise

- Das Certbot-Skript muss nur einmal ausgeführt werden, um die Zertifikate zu erstellen.
- Certbot erneuert automatisch Zertifikate alle 60 Tage.
- Nginx kann erweitert werden, um weitere Dienste zu hosten.

---

Falls Fragen oder Probleme auftreten, erstelle ein Issue in diesem Repository.
