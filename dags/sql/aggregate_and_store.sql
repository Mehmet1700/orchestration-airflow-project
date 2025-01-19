-- Erstellen einer neuen Tabelle für aggregierte Daten, falls sie nicht bereits existiert
CREATE TABLE IF NOT EXISTS aggregated_data (
    id SERIAL PRIMARY KEY,          -- Primärschlüssel
    total_value INT,                -- Gesamtsumme der Werte
    average_value FLOAT,            -- Durchschnitt der Werte
    record_count INT,               -- Anzahl der Datensätze
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Zeitstempel der Erstellung
);

-- Berechnen von aggregierten Werten aus einer bestehenden Tabelle (z. B. example_table)
-- und Einfügen der Ergebnisse in die Tabelle aggregated_data
INSERT INTO aggregated_data (total_value, average_value, record_count)
SELECT 
    SUM(value) AS total_value,      -- Berechnung der Gesamtsumme der Werte
    AVG(value) AS average_value,    -- Berechnung des Durchschnitts der Werte
    COUNT(*) AS record_count        -- Zählen der Anzahl der Datensätze
FROM example_table;                 -- Quelle der Daten ist die Tabelle example_table
