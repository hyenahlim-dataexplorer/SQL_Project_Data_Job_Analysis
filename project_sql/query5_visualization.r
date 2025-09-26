##Question: How have job postings trended over time?
# Sub-Question 1: Job Titles - which job titles are growing or declining over time?

```{r}
# Load libraries
library(tidyverse)
library(ggplot2)
```

### 1. Overall Job Posting Trends

```{r}
# Load Datasets
job_demand_trend_raw = read.csv("/Users/hannahlim/Downloads/SQL/SQL_Project_Data_Job_Analysis/project_sql/job_title_demand_trends.csv")

# Set month works as date
job_demand_trend_raw$month = as.Date(job_demand_trend_raw$month)

# Visualization
ggplot(job_demand_trend_raw, 
       aes(x = month, y = total_postings, color = job_title_short)) + geom_line(linewidth = 0.5) + 
  labs(title = "Job Posting Trends Over Time", 
       x = "Month", y = "Total Postings", color = "Job Title") + 
  theme_minimal()
```
![Job Posting Trends](assets/5_1_job_posting_trends.png)

# Sub-Question 2: Salaries - how have average salaries changed over time for these job titles?

### 2. Salary Trends

```{r}
# Load Dataset
salary_trend_raw = read.csv("/Users/hannahlim/Downloads/SQL/SQL_Project_Data_Job_Analysis/project_sql/salary_trends.csv")
head(salary_trend_raw, n = 5)
# Set month works as date
salary_trend_raw$month = as.Date(salary_trend_raw$month)

# Visualization
ggplot(salary_trend_raw, 
       aes(x = month, y = avg_salary, fill = job_title_short)) +
  geom_col(position = "dodge") +
  labs(
    title = "Average Salary Trends by Job Title",
    x = "Month",
    y = "Average Salary (USD)",
    fill = "Job Title"
  ) + scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month") + theme_minimal() + theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "right")
```

# Sub-Question 3: Geography - which countries or region are showing increased demand for data-related jobs?
#                           - how do remote opportunities compare to local ones over time?

### 3. Geographic Trends
```{r}
job_geo_trend_raw = read.csv("/Users/hannahlim/Downloads/SQL/SQL_Project_Data_Job_Analysis/project_sql/job_title_geographic_trends.csv")

# Set month works as date
job_geo_trend_raw$month = as.Date(job_geo_trend_raw$month)

# Find top 10 countries by total postings (overall sum)
top_countries = job_geo_trend_raw %>%
  group_by(job_country) %>%
  summarise(total_postings_sum = sum(total_postings, na.rm = TRUE)) %>%
  arrange(desc(total_postings_sum)) %>%
  slice_head(n = 10) %>%
  pull(job_country)

# Filter dataset for only top 10 countries
df_top10 = job_geo_trend_raw %>%
  filter(job_country %in% top_countries)

# 1. Bar chart for total postings
df_top10 %>%
  group_by(job_country) %>%
  summarise(total_postings_sum = sum(total_postings, na.rm = TRUE)) %>%
  ggplot(aes(x = reorder(job_country, total_postings_sum), y = total_postings_sum, fill = job_country)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  labs(title = "Top 10 Countries by Total Job Postings",
       x = "Country", y = "Total Postings") +
  theme_minimal()

# 2. Bar chart for remote postings in those top 10 countries
df_top10 %>%
  group_by(job_country) %>%
  summarise(remote_postings_sum = sum(remote_postings, na.rm = TRUE)) %>%
  ggplot(aes(x = reorder(job_country, remote_postings_sum), y = remote_postings_sum, fill = job_country)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  labs(title = "Top 10 Countries by Remote Job Postings",
       x = "Country", y = "Remote Postings") +
  theme_minimal()

# 3. Time series line chart for total postings
ggplot(df_top10, aes(x = month, y = total_postings, color = job_country)) +
  geom_line(size = 0.5) +
  labs(title = "Job Posting Trends Over Time (Top 10 Countries)",
       x = "Month", y = "Total Postings") +
  theme_minimal()

# 4. Time series line chart for remote postings
ggplot(df_top10, aes(x = month, y = remote_postings, color = job_country)) +
  geom_line(size = 0.5) +
  labs(title = "Remote Job Posting Trends Over Time (Top 10 Countries)",
       x = "Month", y = "Remote Postings") +
  theme_minimal()
```

#Sub-Question 4: Skills - which skills are becoming more in demand over time?
#                       - are high-demand skills also seeing higher salaries?

### 4. Skill & Salary Demand

```{r}
# Load Dataset
skill_salary_trend_raw = read.csv("/Users/hannahlim/Downloads/SQL/SQL_Project_Data_Job_Analysis/project_sql/skill_salary_trends.csv")

# Set month works as date
skill_salary_trend_raw$month = as.Date(skill_salary_trend_raw$month)

# Visualization
# Find top 5 skills by demand
top_skills = skill_salary_trend_raw %>%
  group_by(skills) %>%
  summarise(total_demand = sum(demand_count, na.rm = TRUE)) %>%
  arrange(desc(total_demand)) %>%
  slice_head(n = 5) %>%
  pull(skills)

# Filter dataset for only top 5 skills
df_top5_skills = skill_salary_trend_raw %>%
  filter(skills %in% top_skills)

# Demand trends over time
ggplot(df_top5_skills, aes(x = month, y = demand_count, color = skills)) +
  geom_line(size = 0.5) +
  labs(title = "Top 5 Skills by Demand Over Time",
       x = "Month", y = "Demand Count") +
  theme_minimal()

# Salary trends over time
ggplot(df_top5_skills, aes(x = month, y = avg_salary, color = skills)) +
  geom_line(size = 0.5) +
  labs(title = "Average Salary Trends for Top 5 Skills",
       x = "Month", y = "Average Salary (USD)") +
  theme_minimal()
```