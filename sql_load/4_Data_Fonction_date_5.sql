SELECT
   
    EXTRACT(MONTH FROM job_posted_date) AS month,
    COUNT(job_id) AS job_posted_count
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count desc;