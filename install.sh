#!/usr/bin/env bash

# Save chosen password to file. This is so we can read it
# when creating the container, and when connecting to the
# container.
read -sp "Choose a password: " passvar
echo $passvar > pass.txt

echo "Creating MS SQL Install."
docker run --cap-add SYS_PTRACE -e 'ACCEPT_EULA=1' -e 'MSSQL_SA_PASSWORD=$(cat pass.txt)' -p 1433:1433 --name mssql -d mcr.microsoft.com/azure-sql-edge
echo "Created and Started MS SQL Server with Password: '$(cat pass.txt)'."
