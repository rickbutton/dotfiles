#!/bin/bash

vol=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2/10 }}' | head -n 1)

if [[ "$vol" == "MM" ]]; then
  vol="XX"
else
  vol="$(echo "scale=2; $vol * 10" | bc)"
  vol=${vol%.*}
fi


echo Vol: $vol

exit 0
