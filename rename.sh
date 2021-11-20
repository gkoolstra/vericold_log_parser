for f in *; do mv "$f" `echo $f | tr ' ' '_'`
done
exit 0
