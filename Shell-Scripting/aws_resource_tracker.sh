#!/bin/bash
##############################
# Author-Suresh
# Date: 10-02-2025
# version-v1
# This script will report the AWS resource usage
##############################

set -x #debug mode
# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM user
# list s3 buckets
echo "this is lis of s3"
aws s3 ls

#List EC2 instance
echo "this is list of ec2 info"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'


#list lambda
echo "this is lambda info"
aws lambda list-functions

#List IAM users
echo "this is about IAM info"
aws iam list-users
