FROM mcr.microsoft.com/mssql/server:2019-CU9-ubuntu-16.04
ENV ACCEPT_EULA=Y
COPY . .
USER mssql
ENTRYPOINT /bin/bash ./entrypoint.sh
