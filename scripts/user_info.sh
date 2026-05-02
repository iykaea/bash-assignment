#!/bin/bash
mkdir -p ../logs
read -p "Enter Name: " NAME
read -p "Enter Age: " AGE
if [ "$AGE" -lt 18 ]; then 
	CATEGORY="Minor"
elif [ "$AGE" -ge 18 ] && [ "$AGE" -lt 65 ]; then
	CATEGORY="Adult"
else
	CATEGORY="senior"
fi
echo "User: $NAME | Age: $AGE | Status: $CATEGORY" >> ../logs/user_info.log
