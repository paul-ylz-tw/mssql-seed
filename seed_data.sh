#!/bin/bash
# Setup script to create the DB and the schema in the DB
# do this in a loop because the timing for when the SQL instance is ready is indeterminate
for i in {1..50};
do
  echo "trying to health check db $i"
  # wait for health check to pass
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -Q "SELECT 1" -j
  if [ $? -eq 0 ]
  then
    for filename in /docker-entrypoint-initdb.d/*.sql; do
      echo
      echo "RUNNING $filename"
      echo
      /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -i "$filename" -b -m-1
    done
    echo
    echo
    echo "INIT SCRIPTS COMPLETED"
    echo
    echo
    break
  else
    echo "not ready yet..."
    sleep 1
  fi
done

