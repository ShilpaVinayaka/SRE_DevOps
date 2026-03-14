# Monitor the resources for EC2 S3 Lambda and IAM
# Report at 6 PM everyday to mail. Integrate with cron job

#!/bin/bash

# Monitor EC2 instances
echo "EC2 Instances:"
aws ec2 describe-instances --query 'Reservations[*].Instances[*].{Instance:InstanceId,State:State.Name}' --output table

# Monitor S3 buckets
echo "S3 Buckets:"
aws s3api list-buckets --query 'Buckets[*].{Name:Name,CreationDate:CreationDate}' --output table

# Monitor Lambda functions
echo "Lambda Functions:"
aws lambda list-functions --query 'Functions[*].{FunctionName:FunctionName,Runtime:Runtime}' --output table

# Monitor IAM users
echo "IAM Users:"
aws iam list-users --query 'Users[*].{UserName:UserName,CreateDate:CreateDate}' --output table
