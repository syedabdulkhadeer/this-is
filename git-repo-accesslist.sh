#!/bin/bash

###########################
# Author	: Abdul Khadeer
# Date		: 02-03-2024
# Purpose	: To list the users of github repo with read access
# Version	: Version v2
# #########################

#set -exo	# (error, debugging, pipeline failure)

# Calling the helper function to execute on top of all
helper{}

# Providing GitHub URL
GitHub_API_URL="https://api.github.com"

# Providing GitHub username and Personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information at the time of exec, cli args
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request from GitHub API
function github_api_get {
	local endpoint="$1"
	local url="${GitHub_API_URL}/${endpoint}"

	# Send a GET request to the GitHub API  with authentication
	curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to listout users with read access to the repository
function list_users_with_read_access {
	local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

	# Fetch the list of collaborators in the repository with json jq perser
	collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

	# Display the list of collaborators with the read access 
	if [[ -z "$collaborators" ]]; then
		echo "No Users with read access found for : ${REPO_OWNER}/${REPO_NAME}."
	else
		echo "The Users with read access to : ${REPO_OWNER}/${REPO_NAME}:"
		echo "$Collaborators"
	fi
}

# Adding the helper funtion to guide through the executor
function helper {
expected_cmd_args=2
if [ $# -ne $expecte_cmd_args ]; then
        echo "Must enter the required inputs at the time execution!"
else
        echo "asd"
fi
}

# Main script
echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}:"
list_users_with_read_access
