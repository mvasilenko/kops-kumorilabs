source .env

kubectl config set-context ${CLUSTER_ALIAS} --cluster=${CLUSTER_FULL_NAME} \
        --user=${CLUSTER_FULL_NAME}

kubectl config use-context ${CLUSTER_ALIAS}
