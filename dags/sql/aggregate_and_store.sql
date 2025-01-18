-- Erstellen einer neuen Tabelle für aggregierte Daten
CREATE TABLE IF NOT EXISTS aggregated_data (
    id SERIAL PRIMARY KEY,
    total_value INT,
    average_value FLOAT,
    record_count INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Berechnen von aggregierten Werten aus einer bestehenden Tabelle (z. B. example_table)
INSERT INTO aggregated_data (total_value, average_value, record_count)
SELECT 
    SUM(value) AS total_value,
    AVG(value) AS average_value,
    COUNT(*) AS record_count
FROM example_table;
