 # Google Data Analysis Capstone Project(cyclistic Bike-Share)


 **Introduction**
A descriptive data analysis of a fictional bike sharing company in Chicago called cyclistic. This case study is part of the google data analysis professional certificate capstone project, in collaboration with cousera.  Data for this study is made publicly available by motivate international Inc, under this license (https://ride.divvybikes.com/data-license-agreement), and spans from January 2020 – December 2020. 


**Scenario**:
The marketing data analyst team is faced with a challenge of understanding how casual riders and annual members use cyclistic differently. The insight obtained, will be used in optimizing marketing strategies on how to convert casual riders to annual members. Here I will be carrying out a case study, intended on answering key business question about how the casual members and annual members use cyclistic differently. It should be noted that due to the limitations and insufficient data, my focus will be sorely on understanding bike-share patterns (similarities and differences) between the casual and annual members. 

**Business Task:**
•	Analyze Cyclistic bike share data to gain insights into how casual and annual riders use cyclistic differently.

**Business Objectives**:
•	Provide insight on how the casual riders and Annual riders use cyclistic differently

 **Tools Used**: data Cleaning, transformation, analysis, and Visualization was done with R and RStudio. This case study  followed the 6 steps of data analysis as developed by Goggle --Ask, prepare, process, analyze, share and Act.

**Ask:**  The first phase of the data analysis process is asking the right questions. A clear business goal and objectives are laid out and communicated in tandem with stakeholders expectations. Using the marketing data and other strategic analytics, the bicycle marketing Analytic Team, along with the secondary stakeholder (Lily Monaro), is asked to answer the following key business question:
**How does casual riders and Annual riders use cyclistic differently?**

**Prepare**: The analytic team is given a 12-month previous historical dataset.  The team decides on using R and RStudio for all data Processing, analysis and visualization due to its large size.  The analytic team is set to check the data validation. The data is publicly available and is provided by multivate International. Next the team varifies the data set, does the data ROCC. And finds out that the dataset is complete, accurate and capable of answering the business question.

**Process:** A single data frame was created by cleaning and merging each dataset. Null values and duplicate values were removed. The analytic team excluded columns that were not relevant to the project, renamed column names that were long and unwieldy for easier reading. The cleaned dataframe was then transformed--- new columns used for data aggregation were created for providing context to the data analysis.

 **Analyze:** The dataframe is now ready for exploratory analysis that will help us uncover some insight on how the casual riders and annual members use cyclistic differently. Simple statistical summary like total trip duration by customer type, total number of trip duration by customer type and day of the week etc. was done by the team.

**Key Insight**:
•	Casual riders made about 43.4% of total riders while annual riders made 56.6% of total riders.

•	Casual riders use bikeshare service more during the weekends (Saturday and Sunday), while annual members use them consistently over the entire weekday. On average, the trip duration are 49.8 mins and 96.7 mins respectively.

•	The docked bike type is more popular among the casual riders with average trip duration of 208 minutes while the classic bike type is preferred among the annual riders with average trip duration of 16 minutes.


•	The average trip duration of casual riders is more than twice for  those of the annual members over any given period.

**Share:** Cyclistic data analytic team ensured that their analysis and visualization is in consonance with the stakeholders’ expectations and also ensures that the visualization were simple and easily understandable.

 **Act/ Recommendation**:
•	Introduce a special weekend discounted membership service. Where membership fees are renewed yearly. This can potentially cause casual riders to take up membership.
•	Cyclistic marketing team can create a special bonus based on certain threshold of number of trip and trip duration for member customers. This can potentially influence casual riders to take up membership.
•	Additional data that could expand the scope of analysis like customers occupation, pricing details, Age and gender can be collected and analyzed. This data could be used to target non-members who come under similar occupation.






