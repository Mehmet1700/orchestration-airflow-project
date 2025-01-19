-- Erstellen einer neuen Tabelle namens example_table, falls sie nicht bereits existiert
CREATE TABLE IF NOT EXISTS example_table (
    id SERIAL PRIMARY KEY,  -- Primärschlüssel, der automatisch inkrementiert wird
    name VARCHAR(50),       -- Spalte für Namen mit einer maximalen Länge von 50 Zeichen
    value INT               -- Spalte für Werte vom Typ Integer
);

-- Einfügen von Beispiel-Daten in die Tabelle example_table
INSERT INTO example_table (name, value)
VALUES 
    ('Test1', 100),  -- Einfügen eines Datensatzes mit dem Namen 'Test1' und dem Wert 100
    ('Test2', 200);  -- Einfügen eines Datensatzes mit dem Namen 'Test2' und dem Wert 200
