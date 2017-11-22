#!/usr/bin/env bash

source .env

aws route53 create-hosted-zone --name $DOMAIN_NAME --caller-reference 1

export DOMAIN_NAME_ZONE_ID=$(aws route53 list-hosted-zones | \
jq -r '.HostedZones[] |
select (.Name="'${DOMAIN_NAME}'.") |
 .Id' |
 sed 's/\/hostedzone\///')

aws s3 mb s3://storage.$DOMAIN_NAME

export KOPS_STATE_STORE=s3://storage.$DOMAIN_NAME
