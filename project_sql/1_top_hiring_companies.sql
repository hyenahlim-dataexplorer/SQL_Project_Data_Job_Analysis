/* Question: Which companies have posted the most job openings for data-related roles?
   Sub-Question: How does this vary by country or region?
*/

SELECT
  c.name AS company_name,
  CASE
    WHEN j.job_work_from_home = TRUE THEN 'Remote (Anywhere)'
    ELSE j.job_country
  END AS location,
  COUNT(j.job_id) AS total_job_postings
FROM job_postings_fact j
JOIN company_dim c ON j.company_id = c.company_id
GROUP BY c.name, location
ORDER BY total_job_postings DESC
LIMIT 10;

[
  {
    "company_name": "Emprego",
    "location": "Peru",
    "total_job_postings": "3571"
  },
  {
    "company_name": "Emprego",
    "location": "Argentina",
    "total_job_postings": "3071"
  },
  {
    "company_name": "Booz Allen Hamilton",
    "location": "United States",
    "total_job_postings": "2464"
  },
  {
    "company_name": "Confidenziale",
    "location": "Italy",
    "total_job_postings": "2033"
  },
  {
    "company_name": "Insight Global",
    "location": "United States",
    "total_job_postings": "1696"
  },
  {
    "company_name": "Capital One",
    "location": "United States",
    "total_job_postings": "1667"
  },
  {
    "company_name": "Listopro",
    "location": "Remote (Anywhere)",
    "total_job_postings": "1560"
  },
  {
    "company_name": "Guidehouse",
    "location": "United States",
    "total_job_postings": "1532"
  },
  {
    "company_name": "Dice",
    "location": "Remote (Anywhere)",
    "total_job_postings": "1427"
  },
  {
    "company_name": "Walmart",
    "location": "United States",
    "total_job_postings": "1386"
  }
]