#!/bin/bash

# Filepath is the first argument to the script
FILEPATH="$1"

# Ensure a file path is provided
if [ -z "$FILEPATH" ]; then
  echo "Please provide a file path"
  exit 1
fi

# Get the GitHub URL
REPO_URL=$(gh repo view --json url -q .url)

# Get the current branch name
BRANCH_NAME=$(git branch --show-current)

# Get the relative filepath: not this line assumes you're running 
# this script from anywhere within the git repo (doesn't have to be the root).
RELATIVE_FILEPATH=$(git ls-files --full-name $FILEPATH)

URL="$REPO_URL/blob/$BRANCH_NAME/$RELATIVE_FILEPATH"

open $URL
