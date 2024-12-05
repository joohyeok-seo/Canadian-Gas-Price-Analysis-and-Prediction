# Canadian-Gas-Price-Analysis-and-Prediction
This project analyzes and predicts gas prices across Canada using MySQL for data storage and Python for data processing.

## Table of Contents
1. [Overview](#overview)
2. [Key Features](#key-features)
3. [Setup Instructions](#setup-instructions)
4. [Analysis Files](#analysis-files)
5. [Data and Database](#data-and-database)
6. [Results and Outputs](#results-and-outputs)
7. [Dependencies](#dependencies)
8. [Future Work](#future-work)

---

## Key Features
- Database setup for structured gas price storage.
- Statistical analysis, clustering, and time-series forecasting.
- User-specific gas station recommendation system.

---

## Setup Instructions
1. Run `qurry7.sql` to create the database.
2. Execute `insert_canada_gas_prices.ipynb` to load data.
3. Run analysis notebooks (`1_basic_statistics.ipynb` to `7_prediction.ipynb`).

---

## Analysis Files
- **1_basic_statistics.ipynb**: Calculates basic statistics.
- **2_region_price_comparison.ipynb**: Compares prices by region.
- **3_time_trend_analysis.ipynb**: Analyzes trends over time.
- **4_correlation_analysis.ipynb**: Correlation between regions.
- **5_clustering.ipynb**: Groups data using K-means.
- **6_recommendation_system.ipynb**: Suggests optimal fuel options.
- **7_prediction.ipynb**: Predicts future gas prices.

### 1. Basic Statistics

#### Purpose
This notebook calculates fundamental statistics and visualizes the data distribution for gas prices across regions and fuel types.

#### Key Features
1. **Data Loading**
   - Reads the dataset into a Pandas DataFrame for analysis.
   - Provides an overview of the dataset using summary statistics.

2. **Statistical Analysis**
   - Computes mean, median, variance, min, and max values for gas prices.
   - Splits data by fuel type and region to analyze trends.

3. **Visualizations**
   - **Histogram**: Displays the distribution of gas prices for each fuel type.
   - **Boxplot**: Compares gas price distributions across regions and fuel types.

#### Key Insights
- The boxplot reveals notable price differences across regions for specific fuel types.
- Histogram shows clear clustering of prices around central tendencies for each fuel type.

#### Libraries Used
- `pandas`: For data manipulation.
- `matplotlib` and `seaborn`: For visualizations.

### 2. Region Price Comparison

#### Purpose
This notebook analyzes and visualizes the differences in average fuel prices by region and fuel type.

#### Key Features
1. **Data Preparation**
   - Groups data by `region` and `fuel_type` to calculate the average price for each combination.

2. **Statistical Analysis**
   - Compares regional average prices for each fuel type to identify patterns or outliers.

3. **Visualizations**
   - **Bar Plot**: Displays the average price for each fuel type by region.

#### Key Insights
- The bar plot highlights significant price differences across regions for certain fuel types.
- Helps identify regional pricing trends that could guide further investigation.

#### Libraries Used
- `pandas`: For data manipulation.
- `seaborn` and `matplotlib`: For creating clear and detailed visualizations.

### 3. Time Trend Analysis

#### Purpose
This notebook analyzes the trends in fuel prices over time and visualizes the monthly average prices for different fuel types.

#### Key Features
1. **Data Preparation**
   - Extracted `month` from the dataset to calculate monthly averages.
   - Grouped data by `month` and `fuel_type` to calculate mean prices.

2. **Visualizations**
   - **Line Plot**: Displays the monthly trend of average prices for each fuel type with markers to highlight data points.

#### Key Insights
- Significant price changes were observed for certain fuel types in specific months.
- Seasonal trends or anomalies can be identified using the line plot.

#### Libraries Used
- `pandas`: For data manipulation and grouping.
- `seaborn` and `matplotlib`: For creating detailed visualizations.

### 4. Correlation Analysis

#### Purpose
This notebook analyzes the correlation between average gas prices across different cities and visualizes the correlation matrix as a heatmap.

#### Key Features
1. **Data Preparation**
   - Calculates average gas prices for each city.
   - Constructs a correlation matrix using Pearson correlation coefficients.

2. **Visualizations**
   - **Heatmap**: Visualizes the correlation between cities using `seaborn`. 
   - Highlights positive and negative correlations with color-coded gradients.

#### Key Insights
- Cities with high correlations share similar price trends.
- Regions with low or negative correlations suggest distinct price dynamics.

#### Libraries Used
- `pandas`: For data manipulation and correlation calculations.
- `seaborn` and `matplotlib`: For visualizing the correlation matrix.

#### Example Output
- Heatmap showing the correlation between cities with annotations for precise correlation values.

### 5. Clustering

#### Purpose
This notebook applies clustering algorithms (K-means) to group gas price data into clusters and analyzes the characteristics of each cluster.

#### Key Features
1. **Data Preparation**
   - Combined and preprocessed data to include necessary features for clustering.
   - Selected key variables: `price` and `month_num`.

2. **Clustering**
   - Applied K-means clustering to categorize data into three clusters.
   - Assigned cluster IDs to the dataset for further analysis.

3. **Visualizations**
   - **Scatter Plot**: Displays the distribution of clusters in terms of price and month.

4. **Cluster Statistics**
   - Calculated mean prices for each cluster.
   - Displayed data points belonging to each cluster.

#### Key Insights
- Clear distinctions in gas price trends were observed between clusters.
- The clustering results provide insights into pricing patterns over time and across regions.

#### Libraries Used
- `pandas`: For data manipulation and grouping.
- `matplotlib`: For scatter plot visualization.
- `sklearn`: For K-means clustering.

#### Example Output
- Mean prices by cluster:
  - Cluster 0: 191.14
  - Cluster 1: 167.10
  - Cluster 2: 160.65
 
### 6. Recommendation System

#### Purpose
This notebook implements a recommendation system that suggests the best gas station option based on user preferences such as region, fuel type, and maximum price.

#### Key Features
1. **User Input**
   - Accepts user preferences: region, fuel type, and maximum price.

2. **Data Filtering**
   - Filters gas price data from a MySQL database based on user inputs.
   - Constructs an SQL query to fetch relevant data.

3. **Recommendation**
   - Identifies the best option (cheapest price) among the filtered data.

4. **Example Workflow**
   - **Input**:
     - Region: `Toronto, Ontario`
     - Fuel Type: `Regular`
     - Max Price: `165`
   - **Output**:
     ```
     Recommended Gas Station:
                  region    month  price fuel_type
     2  Toronto, Ontario  2023-12  143.7   Regular
     ```

#### Libraries Used
- `pandas`: For data manipulation and filtering.
- `SQLAlchemy`: For database connection and querying.
- `matplotlib` and `seaborn`: For optional data visualization.

#### Notes
- The database must include tables for regular, premium, and diesel gas prices.
- User inputs should match the available regions and fuel types in the database.

### 7. Prediction

#### Purpose
This notebook builds and evaluates a SARIMA model for predicting gas prices over a 12-month period based on historical data.

#### Key Features
1. **Data Preparation**
   - Processes time-series data using `pandas`.
   - Configures data for modeling, ensuring proper datetime indexing.

2. **SARIMA Modeling**
   - Implements SARIMA with seasonal parameters `(1, 1, 1)x(0, 1, 1, 12)`.
   - Forecasts gas prices for the next 12 months.

3. **Evaluation Metrics**
   - **Mean Squared Error (MSE)**: 0.0033
   - **Mean Absolute Error (MAE)**: 0.0474
   - **R² Score**: 0.9996

4. **Visualizations**
   - **Forecast Plot**: Displays actual vs. predicted prices with confidence intervals.

#### Key Insights
- The SARIMA model achieved high accuracy in forecasting, with an R² Score of 0.9996.
- Confidence intervals highlight the range of uncertainty in predictions.

#### Libraries Used
- `pandas`: For data manipulation and time-series handling.
- `statsmodels`: For SARIMA model implementation.
- `sklearn`: For model evaluation metrics.
- `matplotlib`: For visualizing results.

#### Example Output
- Forecasted Prices:
