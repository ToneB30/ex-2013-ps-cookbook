#example 1:

foreach($i in Get-DistributionGroup -ResultSize Unlimited) {
  Get-DistributionGroupMember $i -ResultSize Unlimited | 
    Select-Object @{n="Member";e={$_.Name}},
      RecipientType,
      @{n="Group";e={$i.Name}}
}


#example 2:

$report=foreach($i in Get-DistributionGroup -ResultSize Unlimited) {
  Get-DistributionGroupMember $i -ResultSize Unlimited | 
    Select-Object @{n="Member";e={$_.Name}},
      RecipientType,
      @{n="Group";e={$i.Name}}
}

$report | Export-CSV c:\GroupMembers.csv -NoType
