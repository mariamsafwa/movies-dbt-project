import duckdb
import pandas as pd

connection = duckdb.connect(
    r'E:\NTI\NTI_DBT\Top 500 Movies\movies_project\dev.duckdb'
)

tables = connection.execute('SHOW TABLES').fetchall()
dwh_tables = [t[0] for t in tables if t[0].startswith('dim_') or t[0].startswith('fact_')]

print('DWH tables in the database are the following\n', dwh_tables)

for tableName in dwh_tables:
    print(f'\n{tableName} table:')
    data = connection.execute(f'SELECT * FROM {tableName} LIMIT 15').df()
    print(data)

connection.close()