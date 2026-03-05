#!/bin/bash

# To commit folder basis in the guide folder
for folder in guide/*/; do
    echo "Adding files from $folder"
    git add "$folder"

    # Extract folder name for commit message
    folder_name=$(basename "$folder")
    git commit -m "Add files from $folder_name"
done