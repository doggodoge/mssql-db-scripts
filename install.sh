#!/usr/bin/env bash

# Save chosen password to file. This is so we can read it
# when creating the container, and when connecting to the
# container.
function createPassword() {
    read -rsp "Choose a password: " passvar
    echo "$passvar" > pass.txt
}

# Build the MS SQL container with bog standard defaults.
# Takes a password as a parameter.
function buildContainer() {
    docker run \
    -e "ACCEPT_EULA=Y" \
    -e "SA_PASSWORD=$1" -e \
    "MSSQL_PID=Express" \
    -p 1433:1433 \
    --name mssql \
    -d \
    mcr.microsoft.com/mssql/server:2017-latest-ubuntu \
    >/dev/null
}

echo "Creating MS SQL Install."
createPassword
buildContainer "$(cat pass.txt)"
echo "Created and Started MS SQL Server with Password: '$(cat pass.txt)'."
