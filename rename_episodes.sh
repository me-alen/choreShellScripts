#!/bin/bash

# Check if directory is passed
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/your/files"
  exit 1
fi

TARGET_DIR="$1"

# Check if directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory '$TARGET_DIR' not found."
  exit 1
fi

cd "$TARGET_DIR" || exit

for file in *; do
  [[ -f "$file" ]] || continue

  # Match episode code SxxExx (case-insensitive)
  if [[ $file =~ ([Ss][0-9]{2}[Ee][0-9]{2}) ]]; then
    episode_code="${BASH_REMATCH[1]}"

    # Extract everything before the episode code as the show name
    prefix="${file%%$episode_code*}"
    
    # Clean up show name:
    # - Trim trailing dots, spaces, underscores
    # - Replace spaces, underscores with dots
    # - Remove any non-alphanumeric/dot characters
    showname=$(echo "$prefix" | sed -E 's/[._ ]+/\./g' | sed -E 's/\.*$//' | sed -E 's/[^A-Za-z0-9.]+//g')

    newname="${showname}.${episode_code}"
    ext="${file##*.}"
    
    mv -v "$file" "$newname.$ext"
  else
    echo "⚠️  Episode code not found in: $file"
  fi
done
