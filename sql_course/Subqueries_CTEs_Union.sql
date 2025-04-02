--Temporary result set
--Subquery : simple nested query
--CTEs : Common Table Expressions for more complex queries
SELECT *
FROM (
        --Subquery starts here
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(
                MONTH
                FROM job_posted_date
            ) = 1
    ) AS january_jobs;
--Subquery ends here
--@block
--CTEs : exist only while executing the query
WITH january_jobs AS (
    -- CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(
            MONTH
            FROM job_posted_date
        ) = 1
) -- CTE definition ends here
-- Run next query on this CTE
SELECT *
FROM january_jobs;
--
--@block
--Subquery
SELECT company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN(
        SELECT company_id
        FROM job_postings_fact
        WHERE job_no_degree_mention = true
        ORDER BY company_id
    ) --
--@block
    --CTE
    /*
     Find the companies that have the most job openings.
     - Get the total number of job postings per company id (job_posting_fact)
     - Return the total number of jobs with the company name (company_dim)  
     */
    WITH job_postings_per_company AS(
        SELECT company_id,
            --temporary result set
            COUNT(*) AS total_job_postings
        FROM job_postings_fact
        GROUP BY company_id
    )
SELECT company_dim.name AS company_name,
    job_postings_per_company.total_job_postings
FROM company_dim
    LEFT JOIN job_postings_per_company ON company_dim.company_id = job_postings_per_company.company_id
ORDER BY job_postings_per_company.total_job_postings DESC;
--
--@block
--Problem
/*
 Find the count of the number of remote job postings per skill
 - Display the top 5 skills by their demand in remote jobs
 - Include skill ID, name, and count of postings requiring the skill
 */
WITH remote_job_skills AS (
    SELECT skill_id,
        COUNT(skill_id) AS skill_count
    FROM skills_job_dim AS job_skill
        INNER JOIN job_postings_fact AS job ON job_skill.job_id = job.job_id
    WHERE job.job_work_from_home = true --AND job.job_title_short = 'Data Analyst'
    GROUP BY skill_id
) -- do this op
SELECT skill.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills
    INNER JOIN skills_dim AS skill ON skill.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC;
--
--@block
--Union : To combine the result set of two or more SELECT statements
--To combine rows : Need to have same columns
--no repetition of rows
--UNION ALL : To include all rows ** MOSTLY USED
--UNION : To remove duplicate rows
-- Get jobs and companies from January , February, and March
SELECT job_title_short,
    company_id,
    job_location
FROM january_jobs
UNION ALL
SELECT job_title_short,
    company_id,
    job_location
FROM february_jobs
UNION ALL
SELECT job_title_short,
    company_id,
    job_location
FROM march_jobs;
--
--@block
--Problem
/*Find job postings from the first quarter that have a salary greater than
 - Combine job posting tables from the first quarter of 2023 (Jan-Mar)
 - Gets job postings with an average yearly salary > $70,000
 */
SELECT job_title_short,
    job_location,
    job_via,
    job_posted_date::date,
    salary_year_avg
FROM (
        SELECT *
        FROM january_jobs
        UNION ALL
        SELECT *
        FROM february_jobs
        UNION ALL
        SELECT *
        FROM march_jobs
    ) AS q1_jobs
WHERE q1_jobs.salary_year_avg > 70000 --AND q1_jobs.job_title_short = 'Data Analyst'
ORDER BY q1_jobs.salary_year_avg DESC;