#!/bin/bash
#
##############################################
# Author : Karthikeyan
# Date : 10th feb 25
#
# version : v1
#
# This script will check the status of used aws services
#
# ############################
#
# Services
#
# AWS S3
# AWS LAMBA
# AWS EC2
# AWS IAM
#
set -e
# list s3 buckets
#
date -u >usagecheck
echo -e "\n Printing s3 buckets \n " >> usagecheck
aws s3 ls >> usagecheck

# list ec2 instances
#
echo -e "\n Printing ec2 instance id \n" >> usagecheck
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >>usagecheck

#list aws lambda
echo -e "\n Printing lambda functions \n" >> usagecheck
aws lambda list-functions >>usagecheck

#list IAM users
#
echo -e "\n Printing iam users \n" >> usagecheck
aws iam list-users >> usagecheck
