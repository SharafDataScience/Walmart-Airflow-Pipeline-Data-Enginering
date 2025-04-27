![image](https://github.com/user-attachments/assets/3c0086ae-8318-449a-9b55-8f577ca53433)

# Walmart Holiday Sales Data Pipeline

This project builds a **modern ETL data pipeline** to analyze Walmart's grocery sales around major US public holidays, including the Super Bowl, Labour Day, Thanksgiving, and Christmas.

The pipeline is fully automated with **Apache Airflow**, uses **Docker** for containerization, and includes **unit tests** to ensure the reliability of each ETL step.

---

## Project Overview

- **Data Sources**:
  - **PostgreSQL**: Grocery sales main table
  - **Parquet File**: Extra complementary data (`extra_data.parquet`)

- **ETL Steps**:
  1. **Extract**: Merge grocery sales with extra data.
  2. **Transform**: Clean, filter, and restructure the dataset.
  3. **Aggregate**: Calculate average weekly sales per month.
  4. **Load**: Save processed data to CSV files.
  5. **Validate**: Ensure output files are successfully saved.

- **Airflow DAG**:
  - DAG Name: `etl_workflow_dag`
  - Orchestrates the full ETL pipeline with sensors, operators, and branching.

- **Testing**:
  - Unit tests for each ETL step using `pytest`.

---

## Technologies Used

- Python 3
- Pandas
- PyArrow / Fastparquet
- PostgreSQL
- Apache Airflow 2.7+
- Docker & Docker Compose
- OS Module
- Pytest (for testing)

---

##  Data Features

| Table            | Description                                 |
|------------------|---------------------------------------------|
| `grocery_sales`   | Store sales weekly data                    |
| `extra_data`      | Holidays, economy indicators, promotions   |

**Transformed Columns:**
- `Store_ID`
- `Month`
- `Dept`
- `IsHoliday`
- `Weekly_Sales`
- `CPI`
- `Unemployment`

---

## Output

The pipeline generates two output CSV files:
- `output/clean_data.csv`: Fully cleaned and filtered dataset.
- `output/agg_data.csv`: Aggregated average weekly sales per month.

---

## ETL Functions Summary

| Function | Purpose |
|:---------|:--------|
| `extract(store_data, extra_data_path)` | Merge grocery sales with extra data |
| `transform(raw_data)` | Clean and restructure dataset |
| `avg_weekly_sales_per_month(clean_data)` | Aggregate average sales per month |
| `load(full_data, full_path, agg_data, agg_path)` | Save data as CSV |
| `validation(file_path)` | Check if file exists |

---


##  How to Run Airflow on Windows 11 (via Docker)

Because Airflow is tricky on Windows, we use **Docker**.

### Step 1: Install Prerequisites
- Install **Docker Desktop** with **WSL 2** enabled.
- Install **Git** if needed.

[Install Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)  
[Install WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)

---

### Step 2: use floowing files to Setup the Project

- docker-compose.yml
- dockerfile


