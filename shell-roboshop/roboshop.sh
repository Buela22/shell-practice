#!/bin/bash

AMI_ID=ami-09c813fb71547fc4f
SG_ID=sg-06d12382f5f429829

for instance in $@
do
    INSTANCE_ID=$(aws ec2 run-instances --image-id $AMI_ID --instance-type t3.micro --security-group-ids $SG_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" --query 'Instances[0].instanceId' --output text)

    if [ $instance != "frontend" ]; then
        IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].instance[0].PrivateIpAddress' --output text)
    else
        IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].instance[0].PublicIpAddress' --output text)
    fi  

    echo "$instance : $IP"  
done

 
    aws route53 change-resource-record-sets \
      --hosted-zone-id Z09481500FPSYTNVYZOY --change-batch 
    {
        "Comment": "Updating record set"
        "Changes": [{
        "Action"    : "UPSERT"
        ,"Resource Recordset": {
            "Name"  :  "'$RECORD_NAME'"
            "Type"  :   "A"
            "TTL"   :   1
            "ResourceRecords": [{
                "value" : "'$IP"
                }]
        }
    }]
    }

done