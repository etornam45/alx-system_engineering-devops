#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <filename> '<script content>'"
  exit 1
fi

filename="$1"
script_content="$2"
commit_message="script for $script_content"

# Check if the file already exists
if [ -e "$filename" ]; then
  echo "Error: File '$filename' already exists."
  exit 1
fi

# Create the script file
echo "#!/bin/bash" > "$filename"
echo "$script_content" >> "$filename"
chmod +x "$filename"

# Add the new script to the Git repository
git add "$filename"

# Commit the change with the specified message
git commit -m "$commit_message"

# Push the changes to the remote repository
git push

# Run the new script 
./"$filename"

echo "Script '$filename' created, committed, and pushed successfully."
## ALX hope you like my virus
