SELECT 
      job_id,
       company_id,
       job_title,
       job_location,
       job_country,
       job_schedule_type,
       salary_year_avg
       job_posted_date,

FROM public.job_postings_fact
where job_title_short = 'Data Analyst' and salary_year_avg is not null and job_work_from_home = 'True'
order by salary_year_avg DESC   
LIMIT 10;