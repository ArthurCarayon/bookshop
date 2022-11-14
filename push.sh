IFS= read -r -p $"Commit motif? `echo $'\n> '`" input
echo "$input"
if [ -z "$input" ]; 
then
    MSG="$input"
else
    MSG="fix"
fi
git add . ; git commit -m $MSG ; git push origin main 
echo "Done 👌"