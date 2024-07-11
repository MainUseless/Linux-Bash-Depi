#!/bin/bash

for file in ~/*; do
    if [ -f "$file" ] || [ -d "$file" ]; then
        chmod +x "$file"
        echo "Added execute permission to: $file"
    fi
done
