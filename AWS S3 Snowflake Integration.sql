-- Snowflake -- Creating DB for S3 Storage Integration 
CREATE OR REPLACE DATABASE SCD1_DB;

-- Snowflake -- Creating Storage integration 
CREATE OR REPLACE STORAGE INTEGRATION SDC1_INT
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER  = 's3'
ENABLED = True
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::459181229130:role/scd1-role'
STORAGE_ALLOWED_LOCATIONS = ('s3://scd1-de-bucket/data/');

-- Snowflake -- the code below is used to describe the Storage Integration - use to update IAM USERS & EXTERNAL ID AWS ROLE Trust policy
DESC INTEGRATION SDC1_INT;

-- Snowflake -- Creating Stage for s3 data
CREATE OR REPLACE STAGE SCD1_DB.PUBLIC.SCD1_STAGE
STORAGE_INTEGRATION  = SDC1_INT
URL= 's3://scd1-de-bucket/data/';

-- Snowflake -- Test connection by listing files in s3 bucket
ls @SCD1_DB.PUBLIC.SCD1_STAGE











