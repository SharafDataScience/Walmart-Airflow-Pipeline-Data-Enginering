# Walmart Holiday Sales Data Pipeline 

This project builds a **data pipeline** to analyze Walmart's grocery sales around major public holidays such as Super Bowl, Labour Day, Thanksgiving, and Christmas.  
The goal is to process, transform, and analyze the data to uncover seasonal sales patterns and store the results efficiently.

## Project Overview

- **Data Sources**:
  - **Grocery Sales Table** from a PostgreSQL database
  - **Complementary Data** from a Parquet file (`extra_data.parquet`)
  
- **Pipeline Steps**:
  - Extract and merge data from multiple sources
  - Clean and transform the raw data
  - Aggregate monthly sales data
  - Save the cleaned and aggregated data to CSV files
  - Validate that the output files were correctly saved

## Technologies Used

- Python 3
- Pandas
- Parquet (data format)
- PostgreSQL (source database)
- OS module (file validation)

## Functions Overview

- `extract(store_data, extra_data_path)`:  
  Merges grocery sales data with complementary data based on the "index" column.

- `transform(raw_data)`:  
  Cleans the data by:
  - Filling missing values
  - Converting date columns
  - Extracting month values
  - Filtering based on minimum sales
  - Dropping unnecessary columns

- `avg_weekly_sales_per_month(clean_data)`:  
  Calculates the average weekly sales per month.

- `load(full_data, full_data_file_path, agg_data, agg_data_file_path)`:  
  Saves both cleaned and aggregated data into CSV files.

- `validation(file_path)`:  
  Verifies if the output CSV files were successfully created.

## Data Features

### grocery_sales Table:
- `"index"`: Unique row ID
- `"Store_ID"`: Store number
- `"Date"`: Sales week
- `"Weekly_Sales"`: Weekly sales amount

### extra_data.parquet:
- `"IsHoliday"`: 1 if the week includes a holiday, otherwise 0
- `"Temperature"`: Temperature at the time of sale
- `"Fuel_Price"`: Regional fuel price
- `"CPI"`: Consumer Price Index
- `"Unemployment"`: Unemployment rate
- `"MarkDown1-4"`: Promotional markdowns
- `"Dept"`: Department number
- `"Size"`: Store size
- `"Type"`: Store type (inferred from Size)

### Final Transformed Columns:
- `Store_ID`
- `Month`
- `Dept`
- `IsHoliday`
- `Weekly_Sales`
- `CPI`
- `Unemployment`

## Output

Two CSV files are generated:
- `clean_data.csv`: Cleaned and processed dataset
- `agg_data.csv`: Aggregated average weekly sales per month


