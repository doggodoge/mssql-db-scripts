#!/usr/bin/env bash

# Save chosen password to file. This is so we can read it
# when creating the container, and when connecting to the
# container.
read -sp "Choose a password: " passvar
echo $passvar > pass.txt

echo "Creating MS SQL Install."
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$(cat pass.txt)" -e "MSSQL_PID=Express" -p 1433:1433 --name mssql -d mcr.microsoft.com/mssql/server:2017-latest-ubuntu
echo "Created and Started MS SQL Server with Password: '$(cat pass.txt)'."
