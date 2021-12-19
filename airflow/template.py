""" # Example DAG

## Maintainer
* maintainer@example.com

## Description
This is what the DAG does.

## Documentation
Link to any supporting documentation.

"""

from datetime import datetime, timedelta

from airflow.models.dag import DAG
from airflow.operators.dummy import DummyOperator
from airflow.utils.task_group import TaskGroup


with DAG(
        dag_id="template",                      # Unique name of DAG
        start_date=datetime(2021, 1, 1),        # Logical starting date of the DAG (such that it cannot be triggered before this date)
        schedule_interval=timedelta(days=1),    # How often the DAG should run
        catchup=True,                           # Ensures every run between the start date and now will be triggered
        max_active_runs=1,                      # Number of DAGs can be run in parallel
        dagrun_timeout=timedelta(hours=8),      # How long a DagRun should be up before timing out / failing,        
        on_failure_callback=None,               # What to do when the DAG fails
        on_success_callback=None,               # What to do when the DAG runs succesfully
        tags=["example"],                       # Searchable tags that can be associated with a DAG
        doc_md=__doc__,                         # Documentation (Markdown) associated with the DAG
    ) as dag:

    start = DummyOperator(task_id="start")

    with TaskGroup("extract__load", tooltip="Extracts data from sources") as extract__load:
        extract__mysql = DummyOperator(task_id="extract__mysql")
        extract__pgsql = DummyOperator(task_id="extract__pgsql")
        extract__s3    = DummyOperator(task_id="extract__s3")

    with TaskGroup("transform", tooltip="Tasks for section_2") as transform:
        clean = DummyOperator(task_id="clean")
        
        with TaskGroup("aggregate", tooltip="Combines all data together") as aggregate:
            aggregate__task_1 = DummyOperator(task_id="aggregate__task_1")
            aggregate__task_2 = DummyOperator(task_id="aggregate__task_2")

            clean >> [aggregate__task_1, aggregate__task_2]

    end = DummyOperator(task_id="end")

    start >> extract__load >> transform >> end
