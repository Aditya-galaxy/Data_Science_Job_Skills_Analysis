CREATE TABLE job_applications (
    job_id SERIAL PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL,
    application_date DATE NOT NULL,
    custom_resume BOOLEAN NOT NULL,
    resume_file_name VARCHAR(255) NOT NULL,
    cover_letter_sent BOOLEAN NOT NULL,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50) NOT NULL
);
SELECT *
FROM job_applications;
--@block
INSERT INTO job_applications (
        job_id,
        job_title,
        application_date,
        custom_resume,
        resume_file_name,
        cover_letter_sent,
        cover_letter_file_name,
        status
    )
VALUES (
        1,
        'Software Engineer',
        '2025-02-01',
        TRUE,
        'resume_1.pdf',
        TRUE,
        'cover_letter_1.pdf',
        'submitted'
    ),
    (
        2,
        'Data Analyst',
        '2025-02-02',
        FALSE,
        'cv_1.pdf',
        FALSE,
        NULL,
        'in_progress'
    ),
    (
        3,
        'Product Manager',
        '2025-02-03',
        TRUE,
        'resume_2.pdf',
        TRUE,
        'cover_letter_2.pdf',
        'interview_scheduled'
    ),
    (
        4,
        'UX Designer',
        '2025-02-04',
        FALSE,
        'cv_2.pdf',
        TRUE,
        'cover_letter_3.pdf',
        'offer_received'
    ),
    (
        5,
        'DevOps Engineer',
        '2025-02-05',
        TRUE,
        'resume_3.pdf',
        FALSE,
        NULL,
        'rejected'
    );
-- @block: Verify the data
SELECT *
FROM job_applications;
ALTER TABLE job_applications
ADD Contact VARCHAR(50);
--@block
ALTER TABLE job_applications
    Rename COLUMN Contact TO contact_name;
--@block
ALTER TABLE job_applications
ALTER COLUMN contact_name TYPE TEXT;
--@block
ALTER TABLE job_applications DROP COLUMN contact_name;
Update job_applications
SET contact = 'Alice Johnson'
WHERE job_id = 1;
Update job_applications
SET contact = 'Bob Smith'
WHERE job_id = 2;
Update job_applications
SET contact = 'Charlie Brown'
WHERE job_id = 3;
Update job_applications
SET contact = 'David Wilson'
WHERE job_id = 4;
Update job_applications
SET contact = 'Eve Davis'
WHERE job_id = 5;
--@block
SELECT *
from job_applications --@block
    Drop Table job_applications;