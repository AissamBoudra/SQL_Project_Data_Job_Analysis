/* 
Find job posting from the quarter that have a salary greater than $70K
- Combine job posting tables from first quarter of 2023 (Jan-Mar)
- gets job postings with an average yearly salary >$70,000
*/

/*
--- Solution 1 : with UNIO ALL + CTEs
WITH quarter_1_jobs AS (
                        Select *
                            from january_jobs 
                        UNION ALL
                            Select *
                            from february_jobs 
                        UNION ALL
                            Select *
                            from march_jobs
                        )

select 
    q1j.job_title_short
    ,q1j.job_location
    ,q1j.job_via
    ,q1j.job_posted_date
    ,q1j.salary_year_avg

from
    quarter_1_jobs as q1j
where
    q1j.salary_year_avg >'70000' and q1j.job_title_short = 'Data Analyst'
order by
    q1j.salary_year_avg asc
*/

-- Solution 2 : With UNIO ALL,  SUb quiry

select 
    q1j.job_title_short
    ,q1j.job_location
    ,q1j.job_via
    ,q1j.job_posted_date
    ,q1j.salary_year_avg
FROM (
        Select *
        from january_jobs 
    UNION ALL
        Select *
        from february_jobs 
    UNION ALL
        Select *
        from march_jobs
    ) as  q1j

where
    q1j.salary_year_avg >'70000' and q1j.job_title_short = 'Data Analyst'
order by
    q1j.salary_year_avg asc