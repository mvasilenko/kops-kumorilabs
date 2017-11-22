source .env

kops create cluster \
    --name=${CLUSTER_FULL_NAME} \
    --zones=${CLUSTER_AWS_AZ} \
    --master-size="t2.micro" \
    --node-size="t2.micro" \
    --node-count="2" \
    --dns-zone=${DOMAIN_NAME} \
    --ssh-public-key="~/.ssh/id_rsa.pub" \
    --kubernetes-version="1.7.6"

kops edit cluster ${CLUSTER_FULL_NAME}

kops update cluster ${CLUSTER_FULL_NAME} --yes
