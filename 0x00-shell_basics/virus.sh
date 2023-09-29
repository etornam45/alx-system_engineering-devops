#!/bin/bash


# ANSI escape codes for different colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
RESET='\033[0m' # Reset color to default



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

# ASCII art for "Congratulations" in big letters
echo -e "${RED}██████╗ ██╗   ██╗███████╗██╗  ██╗${RESET}"
echo -e "${GREEN}██╔══██╗██║   ██║██╔════╝██║  ██║${RESET}"
echo -e "${YELLOW}██████╔╝██║   ██║███████╗███████║${RESET}"
echo -e "${BLUE}██╔══██╗██║   ██║╚════██║██╔══██║${RESET}"
echo -e "${MAGENTA}██████╔╝╚██████╔╝███████║██║  ██║${RESET}"
echo -e "${CYAN}╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝${RESET}"

## ALX hope you like my virus

