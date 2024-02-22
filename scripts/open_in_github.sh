#!/bin/zsh

# Filepath is the first argument to the script
FILEPATH="$1"

# Line number is the second argument to the script
LINE_NUMBER="$2"

# Ensure a filepath is provided
if [ -z "$FILEPATH" ]; then
  echo "Usage: open_in_github.sh <filepath> optional(<line_number>)"
  exit 1
fi

# Get the GitHub URL
REPO_URL=$(gh repo view --json url -q .url)

# Get the current branch name
BRANCH_NAME=$(git branch --show-current)

# Get the relative filepath: note this line assumes you're running
# this script from anywhere within the git repo (doesn't have to be the root).
RELATIVE_FILEPATH=$(git ls-files --full-name $FILEPATH)

# Construct the URL
if [ -z "$LINE_NUMBER" ]; then
  URL="$REPO_URL/blob/$BRANCH_NAME/$RELATIVE_FILEPATH"
else
  URL="$REPO_URL/blob/$BRANCH_NAME/$RELATIVE_FILEPATH#L$LINE_NUMBER"
fi

echo "Opening $URL"
open $URL
