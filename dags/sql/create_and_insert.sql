CREATE TABLE IF NOT EXISTS example_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    value INT
);

INSERT INTO example_table (name, value)
VALUES ('Test1', 100), ('Test2', 200);
