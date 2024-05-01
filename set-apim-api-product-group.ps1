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
    $productId,

    [Parameter(Mandatory = $true)]
    [string]
    $cloneProductId
)

Write-Host "adding API ($apiId) to product: $productId"

$apiMgmtContext = New-AzApiManagementContext `
    -ResourceGroupName $resourceGroupName `
    -ServiceName $serviceName

Add-AzApiManagementApiToProduct `
    -Context $apiMgmtContext `
    -ApiId $apiId `
    -ProductId $productId

Write-Host "adding API ($cloneApiId) to product: $cloneProductId"

Add-AzApiManagementApiToProduct `
    -Context $apiMgmtContext `
    -ApiId $cloneApiId `
    -ProductId $cloneProductId

# $apiIds = @()
# $apiIds = @($apiId,$cloneApiID)

# $productIds = @()
# $productIds = @($productId, $cloneProductId)

# for ($i=0; $i -lt $apiIds.Count; $i++)
# {
#     Write-Host "adding API ($apiIds[$i]) to product: $productId"
#     Add-AzApiManagementApiToProduct `
#         -Context $apiMgmtContext `
#         -ApiId $apiIds[$i] `
#         -ProductId $productId
# }