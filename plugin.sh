#!/bin/bash

if [ -z ${PLUGIN_REPOSITORY_NAME} ]; then 
    echo "ERROR: please provide REPOSITORY_NAME"
    exit -1
fi

if [ -z ${PLUGIN_FILENAME} ]; then 
    echo "ERROR: please provide FILENAME"
    exit -1
fi

if [ -z ${PLUGIN_USERNAME} ]; then 
    echo "ERROR: please provide USERNAME"
    exit -1
fi

if [ -z ${PLUGIN_PASSWORD} ]; then 
    echo "ERROR: please provide PASSWORD"
    exit -1
fi


REPOSITORY_NAME="${PLUGIN_REPOSITORY_NAME}"
FILENAME="${PLUGIN_FILENAME}"
USERNAME="${PLUGIN_USERNAME}"
PASSWORD="${PLUGIN_PASSWORD}"

API_BASE_URL="https://hub.docker.com/v2"

# first fetch us a JWT toke for our username and password
JWT=$(curl -s -X POST -H "Content-Type: application/json" -d '{"username": "'"${USERNAME}"'", "password": "'"${PASSWORD}"'"}' ${API_BASE_URL}/users/login/ | jq -r .token)


#now upload the file 
HTTP_CODE=$(jq -n --arg msg "$(<${FILENAME})" '{"registry":"registry-1.docker.io","full_description": $msg }' | curl -s -o /dev/null  -L -w "%{http_code}" ${API_BASE_URL}/repositories/"${REPOSITORY_NAME}"/ -d @- -X PATCH -H "Content-Type: application/json" -H "Authorization: JWT ${JWT}")

if [[ "${HTTP_CODE}" = "200" ]]; then
    echo "File uploaded successfully."
else
    echo "Failed to upload file. HTTP Response Code: ${HTTP_CODE}"
    exit 1
fi

exit 0
 
