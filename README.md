# MSSQL image with directory for seed files
## Based on https://github.com/twright-msft/mssql-node-docker-demo-app

## Required envvars
- MSSQL_SA_PASSWORD

## Usage
Put seed .sql files in ./myseedfiles, then mount as volume to docker-entrypoint-initdb.d

```
   docker build . -t local/mssql-seed
   docker run -e MSSQL_SA_PASSWORD=P@ssW0Rd -v "$PWD/myseedfiles:/docker-entrypoint-initdb.d" --name mymssql --rm local/mssql-seed
```
