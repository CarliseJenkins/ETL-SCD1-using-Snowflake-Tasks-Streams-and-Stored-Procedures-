#TESTING LOGIC Using Python code

import boto3
import yaml

with open('aws_credentials.yml', 'r') as file:
    
    aws_credentials = yaml.safe_load(file)



# Extract credentials from YAML
aws_access_key_id = aws_credentials['aws_access_key_id']

aws_secret_access_key = aws_credentials['aws_secret_access_key']

aws_region_name = aws_credentials['aws_region_name']

 

# Initialize a session using AWS credentials
session = boto3.Session(

    aws_access_key_id=aws_access_key_id,

    aws_secret_access_key=aws_secret_access_key,

    region_name=aws_region_name

)

 
#Update the below variables values with your details

file_name = 'customer_full_data.csv'

bucket_name = 'scd1-de-bucket'

folder_name = 'data'

# Create an S3 client

s3_client = session.client('s3')

 

try: 
    # Upload file in S3

    s3_client.upload_file( 

    Filename =file_name, 

    Bucket=bucket_name, 

    Key=folder_name + '/' + file_name

    )

    print(file_name + " is uploaded sucessfully")

 

except Exception as e:

        print(f"An error occurred: {e}")
