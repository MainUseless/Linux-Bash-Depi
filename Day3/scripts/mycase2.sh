#!/bin/bash
echo -n "Enter a char:" 
read -r chara

case "$chara" in
  "" )
    echo "Nothing entered"
    ;;
  *[![:alnum:]]* )
    echo "Special character or something else"
    ;;
  *[[:upper:]]* )
    if [[ "$chara" =~ ^[[:upper:]]+$ ]]; then
      echo "Upper Case"
    else
      echo "Mixed"
    fi
    ;;
  *[[:lower:]]* )
    if [[ "$chara" =~ ^[[:lower:]]+$ ]]; then
      echo "Lower Case"
    else
      echo "Mixed"
    fi
    ;;
  *[[:digit:]]* )
    if [[ "$chara" =~ ^[[:digit:]]+$ ]]; then
      echo "Number"
    else
      echo "Mixed"
    fi
    ;;
esac
