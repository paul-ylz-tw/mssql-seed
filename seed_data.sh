#!/bin/bash
# Setup script to create the DB and the schema in the DB
# do this in a loop because the timing for when the SQL instance is ready is indeterminate
for i in {1..50};
do
  # wait for healthcheck to pass
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -Q "SELECT 1"
  if [ $? -eq 0 ]
  then
    for filename in /docker-entrypoint-initdb.d/*.sql; do
      echo "XXXXXX RUNNING $filename XXXXXXXXXX"
      /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -i $filename
    done
    echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX INIT SCRIPTS COMPLETED XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    break
  else
    echo "not ready yet..."
    sleep 1
  fi
done

