######
# Derived from:
# Author: Marcello de Sales (marcello.desales@gmail.com)
# Description: Create Create Environment Variables in EC2 Hosts from EC2 Host Tags
######

# Loads the Tags from the current instance
getInstanceTags () {
  # http://aws.amazon.com/code/1825 EC2 Instance Metadata Query Tool
  INSTANCE_ID=$(/usr/local/bin/ec2-metadata | grep instance-id | awk '{print $2}')
  #Mozilla Modification to Discern Region
  REGION=$(/usr/local/bin/ec2-metadata | grep -i placement | awk '{print $2}' | rev | cut -c2- | rev)
  # Describe the tags of this instance
  aws ec2 describe-tags --region $REGION --filters "Name=resource-id,Values=$INSTANCE_ID"
}


tags_to_env () {
    tags=$1

    for key in $(echo $tags | /usr/bin/jq -r ".[][].Key"); do
        value=$(echo $tags | /usr/bin/jq -r ".[][] | select(.Key==\"$key\") | .Value")
        key=$(echo $key | /usr/bin/tr '-' '_' | /usr/bin/tr '[:lower:]' '[:upper:]')
        echo "Exporting $key=$value"
        export $key="$value"
    done
}

#Push into the env
instanceTags=$(getInstanceTags)
tags_to_env "$instanceTags"
