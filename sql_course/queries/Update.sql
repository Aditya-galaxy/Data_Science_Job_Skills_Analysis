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
from job_applications