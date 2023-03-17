#!/bin/bash
#
# If the commit is a merge commit and it begins with numbers, then number is added to the commit message to reference the github issue.
#
# Example:
# > git merge 1234-bug-fix-branch
#
# Will result in the commit message:
# Merge branch '1234-bug-fix-branch' into develop
#
# Issue #1234

COMMIT_MSG_FILE=$1
COMMIT_SOURCE=$2

if [ "$COMMIT_SOURCE" != "merge" ]; then
    exit 0
fi

subject=$(head -n 1 "$COMMIT_MSG_FILE")

if ! [[ "$subject" =~ ^Merge\ branch\ \'([0-9]+)- ]]; then
    exit 0
fi

issue_number="${BASH_REMATCH[1]}"

echo "$subject" > "$COMMIT_MSG_FILE"
echo "" >> "$COMMIT_MSG_FILE"
echo "Issue #$issue_number" >> "$COMMIT_MSG_FILE"
