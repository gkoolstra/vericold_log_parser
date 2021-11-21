names_with_spaces=`ls ./*.vcl`
for f in $names_with_spaces; do mv "$f" `echo $f | tr ' ' '_'`
done
exit 0
