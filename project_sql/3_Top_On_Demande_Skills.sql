 with total_skills AS 
    (
    SELECT 
       j.job_title_short,
       Count(s.skills) as count_total_skills

FROM public.job_postings_fact as j
inner join skills_job_dim as sj on sj.job_id = j.job_id
inner join skills_dim as s on s.skill_id = sj.skill_id
where j.job_title_short = 'Data Analyst' AND j.job_work_from_home = 'True'
group by j.job_title_short

    )   
    
    SELECT 
       j.job_title_short
       ,s.skills
       ,Count(s.skills) as skill_count
       ,((Count(s.skills) * 100.0) / (c.count_total_skills * 100.0)) * 100.00 as "%_of_total_skills"

FROM public.job_postings_fact as j
inner join skills_job_dim as sj on sj.job_id = j.job_id
inner join skills_dim as s on s.skill_id = sj.skill_id
inner join total_skills as c on c.job_title_short = j.job_title_short
where j.job_title_short = 'Data Analyst' AND j.job_work_from_home = 'True'
group by j.job_title_short,  s.skills ,c.count_total_skills
order by Count(s.skills) DESC   
LIMIT 5;