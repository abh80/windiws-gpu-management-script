# Whats happening?
param (
    [Parameter(Mandatory = $true)]
    [string]$Name # Taking the GPU Name, the name should start or equal to your gpu name for me its only 1 gpu NVIDIA GeForce GTX 1650 Ti
)

# For multiple gpus just do share common part of their starting like - NVIDIA GeForce GTX

$device = @(Get-PnpDevice | Where-Object { $_.Name -like "$name*" }) # selecting all devices which match this name (@ is added to convert it into an array)
if ($null -eq $device) {
    Write-Host "Device with name: $name not found!"
    exit 1
}

# FOr loop to disable the selected devices
$device | ForEach-Object {
    Disable-PnpDevice $_.DeviceID-Confirm:$false
    Write-Host "Disabled the Device: $($_.Name) !"
}