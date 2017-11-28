source .env
export APP_ELB=$(kubectl get svc/${SERVICE_NAME} \
       --template="{{range .status.loadBalancer.ingress}} {{.hostname}} {{end}}")

# Add to JSON file
sed -i -e 's|"Name": ".*|"Name": "'"${DNS_RECORD_PREFIX}.${DOMAIN_NAME}"'",|g' \
    scripts/apps/dns-records/dns-record-single.json
sed -i -e 's|"Value": ".*|"Value": "'"${APP_ELB}"'"|g' \
    scripts/apps/dns-records/dns-record-single.json
sed -i -e 's|"Type": ".*|"Type": "CNAME",|g' \
    scripts/apps/dns-records/dns-record-single.json

export DOMAIN_NAME_ZONE_ID=$(aws route53 list-hosted-zones | \
jq -r '.HostedZones[] |
select (.Name="'${DOMAIN_NAME}'.") |
 .Id' |
 sed 's/\/hostedzone\///')

# Create DNS record
aws route53 change-resource-record-sets \
    --hosted-zone-id ${DOMAIN_NAME_ZONE_ID} \
    --change-batch file://scripts/apps/dns-records/dns-record-single.json
