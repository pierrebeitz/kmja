changedLines=0
commits=0
for COMMIT in $(git log --format=format:%H); do
  commits=`expr $commits + 1`
  changedLines=`expr \`git whatchanged --format=oneline $COMMIT -1 | wc -l\` - 1 + $changedLines`
done
echo "$changedLines/$commits" | bc -l
