from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from datetime import datetime

# Standardargumente für den DAG
default_args = {
    'owner': 'airflow',  # Besitzer des DAGs
    'start_date': datetime(2025, 1, 8),  # Startdatum des DAGs
    'retries': 1,  # Anzahl der Wiederholungsversuche bei Fehlern
}

# Definition des DAGs
with DAG(
    dag_id='aggregate_data_dag',  # ID des DAGs
    default_args=default_args,  # Standardargumente
    schedule='@daily',  # Zeitplan für die Ausführung (täglich)
    catchup=False,  # Keine nachträgliche Ausführung verpasster Intervalle
) as dag:

    # Task: Aggregations-SQL-Skript ausführen
    execute_aggregation = PostgresOperator(
        task_id='execute_aggregate_sql_script',  # ID des Tasks
        postgres_conn_id='postgres_default',  # Verbindung zu PostgreSQL
        sql='sql/aggregate_and_store.sql',  # Pfad zum auszuführenden SQL-Skript
    )
