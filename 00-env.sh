export AWS_PROFILE=your_profile
export DOMAIN_NAME="your_domain"

# Friendly name to use as an alias for your cluster
export CLUSTER_ALIAS="k8s"

# Leave as-is: Full DNS name of you cluster
export CLUSTER_FULL_NAME="${CLUSTER_ALIAS}.${DOMAIN_NAME}"

# AWS availability zone where the cluster will be created
export CLUSTER_AWS_AZ="us-east-1a"
# for automatic DNS creation
export DNS_RECORD_PREFIX="your-app"
export APP_NAME="your-app"
# your app service name
export SERVICE_NAME="your-app-svc"
# app url
export APP_URL=http://${DNS_RECORD_PREFIX}.${DOMAIN_NAME}
export DOCKERHUB_USERNAME=your_dockerhub_username
export DOCKERHUB_PASSWORD=your_dockerhub_password
