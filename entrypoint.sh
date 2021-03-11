#start SQL Server, start the script to create the DB and import the data, start the app
#!/bin/bash
/opt/mssql/bin/sqlservr & /bin/bash /seed_data.sh & tail -f /dev/null
