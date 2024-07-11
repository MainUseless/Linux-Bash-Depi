#!/bin/bash
echo -n "Enter a char:" 
read -n 1 chara
echo ""
case $chara in
  ([[:upper:]])  echo "Upper Case" ;;
  ([[:lower:]])  echo "Lower Case" ;;
  ([[:digit:]])  echo "Number" ;;
  ("")           echo "Nothing entered" ;;
  (*)            echo "Special character or something else" ;;
esac