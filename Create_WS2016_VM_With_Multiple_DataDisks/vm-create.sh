#!/bin/bash

RAND=$RANDOM
BASEName="tokawa$RAND"
RGName="$BASEName-rg"
LOCATION="japaneast"
VMName="${BASEName}vm"
VMSize="Standard_F8s_v2"
USERName="azureuser"
NumOfDisk=16
DiskSizeInGB=8

echo Creating Resource Group $RGName to $LOCATION
az group create --name $RGName --location $LOCATION

echo Creating VM $VMName to $LOCATION
az vm create --resource-group $RGName --name $VMName --image win2016datacenter --admin-username $USERName --size $VMSize

for ((i=0; i < $NumOfDisk; i++)); do
    DISKName="${BASEName}Disk${i}"
    echo Attaching DataDisk $DISKName to $VMName
    az vm disk attach --resource-group $RGName --vm-name $VMName --name $DISKName --size-gb $DiskSizeInGB --sku Premium_LRS --new
done
