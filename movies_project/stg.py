import duckdb

connection = duckdb.connect(
    r'E:\NTI\NTI_DBT\Top 500 Movies\movies_project\dev.duckdb'
)

tables = connection.execute("SHOW TABLES").fetchall()

staging_tables = [
    t[0] for t in tables
    if t[0].startswith('stg_')
]

print("Staging tables in the database are the following\n", staging_tables)

for table_name in staging_tables:
    print(f"\n{table_name} table:")

    data = connection.execute(
        f"SELECT * FROM {table_name} LIMIT 5"
    ).fetchall()

    for row in data:
        print(row)

connection.close()