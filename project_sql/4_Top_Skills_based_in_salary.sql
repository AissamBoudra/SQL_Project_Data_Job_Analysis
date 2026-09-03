
    SELECT 
       s.skills,
       ROUND(AVG(j.salary_year_avg),2) as Average_Salary

FROM public.job_postings_fact as j
inner join skills_job_dim as sj on sj.job_id = j.job_id
inner join skills_dim as s on s.skill_id = sj.skill_id
where j.job_title_short = 'Data Analyst'and j.salary_year_avg is not null 
--- and j.job_work_from_home = 'True'
group by s.skills
order by Average_Salary
limit 25;
