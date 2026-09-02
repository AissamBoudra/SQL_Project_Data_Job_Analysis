SELECT 
      j.job_id,
       j.company_id,
       j.job_title,
       c.name as compagny_name,
       j.job_location,
       j.job_country,
       j.job_schedule_type,
       j.salary_year_avg,
       j.job_posted_date

FROM public.job_postings_fact as j
inner join company_dim as c on j.company_id = c.company_id
where j.job_title_short = 'Data Analyst' and j.salary_year_avg is not null and j.job_work_from_home = 'True'

order by j.salary_year_avg DESC   
LIMIT 10;