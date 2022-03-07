#!/bin/bash


# Validate the arguments

if [ "$#" -lt 5 ];
then
        echo "S2Backup: You need to specify the required parameters."
        echo "S2Backup: $0 <s3 dir> <s3 bucket> <mysql user> <mysql pass> <mysql_db>"
        exit
fi


for cmd in mysql s3cmd
do
        if ! [ -x "$(command -v $cmd)" ];
        then
                echo "Error: $cmd is not installed." >&2
                exit
        fi
done

# Backup the database to s2

S3_DIR=$1
S3_BUCKET=$2
MYSQL_USER=$3
MYSQL_PASS=$4
MYSQL_DB=$5
MYSQL_HOST=${6:-localhost}
DELETE_OLDER_THAN="30d"

TIME_NOW=$EPOCHSECONDS
DB_FILE="$MYSQL_DB-$TIME_NOW.sql"
DB_PATH="/tmp/$DB_FILE"

mysqldump -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASS $MYSQL_DB > $DB_PATH

s3cmd put $DB_PATH s3://$S3_BUCKET/$S3_DIR/$DB_FILE

rm $DB_PATH


# Clean up (Delete files older than N days)

s3cmd ls s3://$S3_BUCKET/$S3_DIR | grep " DIR " -v | while read -r line;
do
  createDate=`echo $line|awk {'print $1" "$2'}`
  createDate=`date -j -f "%Y-%m-%d %H:%M" "$createDate" +%s`
  olderThan=`date -j -v-$DELETE_OLDER_THAN +%s`
  if [[ $createDate -lt $olderThan ]]
    then
      fileName=`echo $line|awk {'print $4'}`
      if [[ $fileName != "" ]]
        then
          printf 'Deleting "%s"\n' $fileName
          s3cmd del "$fileName"
      fi
  fi
done;

