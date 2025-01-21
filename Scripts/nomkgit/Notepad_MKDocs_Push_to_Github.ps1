<#
Author: Eduard Anderegg
Date: January 3, 2025
Description:
    This script monitors a directory for changes to Markdown (.md) files. It synchronizes the files with a destination directory, updates an mkdocs.yml file for a documentation site, and manages Git operations, including pulling updates to avoid conflicts, committing, tagging, and pushing changes.
#>

# Paths
$SourcePath = "C:\Users\eduard\OneDrive\Dokumente\docs"  # Directory with source .md files
$GitRepoPath = "C:\Users\eduard\Local\Project\blog\documentation"  # Git repository path
$MkDocsYmlPath = Join-Path $GitRepoPath "latest\mkdocs.yml"
$DestinationPath = Join-Path $GitRepoPath "latest\docs"  # Subdirectory in the repo where .md files go
$ErrorLogPath = "C:\Users\eduard\Local\Project\blog\documentation\Scripts\nomkgit\error.log"

# Function to send notifications
function Show-Notification {
    param (
        [string]$Title,
        [string]$Message
    )
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
    $Template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02)
    $TextNodes = $Template.GetElementsByTagName("text")
    $TextNodes.Item(0).AppendChild($Template.CreateTextNode($Title)) | Out-Null
    $TextNodes.Item(1).AppendChild($Template.CreateTextNode($Message)) | Out-Null
    $Toast = [Windows.UI.Notifications.ToastNotification]::new($Template)
    $Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("SyncScript")
    $Notifier.Show($Toast)
}

# Function to log errors
function Write-ErrorLog {
    param (
        [string]$ErrorMessage
    )
    Add-Content -Path $ErrorLogPath -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $ErrorMessage"
}

# Function to check if Notepad is running
function IsNotepadRunning {
    Get-Process | Where-Object { $_.ProcessName -eq "notepad" } | ForEach-Object { return $true }
    return $false
}

# Function to synchronize folders
function Sync-Folders {
    param (
        [string]$SourcePath,
        [string]$DestinationPath
    )
    try {
        Write-Host "Synchronizing folders..."
        Show-Notification -Title "Synchronization" -Message "Sync in progress..."

        # Ensure destination directory exists
        if (-Not (Test-Path $DestinationPath)) {
            New-Item -ItemType Directory -Path $DestinationPath | Out-Null
        }

        # Copy new or updated files from source to destination
        Get-ChildItem -Path $SourcePath -Recurse | ForEach-Object {
            $RelativePath = $_.FullName.Substring($SourcePath.Length + 1)
            $DestinationFile = Join-Path $DestinationPath $RelativePath

            if (-Not (Test-Path $DestinationFile) -or $_.LastWriteTime -gt (Get-Item $DestinationFile).LastWriteTime) {
                Write-Host "Copying: $($_.FullName) to $DestinationFile"

                $DestinationDir = Split-Path -Path $DestinationFile -Parent
                if (-Not (Test-Path $DestinationDir)) {
                    New-Item -ItemType Directory -Path $DestinationDir -Force
                }

                Copy-Item -Path $_.FullName -Destination $DestinationFile -Force
            }
        }

        # Remove files and folders in destination that do not exist in source
        Get-ChildItem -Path $DestinationPath -Recurse | ForEach-Object {
            $RelativePath = $_.FullName.Substring($DestinationPath.Length + 1)
            $SourceFile = Join-Path $SourcePath $RelativePath

            if (-Not (Test-Path $SourceFile)) {
                Write-Host "Removing: $($_.FullName)"
                Remove-Item -Path $_.FullName -Recurse -Force
            }
        }

        Write-Host "Synchronization complete."
        Show-Notification -Title "Synchronization" -Message "Sync completed successfully!"
    } catch {
        Write-Host "Error during synchronization: $_" -ForegroundColor Red
        Show-Notification -Title "Error" -Message "Synchronization failed. Check error.log."
        Write-ErrorLog "Synchronization Error: $_"
    }
}

