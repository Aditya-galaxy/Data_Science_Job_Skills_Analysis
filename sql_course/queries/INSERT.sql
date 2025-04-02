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