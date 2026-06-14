🏠 Home Energy Consumption Analysis Using Smart Meter & Weather Data

📌 Overview

This project focuses on data preprocessing, integration, and exploratory visualization of household energy consumption data collected from smart meters, combined with historical weather information.

Using the UCI Household Power Consumption Dataset and weather data retrieved via the Meteostat API, the project demonstrates how raw energy and weather datasets can be:

Cleaned and transformed

Time-aligned and merged

Explored through meaningful visualizations

⚠️ Note:
This project does NOT build or train any machine learning or predictive models.
Its purpose is data preparation, feature exploration, and visualization to support future analytical or ML-based work.

📊 Dataset Information
🔌 Energy Consumption Dataset

Source: UCI Machine Learning Repository

Link: https://archive.ics.uci.edu/dataset/235/individual+household+electric+power+consumption

Time Period: December 2006 – November 2010

Description: Minute-level measurements of household electrical power usage.

🌦 Weather Dataset

Source: Meteostat API

Description: Historical weather data aligned with the energy dataset timeline.

🧩 Features Included
Energy Data

Date

Time

Global Active Power

Global Reactive Power

Voltage

Global Intensity

Sub-metering 1, 2, and 3

Weather Data

Average Temperature

Minimum Temperature

Maximum Temperature

Total Precipitation

Snow Depth

Wind Speed

Sea-Level Pressure

⚙️ Requirements

Python 3.x

Libraries:

numpy

pandas

matplotlib

seaborn

scikit-learn

ydata_profiling

meteostat

🧹 Data Processing Pipeline
1️⃣ Data Cleaning

Handling missing and invalid values

Converting date and time into proper datetime format

Resampling and aggregation (hourly/daily/monthly where needed)

2️⃣ Feature Engineering

Time-based features (hour, day, month, seasonality)

Lagged energy consumption features

Aggregated consumption metrics

3️⃣ Dataset Merging

Time-based alignment of energy and weather datasets

Creation of a unified dataset for exploratory analysis

📈 Data Visualization

The project includes several exploratory visualizations such as:

Time series trends of global active power

Energy consumption distribution analysis

Correlation heatmaps between energy and weather variables

Seasonal and temporal usage patterns

🔗 Interactive profiling report:
Household Energy Consumption Profile Report

🚀 Future Scope

Although this project does not include machine learning, it can serve as a foundation for future work such as:

Predictive Modeling – Using the prepared dataset for forecasting energy consumption

Smart Home Analytics – Integrating real-time IoT smart meter data

Energy Optimization Studies – Identifying peak usage patterns and inefficiencies

Anomaly Detection – Detecting unusual consumption behavior

▶️ Usage

Clone the repository

git clone https://github.com/snehapadgaonkar/Household-energy-consumption-prediction.git
cd final


Prepare the dataset

Download the UCI dataset

Update file paths in the notebook if required

Install dependencies

pip install -r requirements.txt


Run the notebook

Follow the steps for data cleaning, merging, and visualization

✅ Conclusion

This project demonstrates a complete data preprocessing and exploratory analysis workflow for household energy consumption data enriched with weather information.
It provides a clean, well-structured dataset and insightful visualizations, making it an excellent starting point for further analytics or machine learning applications.