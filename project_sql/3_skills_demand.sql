/* Question: What are the most in-demand technical skills (e.g., SQL, Python) across all postings?
   Sub-Question: Which skills are most frequently associated with higher salaries?
*/

-- Most In-Demand Skills
SELECT s.skills,
       COUNT(js.job_id) AS demand_count
FROM skills_job_dim js
JOIN skills_dim s ON js.skill_id = s.skill_id
GROUP BY s.skills
ORDER BY demand_count DESC
LIMIT 10;

[
  {
    "skills": "sql",
    "demand_count": "385750"
  },
  {
    "skills": "python",
    "demand_count": "381863"
  },
  {
    "skills": "aws",
    "demand_count": "145718"
  },
  {
    "skills": "azure",
    "demand_count": "132851"
  },
  {
    "skills": "r",
    "demand_count": "131285"
  },
  {
    "skills": "tableau",
    "demand_count": "127500"
  },
  {
    "skills": "excel",
    "demand_count": "127341"
  },
  {
    "skills": "spark",
    "demand_count": "114928"
  },
  {
    "skills": "power bi",
    "demand_count": "98363"
  },
  {
    "skills": "java",
    "demand_count": "85854"
  }
]

-- Skills Linked to Higher Salaries
SELECT s.skills,
       ROUND(AVG(j.salary_year_avg), 2) AS avg_salary
FROM job_postings_fact j 
JOIN skills_job_dim js ON j.job_id = js.job_id
JOIN skills_dim s ON js.skill_id = s.skill_id
WHERE j.salary_year_avg IS NOT NULL
GROUP BY s.skills
HAVING COUNT(j.job_id) > 100 -- Set threshold to 100 to ensure looking at skills that appear in at least 100 postings.
ORDER BY avg_salary DESC
LIMIT 10;

[
  {
    "skills": "mongo",
    "avg_salary": "170714.89"
  },
  {
    "skills": "cassandra",
    "avg_salary": "154124.26"
  },
  {
    "skills": "neo4j",
    "avg_salary": "147707.93"
  },
  {
    "skills": "scala",
    "avg_salary": "145119.51"
  },
  {
    "skills": "kafka",
    "avg_salary": "144753.82"
  },
  {
    "skills": "pytorch",
    "avg_salary": "144470.14"
  },
  {
    "skills": "shell",
    "avg_salary": "143370.21"
  },
  {
    "skills": "golang",
    "avg_salary": "143138.68"
  },
  {
    "skills": "airflow",
    "avg_salary": "142385.76"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "142370.32"
  }
]