# Uber Data Analysis Project

## Overview
This project involves analyzing Uber data from April to September 2014 using R programming language. The dataset was cleaned, processed, and visualized to gain insights into Uber trips and patterns.

## Dataset
The dataset comprises the following columns:
- `Time`: Time of the trip
- `Lat`: Latitude
- `Lon`: Longitude
- `Base`: Base code
## The Below Columns Were Additionally Added After Feature Extraction
- `Date.Time`: Date and Time combined
- `Time`: Time extracted from Date.Time
- `day`: Day of the trip
- `month`: Month of the trip
- `year`: Year of the trip
- `dayofweek`: Day of the week

The dataset was initially segregated into monthly data and later combined into one, resulting in approximately 3,914,616 rows.

## Libraries Used
- ggplot2
- ggthemes
- lubridate
- dplyr
- tidyr
- tidyverse
- DT
- scales

## Analysis and Visualization
The following aspects were analyzed and visualized:
- Trips by hours in a day
![Data by hour](https://github.com/Aftabbs/Uber-Data-Analysis-Project/assets/112916888/e5867bdb-38ce-4589-917b-b8221d8d6000)
![Trips by Hours In a Day](https://github.com/Aftabbs/Uber-Data-Analysis-Project/assets/112916888/f7f95a10-dd3a-440a-a450-5f49159e750f)


- Trips by hour and month
![Trips by hour and month](https://github.com/Aftabbs/Uber-Data-Analysis-Project/assets/112916888/7dcbca3e-c087-47aa-afa0-aed40fd155e0)

- Trips during every day of the month
![Trips by Day and Month](https://github.com/Aftabbs/Uber-Data-Analysis-Project/assets/112916888/535a481d-5d4c-4f16-a56b-f67547086a7d)

- Trips by day and month

  ![Trips by day of the month](https://github.com/Aftabbs/Uber-Data-Analysis-Project/assets/112916888/ac7ab5d4-4bcd-4571-be41-362242b6a8e1)
![Trips in a month](https://github.com/Aftabbs/Uber-Data-Analysis-Project/assets/112916888/2314cea6-1e00-49b5-989d-53032b7c182e)

- Trips place during months in a year (heatmap plot)
  ![Heat Map by Month and Day Of Week](https://github.com/Aftabbs/Uber-Data-Analysis-Project/assets/112916888/45a29b59-571b-4362-9585-4fa0d1dbc5ea)
![Heat Map by Month and Day](https://github.com/Aftabbs/Uber-Data-Analysis-Project/assets/112916888/efce1950-3620-479c-9a0c-cffff9f4f513)

- Heat map by month and day
![Heat Map by Hour and Day](https://github.com/Aftabbs/Uber-Data-Analysis-Project/assets/112916888/7f3fb281-0e40-43b6-bd84-80c2d2cbdb28)


## Enhancements
- Include additional analyses such as:
  - Predictive modeling of demand
  - Customer segmentation
  - Route optimization
- Explore interactive visualization tools for better user engagement
- Incorporate machine learning algorithms for more advanced analysis

## Files Included
- `uber_data_analysis.R`: R script containing data cleaning, processing, analysis, and visualization code.
## Data Set Download Link
  https://www.kaggle.com/datasets/gargshriya/uberdataset

## Usage
To reproduce the analysis:
1. Ensure R and required libraries are installed.
2. Clone this repository.
3. Run the `uber_data_analysis.R` script in RStudio or any R environment.

## Contributing
Contributions are welcome! If you have any suggestions, enhancements, or bug fixes, feel free to open an issue or submit a pull request.


