###Adatum just hired a bunch of interns. In order to manage RBAC roles, management has directed to create a new OU 
## called interns and Assign them Inerns2022 group
new-adorganizationalUnit -Name "Interns" -Path "DC=adatum, dc=com"
new-adgroup -name "Interns 2022" -GroupScope Global