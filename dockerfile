# Use the latest Apache Airflow base image
FROM apache/airflow:latest

# Switch to the root user to perform system-level operations
USER root

# Update package index, install Git, and clean up
RUN apt-get update && \
    apt-get -y install git && \
    apt-get clean

# Switch back to the airflow user
USER airflow