#!/bin/bash

################################################################################################
# user-create

function user-create-dev() {

    echo -e "${GREEN}Please enter the details for the new user:\n"
    read -p "SQL Server: " sqlserver
    read -p "Database: " database
    read -p "Username: (MMU ID) " username

    Sqlcmd -S $sqlserver.database.windows.net -d $database -Q "CREATE USER [$username@ad.mmu.ac.uk] FROM EXTERNAL PROVIDER WITH DEFAULT_SCHEMA = dbo;ALTER ROLE db_datareader ADD MEMBER [$username@ad.mmu.ac.uk];"            
    
}

################################################################################################
# HELP-FUNCTIONS
################################################################################################



"$@"
