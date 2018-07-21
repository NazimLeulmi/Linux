#!/bin/bash
# This script will calculate a user's age based on the birth year
 

echo Enter your birth year to calculate your age ...
read year

age=$((`date +%Y` - $year ))
echo Your age is ${age}

