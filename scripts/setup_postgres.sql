-- Erstellen einer neuen Datenbank namens airflow_db
CREATE DATABASE airflow_db;

-- Erstellen eines neuen Benutzers namens airflow_user mit dem Passwort 'airflow_pass'
CREATE USER airflow_user WITH PASSWORD 'airflow_pass';

-- Gewähren aller Rechte auf der Datenbank airflow_db an den Benutzer airflow_user
GRANT ALL PRIVILEGES ON DATABASE airflow_db TO airflow_user;

-- Löschen der bestehenden Verbindung mit der ID 'postgres_default'
DELETE FROM connection WHERE conn_id = 'postgres_default';

-- Einfügen einer neuen Verbindung mit der ID 'postgres_default'
INSERT INTO connection (conn_id, conn_type, host, schema, login, password, port)
VALUES (
    'postgres_default',  -- Verbindungs-ID
    'postgres',          -- Verbindungstyp
    'postgres',          -- Hostname des PostgreSQL-Containers
    'airflow',           -- Name der Datenbank
    'airflow',           -- Benutzername
    'airflow',           -- Passwort
    5432                 -- Port
);
