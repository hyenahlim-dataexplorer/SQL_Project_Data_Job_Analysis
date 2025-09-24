/* Question: Which locations have the highest number of job postings for data roles?
   Sub-Question: Are there differences between countries in terms of remote opportunities?
*/

SELECT 
    job_country,
    COUNT(job_id) AS total_jobs,
    SUM(CASE WHEN job_work_from_home THEN 1 ELSE 0 END) AS remote_jobs
FROM job_postings_fact
GROUP BY job_country
ORDER BY total_jobs DESC
LIMIT 10;

[
  {
    "job_country": "United States",
    "total_jobs": "206943",
    "remote_jobs": "23150"
  },
  {
    "job_country": "India",
    "total_jobs": "51197",
    "remote_jobs": "5723"
  },
  {
    "job_country": "United Kingdom",
    "total_jobs": "40439",
    "remote_jobs": "3774"
  },
  {
    "job_country": "France",
    "total_jobs": "40028",
    "remote_jobs": "1679"
  },
  {
    "job_country": "Germany",
    "total_jobs": "27782",
    "remote_jobs": "1333"
  },
  {
    "job_country": "Spain",
    "total_jobs": "25123",
    "remote_jobs": "2650"
  },
  {
    "job_country": "Singapore",
    "total_jobs": "23702",
    "remote_jobs": "264"
  },
  {
    "job_country": "Sudan",
    "total_jobs": "21519",
    "remote_jobs": "3807"
  },
  {
    "job_country": "Netherlands",
    "total_jobs": "20673",
    "remote_jobs": "734"
  },
  {
    "job_country": "Italy",
    "total_jobs": "17073",
    "remote_jobs": "751"
  }
]