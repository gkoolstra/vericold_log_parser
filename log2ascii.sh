#!/bin/sh

# log2ascii: Convert Vericold log files to a human readable format.
# This is useful for importing data into Matlab/Octave or a spreadsheet.
echo "starting conversion"
yourfilenames=`ls ./*.vcl`
for file in $yourfilenames
  do
  echo $file
  # Work out the output filename.
  newfile=${file%.*}.csv
  # Work out number of columns.
  echo $newfile
  columns=$((`hexdump -s 12288 -n 8 -e '"%g"' ${file}` / 8))
  # Create output file and place column headers.
  head -c 12288 ${file} | strings | tail -n $columns | tr '\n' ',' | sed 's/,$//' > $newfile
  # Decode binary data and place in output file.
  echo $columns/8 \"%g,\"'\n'\"'\\n'\" > format.temp
  hexdump -s 12288 -v -f format.temp ${file} | sed 's/, $//' >> $newfile
  rm format.temp
  echo "created $newfile"
done
exit 0
