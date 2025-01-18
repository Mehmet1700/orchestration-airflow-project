-- Löschen von Datensätzen, die älter als 30 Tage sind
DELETE FROM example_table
WHERE created_at < NOW() - INTERVAL '30 days';

-- Optional: Bereinigen von Nullwerten in bestimmten Spalten
UPDATE example_table
SET name = 'Unknown'
WHERE name IS NULL;
