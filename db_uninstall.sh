#!/usr/bin/env bash

echo "Uninstalling MS SQL."
docker stop mssql
docker rm mssql
docker image rm mcr.microsoft.com/azure-sql-edge
rm pass.txt
echo "Uninsalled MS SQL."

