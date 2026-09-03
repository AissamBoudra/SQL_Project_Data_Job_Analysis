with top_paying_jobs as 
( 
    SELECT 
       j.job_id
       ,j.job_title
       ,c.name as compagny_name
       ,j.salary_year_avg
FROM public.job_postings_fact as j
inner join company_dim as c on j.company_id = c.company_id
where j.job_title_short = 'Data Analyst' and j.salary_year_avg is not null and j.job_work_from_home = 'True'
order by j.salary_year_avg DESC   
LIMIT 10
)
select
    tpj.*
    ,s.skills
from top_paying_jobs as tpj
inner join skills_job_dim as sj on sj.job_id = tpj.job_id
inner join skills_dim as s on s.skill_id = sj.skill_id
order BY tpj.salary_year_avg DESC