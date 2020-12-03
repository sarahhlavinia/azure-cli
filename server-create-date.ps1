$sqlServers = az sql server list | ConvertFrom-Json
 foreach ($sqlServer in $sqlServers) {
     $databases = az sql db list --server $sqlServer.name --resource-group $sqlServer.resourceGroup | ConvertFrom-Json>>
     foreach ($database in $databases | Where-Object name -eq "master") {
         Write-Host "$($sqlServer.name)\$($database.name) -> $($database.creationDate)"
     }
 }