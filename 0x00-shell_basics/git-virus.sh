#!/bin/bash

# Check if there are any changes to commit
if [[ -n $(git status -s) ]]; then
  # Add all current changes
  git add .

  # Prompt for a commit message
  read -p "Enter a commit message: " commit_message

  # Commit changes with the provided message
  git commit -m "$commit_message"

  # Push the code to the remote repository (assuming origin and main branch)
  git push origin main
else
  echo "No changes to commit."
fi

