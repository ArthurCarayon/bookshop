echo "Commit motif?"
read motif
if [ $motif ]; 
then
    MSG=$motif
else
    MSG="fix"
fi
git add . ; git commit -m $MSG ; git push origin main 
echo "Done 👌"