#!/bin/bash

# Create org
sfdx force:org:create -f config/project-scratch-def.json -a FlowsADK --setdefaultusername -d 14

# Install packages
sfdx force:package:install --package 04t1U0000066Af4 -w 20
sfdx force:package:install --package 04t1U000005ZS27 -w 20  

# Push source
sfdx force:source:push -f

# Assign permission sets
sfdx force:user:permset:assign -n Credit_Line_Increase_Demo

# Execute additional steps
sfdx force:apex:execute -f config/create-demo-data-setup.apex

# Open org
sfdx force:org:open
