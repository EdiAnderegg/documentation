$UserName = Read-Host "Enter GitHub Username"
$Token = Read-Host "Enter GitHub Personal Access Token" -AsSecureString
$Credential = New-Object PSCredential($UserName, $Token)
$Credential | Export-CliXml -Path "{app}\Scripts\nomkgit\github-credentials.xml"
