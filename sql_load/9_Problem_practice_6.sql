

CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(year FROM job_posted_date) = 2023 
      AND EXTRACT(month FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(year FROM job_posted_date) = 2023 
      AND EXTRACT(month FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(year FROM job_posted_date) = 2023 
      AND EXTRACT(month FROM job_posted_date) = 3;

SELECT *
from march_jobs