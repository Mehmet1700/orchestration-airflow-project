from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from datetime import datetime

# Standardargumente für den DAG
default_args = {
    'owner': 'airflow',
    'start_date': datetime(2025, 1, 18),
    'retries': 1,
}

# Definition des DAGs
with DAG(
    dag_id='aggregate_data_dag',
    default_args=default_args,
    schedule='@daily',
    catchup=False,
) as dag:

    # Task: Aggregations-SQL-Skript ausführen
    execute_aggregation = PostgresOperator(
        task_id='execute_aggregate_sql_script',
        postgres_conn_id='postgres_default',
        sql='sql/aggregate_and_store.sql',
    )
