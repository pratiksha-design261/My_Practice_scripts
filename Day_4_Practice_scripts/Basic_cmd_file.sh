#!/bin/bash

echo "P: Hellow"

echo "D: Hi! Good Morning"

echo "P: What a great day to start with, what is the date today?"

echo "D: Hey! Really its very great day , Today is $(date)"

echo "P: Do you remeber we were working on that system can you please pass me some HW info"

echo -e "D: Sure, \n\n\nDisk:\n\n$(df -h)  \n\n\nRam: \n\n$(free -h)"

echo -e "P: These data is very detailed, can you just send me specifit values"

echo -e "D: Okay,sure!\n\tDisk: $(df -h | awk 'NR==2{print $2}') \n\tRam:$(free -h | awk 'NR==2{print $2}')"

echo -e "P: Do you know the who won the employee of The Month?"

Emp="Pinku"

echo "D: Yes , i moning, was going through learder board , was so happy to see name of $Emp"

echo -e "P: oh so happy for him, finally got the recognisation, for his haed work.\n\tI also heard they have publish list of top 3 Performer"

echo -e "yes.its been published earliyer today!\n\tFirst ranker is $1\n\tSecond ranker is $2\n\tThird ranker is $3"

read -p "I heard you also nominated for best Manger of the year: " $Emp

echo "$Emp deserve this nomination"

#If Loop
if [ $1 == "A" ]; then
        echo "D: '$1 is got highest Vote'"
elif [ $2 == "B" ]; then
        echo "D: '$2 is got highest Vote'"
else
        echo "D: '$3 is got highest Vote'"
fi
