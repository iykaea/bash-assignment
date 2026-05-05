#!/bin/bash
mkdir -p ../logs
read -p "Enter your Name: " NAME
read -p "Enter your Age: " AGE
read -p "Enter your Country: " COUNTRY
if [[ -z "$NAME" || -z "$AGE" || -z "$COUNTRY" ]]; then
	echo "Error: All fields (Name, Age, Country) are required!"
	exit 1
fi
if ! [[ "$AGE" =~ ^[0-9]+$ ]]; then
	echo "Error: Age must be a numeric value."
	exit 1
fi
if [ "$AGE" -lt 18 ]; then 
	CATEGORY="Minor"
elif [ "$AGE" -ge 18 ] && [ "$AGE" -le 65 ]; then
	CATEGORY="Adult"
else
	CATEGORY="senior"
fi
echo "---------------------------------------------"
echo GREETING="welcom, $NAME! we are so glad to have someone from $COUNTRY joining us today. based on your record , since you are $AGE, you are categorized as $CATEGORY. renain fruitful"
echo "---------------------------------------------------------------"
echo "$(date '+%Y-%m-%d %H:%M:%s') - $GREETING" >> "../logs/user_info.log"


