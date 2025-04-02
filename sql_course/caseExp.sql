-- CASE = IF statement
SELECT COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS job_location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY job_location_category
ORDER BY number_of_jobs DESC
LIMIT 100;
/*
 Label new columns as follows:
 -Anywhere jobs as Remote
 -New York jobs as Local
 -Otherwise as Onsite
 */