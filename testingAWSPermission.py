import logging
import boto3

# Set the log level to "debug"
logging.basicConfig(level=logging.DEBUG)

# Configure a logger to output the log messages
logger = logging.getLogger("botocore")

# Replace "your-bucket-name" with the name of your S3 bucket
BUCKET_NAME = "bucket1"

# Create an S3 client using your AWS credentials
s3 = boto3.client("s3")

# List the contents of the S3 bucket
response = s3.list_objects(Bucket=BUCKET_NAME)

# Print the contents of the S3 bucket
for obj in response.get("Contents", []):
    print(obj["Key"])