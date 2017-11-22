#!/usr/bin/env bash

source .env

aws s3 mb s3://storage.$DOMAIN_NAME

export KOPS_STATE_STORE=s3://storage.$DOMAIN_NAME
