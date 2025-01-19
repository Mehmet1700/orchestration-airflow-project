-- Check if the database 'airflow_db' exists, and create it if not
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'airflow_db') THEN
        CREATE DATABASE airflow_db;
    END IF;
END$$;

-- Check if the user 'airflow_user' exists, and create it if not
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'airflow_user') THEN
        CREATE USER airflow_user WITH PASSWORD 'airflow_pass';
    END IF;
END$$;

-- Grant all privileges on the database to 'airflow_user'
GRANT ALL PRIVILEGES ON DATABASE airflow_db TO airflow_user;

-- Connect to the 'airflow_db' database to perform table operations
\c airflow_db

-- Check if the table 'connection' exists, and delete specific rows if it does
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'connection') THEN
        DELETE FROM connection WHERE conn_id = 'postgres_default';

        -- Insert a new connection into the 'connection' table
        INSERT INTO connection (conn_id, conn_type, host, schema, login, password, port)
        VALUES (
            'postgres_default',  -- Connection ID
            'postgres',          -- Connection type
            'localhost',         -- Hostname of the PostgreSQL server
            'airflow',           -- Name of the database
            'airflow',           -- Username
            'airflow',           -- Password
            5432                 -- Port number
        );
    END IF;
END$$;
