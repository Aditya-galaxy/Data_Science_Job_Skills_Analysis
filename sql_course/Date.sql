SELECT '2024-01-01'::date - '2023-12-31'::date AS days_difference;
-- This SQL query calculates the difference in days between two dates.
--@block
SELECT '2024-01-01'::date;
--@block type conversion
SELECT '2024-01-01'::date,
    '2'::INTEGER,
    'true'::BOOLEAN,
    '3.14'::REAL;
--@block
SELECT job_title_short,
    job_location as location,
    job_posted_date as date
FROM job_postings_fact
LIMIT 100;
--@block
SELECT job_title_short,
    job_location as location,
    job_posted_date::date as date
FROM job_postings_fact
LIMIT 100;
--@block DATE only
-- TIMESTAMP : DATE with time
-- TIMESTAMP WITHOUT TIME ZONE : No time zone
-- TIMESTAMP WITH TIME ZONE : With time zone
SELECT job_title_short,
    job_location as location,
    job_posted_date AT TIME ZONE 'UTC' as date
FROM job_postings_fact --Specify/ add time zone
LIMIT 100;
--@block
SELECT job_title_short,
    job_location as location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' as date,
    --Specify time zone and convert to another time zone ⬆️
    --Extract
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) as month,
    EXTRACT(
        YEAR
        FROM job_posted_date
    ) as year
FROM job_postings_fact
LIMIT 10;
--@block
SELECT COUNT(job_id) as job_posted_count,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) as month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY job_posted_count DESC;
--@block
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 1
LIMIT 10;
--@block
-- For january
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 1;
--for february
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 2;
--for march
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 3;
--check
SELECT job_posted_date
FROM march_jobs;