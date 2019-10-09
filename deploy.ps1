#Log into Azure
Add-AzAccount

#Select the correct subscription
Get-AzSubscription -SubscriptionName "PS" | Select-AzSubscription

$ResourceGroupName = "tf-test2"
$Location = "eastus"

$TemplateParameters = @{
    adminUsername = "tfadmin"
    adminPasswordOrKey = 'n6Uz^)N.d!j+uE'
}

$DeploymentParameters = @{
    Name = "tf-deploy"
    ResourceGroupName = $ResourceGroupName
    TemplateFile = ".\azuredeploy.json"
    TemplateParameterObject = $TemplateParameters
    Mode = "Incremental"
}

#Create the resource group for the VM
New-AzResourceGroup -Name $ResourceGroupName -Location $Location

#Deploy the #Windows VM template
New-AzResourceGroupDeployment @DeploymentParameters