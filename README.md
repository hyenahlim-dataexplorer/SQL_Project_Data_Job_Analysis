# Data Job Market Analytics: Insights into Hiring, Skills, Salaries, and Trends
## 📌 Introduction
The data job market is rapidly evolving, shaped by advancements in AI, cloud technologies, and global hiring practices. This project analyzes real-world job postings data to uncover trends in hiring companies, compensation, skills demand, and geographic distribution. By leveraging SQL for querying and aggregating, the analysis provides data-driven insights into what drives opportunities in the data field.

**Main Character (Y)**: Data-related jobs (the central narrative)
**Sub-main Characters (X)**: Salaries, Skills, Location, Company, and Time (the factors shaping the story).

The analysis treats the job market as a dynamic ecosystem where the main character (data roles) is influenced by multiple forces (sub-main characters).
 
- SQL queries & result: [project_sql folder](/project_sql/)
- R Visualiation Code: [project_sql folder](/project_sql/query5_visualization.r)

## 📂 Background
* Dataset: Job postings fact table and supporting dimension tables (titles, companies, skills, location)
* Purpose: Explore hiring demand, salary structures, skills premium, and geographic distribution using SQL queries.
* Approach: A question-driven analysis where each query answers a targeted job market question.

## 🛠 Tools & Environment
* **SQL Engine**: PostgreSQL
* **IDE**: Visual Studio Code
* **Version Control**: Git, GitHub
* **Visualization & Storytelling**: R, Notion (for non-technical presentation)

## 🔍 Summary of Analysis
1. **Top Hiring Companies**
* Emprego (Latin America) dominated hiring, while U.S. companies like Booz Allen Hamilton, Capital One, Walmart, Insight Global were also leaders.
* Remote-first platforms (e.g., Listopro, Dice) highlighted the rise of global distributed hiring.

2. **Salary Insights**
* High-paying niche roles: GIS Analysts ($585k), Quantitative Data Scientist ($550k+).
* Generalized titles: Senior Data Scientist ($154k), Senior Data Engineer ($146k).
* Remote vs On-site: Remote roles averaged ~$132k vs. ~$122k for on-site.

3. **Skills Demand**
* Most in-demand: SQL (385k postings), Python (382k postings), cloud platforms (AWS, Azure).
* High-salary premium skills: MongoDB, Cassandra, Neo4j, Scala, Kafka (~$140k-$170).
  * Demand ≠ Salary: SQL & Python are most demanded, but niche tools like 
    Cassandra/Scala  carry higher salary premiums.

4. **Geographic Distribution**
* U.S. dominates (207k postings, 23k remote).
* India, UK, France, Germany emerge as strong markets.
* Sudan surprisingly appears with 21k postings, reflecting regional hiring platforms.

5. **Market Trends Over Time**
* Salary inflation observed for senior roles and hybrid jobs.
* Remote opportunities are gaining traction globally.
* Cloud, ML/AI frameworks, and bid data tools are becoming more prominent over time.

## 📈 Conclusion
The market signals convergence toward advanced, engineering-heavy skill sets, remote-first hiring models, and pay stratification based on niche tool adoption. For technical professionals and hiring managers, strategic investment in cloud, AI/ML, and distributed data systems skills will maximize competitiveness.

### References
* Barousse, Luke. SQL for Data Analytics. Available at: [(https://www.youtube.com/watch?v=7mz73uXD9DA)]