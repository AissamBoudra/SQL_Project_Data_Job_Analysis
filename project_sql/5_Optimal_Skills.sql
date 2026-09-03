with On_demande_skills AS 
(
   
    SELECT 
       s.skill_id
       ,s.skills
       ,Count(s.skills) as skill_count
FROM public.job_postings_fact as j
inner join skills_job_dim as sj on sj.job_id = j.job_id
inner join skills_dim as s on s.skill_id = sj.skill_id
where j.job_title_short = 'Data Analyst'and j.salary_year_avg is not null AND j.job_work_from_home = 'True'
group by s.skill_id
order by Count(s.skill_id) DESC   

),
Skills_high_salary AS
(
    SELECT 
    s.skill_id,
       s.skills,
       ROUND(AVG(j.salary_year_avg),2) as Average_Salary

FROM public.job_postings_fact as j
inner join skills_job_dim as sj on sj.job_id = j.job_id
inner join skills_dim as s on s.skill_id = sj.skill_id
where j.job_title_short = 'Data Analyst'and j.salary_year_avg is not null and j.job_work_from_home = 'True'
group by s.skill_id
order by Average_Salary

)

Select a.skill_id,a.skills, a.skill_count, b.Average_Salary 
from On_demande_skills as a
inner join Skills_high_salary as b on a.skill_id = b.skill_id
where a.skill_count > 10
order by  b.Average_Salary DESC , a.skill_count DESC
limit 25;