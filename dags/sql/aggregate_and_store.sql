-- Überprüfen, ob die Datenbank 'airflow_db' existiert, und sie erstellen, falls nicht
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'airflow_db') THEN
        CREATE DATABASE airflow_db;  -- Erstellt die Datenbank 'airflow_db', falls sie nicht existiert.
    END IF;
END$$;

-- Überprüfen, ob der Benutzer 'airflow_user' existiert, und ihn erstellen, falls nicht
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'airflow_user') THEN
        CREATE USER airflow_user WITH PASSWORD 'airflow_pass';  -- Erstellt den Benutzer 'airflow_user' mit dem Passwort 'airflow_pass', falls er nicht existiert.
    END IF;
END$$;

-- Alle Rechte an der Datenbank 'airflow_db' an den Benutzer 'airflow_user' vergeben
GRANT ALL PRIVILEGES ON DATABASE airflow_db TO airflow_user;  -- Gibt dem Benutzer 'airflow_user' vollständige Zugriffsrechte auf die Datenbank.

-- Verbindung zur Datenbank 'airflow_db' herstellen, um Tabellenoperationen durchzuführen
\c airflow_db  -- Wechselt zur Datenbank 'airflow_db'.

-- Überprüfen, ob die Tabelle 'connection' existiert, und bestimmte Zeilen löschen, falls sie existiert
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'connection') THEN
        DELETE FROM connection WHERE conn_id = 'postgres_default';  -- Löscht Einträge mit der Verbindungs-ID 'postgres_default' aus der Tabelle 'connection'.

        -- Fügt eine neue Verbindung in die Tabelle 'connection' ein
        INSERT INTO connection (conn_id, conn_type, host, schema, login, password, port)
        VALUES (
            'postgres_default',  -- Verbindungs-ID
            'postgres',          -- Verbindungstyp (PostgreSQL)
            'localhost',         -- Hostname des PostgreSQL-Servers
            'airflow',           -- Name der Datenbank
            'airflow',           -- Benutzername für die Verbindung
            'airflow',           -- Passwort für die Verbindung
            5432                 -- Portnummer des PostgreSQL-Servers
        );
    END IF;
END$$;
