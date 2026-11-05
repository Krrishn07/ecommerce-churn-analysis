# Data Cleaning Steps

## Python Data Cleaning

1. Imported the raw Olist datasets into Python using pandas.
2. Checked data types, missing values, duplicates, and inconsistent values.
3. Cleaned and standardised customer, order, payment, and date-related fields.
4. Removed or handled duplicate and invalid records where required.
5. Converted date columns to proper datetime format.
6. Created customer-level fields, including first order date, total payment, repeat-customer flag, and inactive-customer flag.
7. Created customer segments based on purchase behaviour and inactivity.
8. Exported the cleaned customer-level dataset for SQL analysis and Power BI visualisation.

## SQL Analysis

1. Imported the cleaned dataset into SQL.
2. Verified the total number of unique customers, total revenue, repeat-customer rate, and inactive-customer rate.
3. Calculated customer distribution across segments.
4. Calculated monthly revenue trends using customer first-order dates.
5. Analysed repeat versus one-time customers and active versus inactive customers.
6. Prepared the final analysis results used in the Power BI dashboard.

## Power BI Dashboard

1. Connected Power BI to the cleaned and analysed data.
2. Created KPI cards for total customers, total revenue, repeat-customer rate, and inactive-customer rate.
3. Created a customer-segment slicer to filter the dashboard.
4. Built visuals for customer segments, monthly revenue, repeat customers, and inactive customers.
5. Formatted revenue in Brazilian Real (R$), improved chart labels, and added dashboard titles.