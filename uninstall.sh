#!/usr/bin/env bash

echo "Uninstalling MS SQL."
docker stop mssql
docker rm mssql
docker image rm mcr.microsoft.com/mssql/server:2019-latest
rm pass.txt
echo "Uninsalled MS SQL."

