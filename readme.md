# Orchestrierung mittels Apache Airflow

## Projektbeschreibung
Dieses Projekt zeigt die Orchestrierung eines einfachen Workflows mit Apache Airflow, der SQL-Skripte in einer PostgreSQL-Datenbank ausführt.

## Verzeichnisstruktur
- `dags/`: Enthält die DAG-Definition und SQL-Skripte.
- `scripts/`: Enthält Setup-Skripte für PostgreSQL.
- `docs/`: Dokumentation und Screenshots.
- `requirements.txt`: Python-Abhängigkeiten.

## Voraussetzungen
- Python 3.7+
- Apache Airflow 2.x
- PostgreSQL

## Installation und Ausführung

1. **Airflow installieren**:

```bash
pip install -r requirements.txt
airflow db init
airflow users create \
    --username admin \
    --firstname admin \
    --lastname admin \
    --role Admin \
    --email admin@example.com

```

2. **PostgreSQL installieren**:
Führen Sie das Setup Skript aus:

```bash
psql -U postgres -f scripts/setup_postgres.sql
``` 

3. **Airflow starten**:

```bash
airflow webserver --port 8080
airflow scheduler
```

4. **DAG aktivieren**:

Öffnen Sie die Airflow-Benutzeroberfläche unter `http://localhost:8080` und aktivieren Sie die DAG `example_dag.py` und starten Sie sie.

## Ergebnisse überprüfen
Überprüfen Sie die Ergebnisse, indem Sie die Daten in der PostgreSQL-Datenbank abfragen:

```bash
psql -U karaca -d airflow_db -c "SELECT * FROM example_table;"
```