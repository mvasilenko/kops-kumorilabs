#!/bin/bash
source .env
aws autoscaling describe-auto-scaling-groups --query 'AutoScalingGroups[].AutoScalingGroupName[]'
aws autoscaling update-auto-scaling-group --auto-scaling-group-name nodes.${CLUSTER_ALIAS}.${DOMAIN_NAME} --min-size 2 --max-size 2
aws autoscaling update-auto-scaling-group --auto-scaling-group-name master-us-east-1a.masters.${CLUSTER_ALIAS}.${DOMAIN_NAME} --min-size 1 --max-size 1
