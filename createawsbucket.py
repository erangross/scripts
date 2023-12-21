import boto3

# Replace "your-bucket-name" with the name of your S3 bucket
BUCKET_NAME = "bucket1"

# Create an S3 client using your AWS credentials
s3 = boto3.client("s3")

# Create the S3 bucket
s3.create_bucket(Bucket=BUCKET_NAME)

# Print a success message
print(f"Bucket {BUCKET_NAME} created successfully.")