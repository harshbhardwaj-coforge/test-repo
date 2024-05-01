param(
    [Parameter(Mandatory = $true)]
    [string]
    $resourceGroupName,

    [Parameter(Mandatory = $true)]
    [string]
    $serviceName,

    [Parameter(Mandatory = $true)]
    [string]
    $apiId,

    [Parameter(Mandatory = $true)]
    [string]
    $cloneApiId,

    [Parameter(Mandatory = $true)]
    [string]
    $policyFilePath,

    [Parameter(Mandatory = $true)]
    [string]
    $clonePolicyFilePath
)

$apiMgmtContext = New-AzApiManagementContext `
    -ResourceGroupName $resourceGroupName `
    -ServiceName $serviceName

Write-Host "Update policy for operation: $operationId"

Write-Host "Updating API policy for API: $apiId"
Write-Host "Policy file path: $policyFilePath"

Set-AzApiManagementPolicy `
    -Context $apiMgmtContext `
    -ApiId $apiId `
    -PolicyFilePath $policyFilePath

Write-Host "Updating API policy for API: $cloneApiId"
Write-Host "Policy file path: $clonePolicyFilePath"

Set-AzApiManagementPolicy `
    -Context $apiMgmtContext `
    -ApiId $cloneApiId `
    -PolicyFilePath $clonePolicyFilePath

# $apiIds = @()
# $apiIds = @($apiId, $cloneApiID)

# $policyFilePaths = @()
# $policyFilePaths = @($policyFilePath, $clonePolicyFilePath)

# for ($i=0; $i -lt $apiIds.Count; $i++)
# {
#     Set-AzApiManagementPolicy `
#         -Context $apiMgmtContext `
#         -ApiId $apiIds[$i] `
#         -PolicyFilePath $policyFilePaths[$i]
# }