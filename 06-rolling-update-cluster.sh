source .env
echo Change the value for kubernetesVersion: from 1.6.4 to 1.7.6, press Enter
read
kops edit cluster ${CLUSTER_FULL_NAME}
kops update cluster ${CLUSTER_FULL_NAME} --yes
echo running kops rolling-update cluster ${CLUSTER_FULL_NAME} --yes
kops rolling-update cluster ${CLUSTER_FULL_NAME} --yes
echo Change number of nodes
echo change the values for maxSize minSize: from 2 to 4, press Enter
read
kops edit ig nodes
