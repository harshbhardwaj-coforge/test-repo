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
    $cloneApiID,

    [Parameter(Mandatory = $true)]
    [string]
    $apiPath,

    [Parameter(Mandatory = $true)]
    [string]
    $cloneApiPath,

    [Parameter(Mandatory = $true)]
    [string]
    $specificationPath,

    [Parameter(Mandatory = $true)]
    [string]
    $cloneSpecificationPath,

    [Parameter(Mandatory = $false)]
    [string]
    $apimsubscriptionid,

    [Parameter(Mandatory = $false)]
    [string]
    $specificationFormat = "OpenApi"
)

Write-Host "Updating apim endpoint..."
Write-Host "Service URL: $env:SERVICE_URL"

# Select-AzSubscription -SubscriptionId $apimsubscriptionid

$apiMgmtContext = New-AzApiManagementContext `
    -ResourceGroupName $resourceGroupName `
    -ServiceName $serviceName

Write-Host "Api: $apiId"
Import-AzApiManagementApi `
    -Context $apiMgmtContext `
    -ApiId $apiId `
    -SpecificationFormat $specificationFormat `
    -SpecificationPath $specificationPath `
    -Path $apiPath  `
    -ServiceUrl $env:SERVICE_URL

Write-Host "Api: $cloneApiId"
Import-AzApiManagementApi `
    -Context $apiMgmtContext `
    -ApiId $cloneApiId `
    -SpecificationFormat $specificationFormat `
    -SpecificationPath $cloneSpecificationPath `
    -Path $cloneApiPath `
    -ServiceUrl $env:SERVICE_URL

# $apiIds = @()
# $apiIds = @($apiId,$cloneApiID)

# $apiPaths = @()
# $apiPaths = @($apiPath,$cloneApiPath)

# for ($i=0; $i -lt $apiIds.Count; $i++)
# {
#     Write-Host "Api:" $data[$i]
#     Import-AzApiManagementApi `
#         -Context $apiMgmtContext `
#         -ApiId $apiIds[$i] `
#         -SpecificationFormat $specificationFormat `
#         -SpecificationPath $specificationPath `
#         -Path $apiPaths[$i] `
#         -ServiceUrl $env:SERVICE_URL 
# }
