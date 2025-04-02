/*
 Question: What are the top-paying data roles?
 - Identify the top 10 highest-paying roles that are available remotely.
 - Focuses on job postings with specified salaries (remove nulls).
 - Include company names of top 10 roles
 - Why? Highlight the top-paying opportunities for Data enthusiasts, offering insights into employment options and location flexibility.
 */
SELECT jp.job_id,
    jp.job_title,
    jp.job_location,
    jp.salary_year_avg,
    c.name AS company_name,
    STRING_AGG(s.skills, ', ') AS required_skills
FROM job_postings_fact jp
    INNER JOIN company_dim c ON jp.company_id = c.company_id
    INNER JOIN skills_job_dim sj ON jp.job_id = sj.job_id
    INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
GROUP BY jp.job_id,
    jp.job_title,
    jp.job_location,
    jp.salary_year_avg,
    c.name
ORDER BY salary_year_avg DESC
LIMIT 10;