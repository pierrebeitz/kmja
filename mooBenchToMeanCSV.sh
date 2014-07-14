#!/bin/bash

# This is a little script convertion moobench's output to CSV.
# @param $1 input-file (preferably MooBench's result-text.txt)
# @param $2 output-file

# ignore the first line of MooBench's output as well as the throughput since it is way out of scale
tail -n +2 $1 |
head -n -1 |
# calculate mean values of every row, we need a subshell to wait for the complete output
(awk '{
  for (i=2; i<=NF; i++){total+=$i;}
  print $1" "total/(NF-1);
  total=0
}')|
# transpose the output and separate values by comma
awk '
{for (i=1; i<=NF; i++)  {a[NR,i] = $i } }
NF>p { p = NF }
END {
  for(j=1; j<=p; j++) {
    str=a[1,j]
    for(i=2; i<=NR; i++){str=str","a[i,j];}
    print str
  }
}' > $2
