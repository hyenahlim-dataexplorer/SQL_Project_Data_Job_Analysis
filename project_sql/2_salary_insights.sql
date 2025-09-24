/* Question: What are the top-paying job titles (based on annual salaries)?
   Sub-Question: How do salaries compare across remote vs. on-site roles?
*/

-- Top Paying Job Titles (specific job title)
SELECT 
    job_title,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 10;

[
  {
    "job_title": "Geographic Information Systems Analyst - GIS Analyst",
    "avg_salary": "585000.00"
  },
  {
    "job_title": "Staff Data Scientist/Quant Researcher",
    "avg_salary": "550000.00"
  },
  {
    "job_title": "Hybrid - Data Engineer - Up to $600k",
    "avg_salary": "525000.00"
  },
  {
    "job_title": "Staff Data Scientist - Business Analytics",
    "avg_salary": "525000.00"
  },
  {
    "job_title": "VP Data Science & Research",
    "avg_salary": "463500.00"
  },
  {
    "job_title": "Data Engineer (L4) - Games",
    "avg_salary": "450000.00"
  },
  {
    "job_title": "Data Scientist (L5) - Member Product",
    "avg_salary": "450000.00"
  },
  {
    "job_title": "SVP, Data Analytics",
    "avg_salary": "425000.00"
  },
  {
    "job_title": "Hybrid - Data Engineer",
    "avg_salary": "425000.00"
  },
  {
    "job_title": "Senior Data Engineer, Security Master",
    "avg_salary": "425000.00"
  }
]

-- Top Paying Job Titles (short job title)
SELECT 
    job_title_short,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
GROUP BY job_title_short
ORDER BY avg_salary DESC
LIMIT 10;

[
  {
    "job_title_short": "Senior Data Scientist",
    "avg_salary": "154050.03"
  },
  {
    "job_title_short": "Senior Data Engineer",
    "avg_salary": "145866.87"
  },
  {
    "job_title_short": "Data Scientist",
    "avg_salary": "135929.48"
  },
  {
    "job_title_short": "Data Engineer",
    "avg_salary": "130266.87"
  },
  {
    "job_title_short": "Machine Learning Engineer",
    "avg_salary": "126785.91"
  },
  {
    "job_title_short": "Senior Data Analyst",
    "avg_salary": "114104.05"
  },
  {
    "job_title_short": "Software Engineer",
    "avg_salary": "112777.64"
  },
  {
    "job_title_short": "Cloud Engineer",
    "avg_salary": "111268.45"
  },
  {
    "job_title_short": "Data Analyst",
    "avg_salary": "93875.79"
  },
  {
    "job_title_short": "Business Analyst",
    "avg_salary": "91071.04"
  }
]

-- Remote vs On-site Salary Comparison
SELECT
    job_work_from_home,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
GROUP BY job_work_from_home
ORDER BY avg_salary DESC;

[
  {
    "job_work_from_home": true,
    "avg_salary": "131779.21"
  },
  {
    "job_work_from_home": false,
    "avg_salary": "121784.11"
  }
]