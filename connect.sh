#!/usr/bin/env bash

echo "Connecting to MS SQL."
docker exec -it mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $(cat pass.txt)
