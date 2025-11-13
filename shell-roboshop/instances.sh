#!/bin/bash

aws ec2 run-instances \
    --image-id ami-09c813fb71547fc4f \
    --instance-type t3.micro \
    --security-group-id sg-06d12382f5f429829 \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Test}]' 
   