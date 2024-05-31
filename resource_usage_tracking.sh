#Version:v1
#
#This Script will give details about the below AWS Resources
#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users
#

set -x # to execute in debug mode

#list S3 buckets
echo "Print list of S3 buckets"
aws s3 ls

#list EC2 Instances
echo "Print list of EC2 Instances"
aws ec2 describe-instances | jq'.Reservations[].Instances[].InstanceId'

#list lambda functions
echo "Print list of Lambda functions"
aws lambda list-functions

#list IAM Users
echo"Print list of IAM Users"
aws iam list-users


