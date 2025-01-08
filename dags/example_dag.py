from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from datetime import datetime

# Standardargumente für den DAG
default_args = {
    'owner': 'airflow',
    'start_date': datetime(2025, 1, 8),
    'retries': 1,
}

# Definition des DAGs
with DAG(
    dag_id='example_postgres_dag',
    default_args=default_args,
    schedule_interval=None,
    catchup=False,
) as dag:

    # Task: SQL-Skript ausführen
    execute_sql = PostgresOperator(
        task_id='execute_sql_script',
        postgres_conn_id='postgres_default',
        sql='sql/create_and_insert.sql',
    )
