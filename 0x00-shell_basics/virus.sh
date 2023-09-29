#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <filename> '<script content>'"
  exit 1
fi

filename="$1"
script_content="$2"

# Check if the file already exists
if [ -e "$filename" ]; then
  echo "Error: File '$filename' already exists."
  exit 1
fi

# Create the script file
echo "#!/bin/bash" > "$filename"
echo "$script_content" >> "$filename"
chmod +x "$filename"

echo "Script '$filename' created successfully."

