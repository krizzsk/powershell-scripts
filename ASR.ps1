# Set the rule identifiers and their corresponding values
$ruleSettings = @{
    "26190899-1602-49e8-8b27-eb1d0a1ce869" = 1
    "3b576869-a4ec-4529-8536-b80a7769e899" = 1
    "56a863a9-875e-4185-98a7-b882c64b5ce5" = 1
    "5beb7efe-fd9a-4556-801d-275e5ffc04cc" = 1
    "75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84" = 1
    "7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c" = 1
    "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b" = 1
    "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2" = 1
    "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4" = 1
    "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550" = 1
    "d3e037e1-3eb8-44c8-a917-57927947596d" = 1
    "d4f940ab-401b-4efc-aadc-ad5f3c50688a" = 1
    "e6db77e5-3df2-4cf1-b95a-636979351e5b" = 1
}

# Specify the path to the Group Policy Object
$GPOPath = "Computer Configuration\Policies\Administrative Templates\Windows Components\Microsoft Defender Antivirus\Microsoft Defender Exploit Guard\Attack Surface Reduction"

# Loop through each rule identifier and set the Group Policy setting
foreach ($ruleID in $ruleSettings.Keys) {
    # Set the value for each rule identifier
    Set-GPRegistryValue -Name $GPOPath -Key "HKLM\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules\$ruleID" -ValueName "Enabled" -Type DWORD -Value $ruleSettings[$ruleID]
}

Write-Host "Group Policy configuration completed successfully."
