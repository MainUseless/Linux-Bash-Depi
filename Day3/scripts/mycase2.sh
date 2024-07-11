#!/bin/bash

# Prompt user for input and read the entire line
printf "Enter a string: "
read string
echo $string
# Check the type of string using conditional statements (mimicking switch-case)
case "$string" in
  ("")           echo "Nothing entered" ;;
  # Check for all uppercase letters (similar to switch-case)
  (^[A-Z]+$)  echo "Upper Case" ;;
  # Check for all lowercase letters
  (^[a-z]+$)  echo "Lower Case" ;;
  # Check for all digits
  (^[0-9]+$)  echo "Numbers" ;;
  # Catch-all for any other case
  (*)            echo "Mix" ;;
esac