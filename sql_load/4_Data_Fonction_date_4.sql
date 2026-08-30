SELECT
    EXTRACT(year FROM job_posted_date) AS year,
    EXTRACT(MONTH FROM job_posted_date) AS month,
    COUNT(job_id) AS Nbr_Job
FROM
    job_postings_fact
GROUP BY
    year, MONTH
ORDER BY
    year, month;