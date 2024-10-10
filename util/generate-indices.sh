#!/bin/bash
# Default
DIR='../html/articles'
declare -A FILEARRAY
# Get list of files
FILEPATHS=$(find $DIR -name '*.htm*' -type f)

# gen key-pair of date, title, and path
for FILE in $FILEPATHS; do 
	FILEARRAY[$(date -r $FILE '+%Y%m%d')]=$FILE
done

# Sort by date
IFS=$'\n' sorted=($(sort <<<"${FILEARRAY[*]}"))
unset IFS

# Echo
echo "generated $(date '+%Y%m%d')<br><br>" > ../html/articles.html
for TSKEY in ${!FILEARRAY[@]}; do
		FILEPATH=${FILEARRAY[${TSKEY}]}
		TITLE=$(basename $FILEPATH | cut -d. -f1)
		LINKSTR="<button class='blue' onclick=loadMain('$FILEPATH')>[$TSKEY][$TITLE]</button><br><br>"
	echo $LINKSTR >> ../html/articles.html
done
