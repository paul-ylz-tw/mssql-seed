
## Based on https://github.com/twright-msft/mssql-node-docker-demo-app

## Accept configuration variables
https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-configure-environment-variables?view=sql-server-2017

## Required envvars

- MSSQL_SA_PASSWORD

## Usage
Put seed .sql files in ./myseedfiles, then mount as volume to docker-entrypoint-initdb.d


```
   docker build . -t local/mssql-seed
   docker run -e MSSQL_SA_PASSWORD=P@ssW0Rd -v "$PWD/myseedfiles:/docker-entrypoint-initdb.d" --name mymssql --rm local/mssql-seed
```
