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
--@block
SELECT *
from job_applications