#!/bin/bash

az account list -otable --query '[].{subscriptionId: id, name: name, isDefault: isDefault, tenantId: tenantId, state: state, cloudName: cloudName}'
