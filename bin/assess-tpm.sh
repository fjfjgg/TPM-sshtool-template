#!/bin/sh
#Ready test. If return 0, it means OK, else it means KO
if [ "$#" -eq 1 -a "$1" = "test" ]; then
  exit 0
fi

cd /tmp
#Arguments: file_path user_id original_file_name counter is_instructor
printf "<div style='text-align:left;'>\n"

if [ "$#" -ge 5 ]; then
  file_path=$1
  user_id=$2
  file_name=$3
  counter=$4
  is_instructor=$5     #"true" or "false"
  shift 5
fi
#debug
fres=$(mktemp)
#assess (THIS IS ONLY AN EXAMPLE, CHANGE THE ASSESS COMMAND)
echo "<p> File: $file_name <br /> User: $user_id <br /> Number: $counter <br /> Instructor: $is_instructor "
echo "<br /> Size :" `stat -c %s $file_path` " bytes <br /> sha256sum: "
timeout -k 1s 30s sha256sum "$file_path" > $fres
res=$?
cat $fres | cut -f1 -d ' '
echo "</p>"
if [ $res -eq 137 ]; then
    printf "<h3 style='color: red; border: 2px solid red; text-align: center;'>ERROR: The execution has exceeded the maximum allowed time or available memory.</h3>\n"
fi
printf "<pre>\n RETURN VALUE= $res </pre>\n"
rm $fres
rm -f "$f"
printf "</div>"
if [ $res -eq 0 ]; then
    res=100   # Calification 100 = 10.0
fi
exit $res

