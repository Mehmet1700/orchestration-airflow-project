# Orchestrierung mittels Apache Airflow

## Projektbeschreibung
Dieses Projekt demonstriert die Orchestrierung eines einfachen Workflows mit Apache Airflow, der SQL-Skripte in einer PostgreSQL-Datenbank ausführt. Dabei wird gezeigt, wie Airflow als Workflow-Orchestrierungstool genutzt werden kann, um Datenpipelines effizient zu verwalten und zu automatisieren.


## Verzeichnisstruktur
- `dags/`: Enthält die DAG-Definitionen und SQL-Skripte.
  - `aggregate_data_dag.py`: DAG zur Aggregation von Daten.
  - `example_dag.py`: Beispiel-DAG zur Erstellung und Einfügung von Daten.
  - `sql/`: Enthält SQL-Skripte.
    - `aggregate_and_store.sql`: SQL-Skript zur Aggregation und Speicherung von Daten.
    - `create_and_insert.sql`: SQL-Skript zur Erstellung und Einfügung von Daten.
- `scripts/`: Enthält Setup-Skripte für PostgreSQL.
  - `setup_postgres.sql`: SQL-Skript zur Einrichtung der PostgreSQL-Datenbank und Benutzer.
- `docs/`: Dokumentation und Screenshots, sowie die fertige Ausarbeitung.
- `requirements.txt`: Python-Abhängigkeiten.
- `docker-compose.yml`: Docker Compose Datei zur Orchestrierung der Container.
- `.gitignore`: Git Ignore Datei.
- `readme.md`: Diese Datei.

## Voraussetzungen
- Python 3.7+
- Apache Airflow 2.x
- PostgreSQL
- Docker (optional, aber empfholen)

## Installation und Ausführung

### 1. Projekt-Repository klonen
Klonen Sie das Projekt-Repository auf Ihren lokalen Rechner:
```bash
git clone <repository-url>
cd <repository-name>
```

### 2. Python-Abhängigkeiten installieren
Installieren Sie die erforderlichen Python-Abhängigkeiten:
```bash
pip install -r requirements.txt
```

### 3. Airflow initialisieren
Initialisieren Sie die Airflow-Datenbank und erstellen Sie einen Admin-Benutzer:
```bash
airflow db init
airflow users create \
    --username admin \
    --firstname admin \
    --lastname admin \
    --role Admin \
    --email admin@example.com
```

### 4. PostgreSQL einrichten
Führen Sie das Setup-Skript aus, um die PostgreSQL-Datenbank und Benutzer einzurichten:
```bash
psql -U postgres -f scripts/setup_postgres.sql
```
Das Projekt verwendet postgresql, aber kann auch mit anderen Datenbanken wie MySQL oder SQLite verwendet werden. Die Konfiguration kann in der `airflow.cfg` Datei geändert werden.

### 5. Docker-Container starten (optional)
Falls Sie Docker verwenden, starten Sie die Container mit Docker Compose:
```bash
docker-compose up -d
```

Die Docker-Compose Datei wurde so konfiguriert, dass sie die Airflow- und PostgreSQL-Container startet. Die Airflow-Webserver-Oberfläche ist unter `http://localhost:8080` verfügbar. Außerdem wurde sie so automatisiert, sodass keine weiteren Schritte notwendig sind. 


### 6. Airflow starten
Starten Sie den Airflow-Webserver und den Scheduler:
```bash
airflow webserver --port 8080
airflow scheduler
```

### 7. DAGs aktivieren
Öffnen Sie die Airflow-Benutzeroberfläche unter `http://localhost:8080`, aktivieren Sie die DAGs `example_dag` und `aggregate_data_dag` und starten Sie sie.

### 8. Ergebnisse überprüfen
Überprüfen Sie die Ergebnisse, indem Sie die Daten in der PostgreSQL-Datenbank abfragen:
```bash
psql -U airflow -d airflow -c "SELECT * FROM example_table;"
psql -U airflow -d airflow -c "SELECT * FROM aggregated_data;"
```


## Login-Daten zur DB
Die Airflow Configuration benötigt die Zugangsdaten zur PostgreSQL-Datenbank. Diese können in der Datei `airflow.cfg` unter `sql_alchemy_conn` und `sql_alchemy_conn` konfiguriert werden.

```bash
sql_alchemy_conn = postgresql+psycopg2://airflow:airflow@postgres:5432/airflow
```
In der setup_postgres.sql Datei sind die Zugangsdaten für die PostgreSQL-Datenbank definiert. Beim ausführen der Docker-Compose Datei wird dieses Skript ausgeführt und die Datenbank und Benutzer erstellt.

## Troubleshooting
Falls Sie auf Probleme stoßen, überprüfen Sie die Logs der Airflow-Container:
```bash
docker-compose logs airflow-webserver
docker-compose logs airflow-scheduler
```

## Weitere Informationen
Weitere Informationen zu Apache Airflow finden Sie in der [offiziellen Dokumentation](https://airflow.apache.org/docs/).