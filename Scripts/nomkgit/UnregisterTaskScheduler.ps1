# Unregister Task Scheduler tasks
try {
    Unregister-ScheduledTask -TaskName "NotepadMKDocsStart" -Confirm:$false
    Unregister-ScheduledTask -TaskName "NotepadMKDocsStop" -Confirm:$false
    Write-Host "Task Scheduler tasks unregistered successfully."
} catch {
    Write-Host "Failed to unregister Task Scheduler tasks: $_"
}

# Remove local security policy changes if needed
try {
    auditpol /set /subcategory:"Process Creation" /success:disable
    auditpol /set /subcategory:"Process Termination" /success:disable
    Write-Host "Security policies reverted successfully."
} catch {
    Write-Host "Failed to revert security policies: $_"
}
