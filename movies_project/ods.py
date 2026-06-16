import duckdb

connection = duckdb.connect(
    r'E:\NTI\NTI_DBT\Top 500 Movies\movies_project\dev.duckdb'
)

tables = connection.execute("SHOW TABLES").fetchall()

for (table_name,) in tables:
    print(f"\n{'='*50}")
    print(f"Table: {table_name}")
    print('='*50)

    columns = connection.execute(
        f"DESCRIBE {table_name}"
    ).fetchall()

    print("\nColumns:")
    for col in columns:
        print(col[0])

    print("\nFirst 5 Rows:")
    rows = connection.execute(
        f"SELECT * FROM {table_name} LIMIT 5"
    ).fetchall()

    for row in rows:
        print(row)

connection.close()

