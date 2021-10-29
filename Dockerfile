FROM jupyter/pyspark-notebook

USER root
RUN apt-get update && apt-get install -y \
    gcc

USER jovyan
COPY requirements.txt .
RUN pip install -r requirements.txt