# Function to update mkdocs.yml
function Update-MkDocsYml {
    param (
        [string]$MkDocsYmlPath,
        [string]$SourcePath
    )
    try {
        Write-Host "Updating mkdocs.yml..."

        # Prepare the nav structure
        $NavStructure = @{}

        # Process all .md files recursively
        Get-ChildItem -Path $SourcePath -Filter "*.md" -Recurse | ForEach-Object {
            $RelativePath = $_.FullName.Substring($SourcePath.Length + 1) -replace "\\", "/"
            $Parts = $RelativePath -split "/"

            $MainNav = if ($Parts.Count -gt 1) { $Parts[0] } else { "Home" }
            $ChildNav = if ($Parts.Count -gt 1) { [IO.Path]::GetFileNameWithoutExtension($Parts[1]) } else { [IO.Path]::GetFileNameWithoutExtension($Parts[0]) }
            $RelativeFilePath = "./$RelativePath"

            if (-not $NavStructure.ContainsKey($MainNav)) {
                $NavStructure[$MainNav] = @()
            }

            $NavStructure[$MainNav] += @{
                Name = $ChildNav
                Path = $RelativeFilePath
            }
        }

        # Read the existing mkdocs.yml
        $YamlContent = Get-Content $MkDocsYmlPath -Raw

        # Build the new nav section
        $NewNav = "nav:"

        # Add Home first if it exists
        if ($NavStructure.ContainsKey("Home")) {
            $NewNav += "`n  - Home:"
            foreach ($Item in $NavStructure["Home"]) {
                $NewNav += "`n      - $($Item.Name): $($Item.Path)"
            }
            $NavStructure.Remove("Home")
        }

        # Add the remaining sections
        foreach ($MainNav in $NavStructure.Keys) {
            $NewNav += "`n  - ${MainNav}:"
            foreach ($Item in $NavStructure[$MainNav]) {
                $NewNav += "`n      - $($Item.Name): $($Item.Path)"
            }
        }

        # Replace or insert the nav section
        if ($YamlContent -match "(?s)nav:.*?copyright:") {
            $YamlContent = $YamlContent -replace "(?s)(nav:.*?)(?=copyright:)", "$NewNav`n"
        } else {
            $YamlContent = $YamlContent -replace "(?=copyright:)", "$NewNav`n"
        }

        # Write the updated mkdocs.yml
        Set-Content -Path $MkDocsYmlPath -Value $YamlContent
        Write-Host "Updated mkdocs.yml successfully."
    } catch {
        Write-Host "Error updating mkdocs.yml: $_" -ForegroundColor Red
        Show-Notification -Title "Error" -Message "Failed to update mkdocs.yml. Check error.log."
        Write-ErrorLog "MkDocs Update Error: $_"
    }
}

# Function to execute Git commands
# Function to execute Git commands
function Start-GitCommands {
    param (
        [string]$GitRepoPath,
        [string]$CommitMessage
    )
    try {
        Write-Host "Switching to Git repository: $GitRepoPath"
        Set-Location $GitRepoPath

        Write-Host "Stashing local changes (if any)..."
        git stash push -m "Auto-stash: $(Get-Date -Format yyyyMMdd-HHmm)" 2>&1 | Write-Host

        Write-Host "Pulling latest changes..."
        git pull --rebase 2>&1 | Write-Host

        Write-Host "Applying stashed changes (if any)..."
        git stash pop 2>&1 | Write-Host

        Write-Host "Adding changes to Git..."
        git add . 2>&1 | Write-Host

        Write-Host "Committing changes..."
        git commit -m $CommitMessage 2>&1 | Write-Host

        Write-Host "Checking for existing tag..."
        $TagName = "release/$(Get-Date -Format yyyyMMdd-HHmm)"
        if (git tag | Select-String -Pattern $TagName) {
            Write-Host "Tag $TagName already exists. Skipping tag creation."
        } else {
            Write-Host "Creating release tag..."
            git tag -a $TagName -m "Auto-generated release tag" 2>&1 | Write-Host
        }

        Write-Host "Pushing changes to repository..."
        git push 2>&1 | Write-Host
        git push origin --tags 2>&1 | Write-Host

        Write-Host "Changes committed and pushed with tag: $TagName"
        Show-Notification -Title "Git Sync" -Message "Changes committed and pushed successfully!"
    } catch {
        Write-Host "Error during Git operations: $_" -ForegroundColor Red
        Show-Notification -Title "Git Error" -Message "Git operations failed. Check error.log."
        Write-ErrorLog "Git Error: $_"
    }
}

# Main monitoring logic
if (IsNotepadRunning) {
    try {
        Show-Notification -Title "Sync Script" -Message "Script started and monitoring for changes."

        # Initialize FileSystemWatcher
        $Watcher = New-Object System.IO.FileSystemWatcher
        $Watcher.Path = $SourcePath
        $Watcher.Filter = "*.md"
        $Watcher.IncludeSubdirectories = $true
        $Watcher.NotifyFilter = [IO.NotifyFilters]::FileName, [IO.NotifyFilters]::LastWrite
        $Watcher.EnableRaisingEvents = $true

        # Register the event
        Register-ObjectEvent $Watcher "Changed" -Action {
            $ChangedFile = $Event.SourceEventArgs.FullPath
            $FileName = $Event.SourceEventArgs.Name
            Write-Host "File changed: $ChangedFile"

            # Synchronize folders
            Sync-Folders -SourcePath $SourcePath -DestinationPath $DestinationPath

            # Update mkdocs.yml
            Update-MkDocsYml -MkDocsYmlPath $MkDocsYmlPath -SourcePath $SourcePath

            # Commit and push to GitHub
            $CommitMessage = "Auto-commit: Updated $FileName"
            Start-GitCommands -GitRepoPath $GitRepoPath -CommitMessage $CommitMessage
        }

        Write-Host "Monitoring $SourcePath for changes to .md files. Press Ctrl+C to stop."
        while ($true) {
            if (-not (IsNotepadRunning)) {
                Write-Host "Notepad is no longer running. Exiting script."
                Show-Notification -Title "Script Stopped" -Message "Notepad has closed. Exiting script."
                break  # Exit the loop
            }
            Start-Sleep -Seconds 1
        }
    } catch {
        Write-Host "Error in script: $_" -ForegroundColor Red
        Show-Notification -Title "Error" -Message "Script encountered an error. Check error.log."
        Write-ErrorLog "Script Error: $_"
    }
} else {
    Show-Notification -Title "Script Stopped" -Message "Notepad is not running. Exiting script."
    Write-Host "Notepad is not running. Exiting script."
}
