/* Question: How have job postings trended over time?
   Sub-Question 1: Job Titles - which job titles are growing or declining over time?
   Sub-Question 2: Salaries - how have average salaries changed over time for these job titles?
   Sub-Question 3: Geography - which countries or region are showing increased demand for data-related jobs?
                             - how do remote opportunities compare to local ones over time?
   Sub-Question 4: Skills - which skills are becoming more in demand over time?
                          - are high-demand skills also seeing higher salaries?
*/

/* Job Title Trends (demand growth/monthly) */
SELECT 
   DATE_TRUNC('month', j.job_posted_date)::DATE AS month,
   j.job_title_short,
   COUNT(j.job_id) AS total_postings
FROM job_postings_fact j 
GROUP BY month, j.job_title_short
ORDER BY month, total_postings DESC;
-- Result saved as 'job_title_demand_trends.csv'

/* Salary Trends Over Time */
SELECT 
    DATE_TRUNC('month', j.job_posted_date)::DATE AS month,
    j.job_title_short,
    ROUND(AVG(j.salary_year_avg), 2) AS avg_salary
FROM job_postings_fact j
WHERE j.salary_year_avg IS NOT NULL
GROUP BY month, j.job_title_short
ORDER BY month, avg_salary DESC;
-- Result saved as 'salary_trends.csv'

/* Geographic Trends */
SELECT 
    DATE_TRUNC('month', j.job_posted_date)::DATE AS month,
    j.job_country,
    COUNT(j.job_id) AS total_postings,
    SUM(CASE WHEN j.job_work_from_home THEN 1 ELSE 0 END) AS remote_postings
FROM job_postings_fact j
GROUP BY month, j.job_country
ORDER BY month, total_postings DESC;
-- Result saved as 'job_title_geographic_trends.csv'

/* Skills Demand & Salary Trends */
SELECT 
    DATE_TRUNC('month', j.job_posted_date)::DATE AS month,
    s.skills,
    COUNT(j.job_id) AS demand_count,
    ROUND(AVG(j.salary_year_avg), 2) AS avg_salary
FROM job_postings_fact j
JOIN skills_job_dim js 
    ON j.job_id = js.job_id
JOIN skills_dim s 
    ON js.skill_id = s.skill_id
WHERE j.salary_year_avg IS NOT NULL
GROUP BY month, s.skills
HAVING COUNT(j.job_id) > 100  -- filter to relevant skills
ORDER BY month, avg_salary DESC;
-- Result saved as 'skill_salary_trends.csv'