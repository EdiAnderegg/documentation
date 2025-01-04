# Enable Audit Process Creation/Termination
auditpol /set /subcategory:"Process Creation" /success:enable
auditpol /set /subcategory:"Process Termination" /success:enable

# Register Task Scheduler tasks
$actionStart = New-ScheduledTaskAction -Execute "wscript.exe" -Argument "{app}\Scripts\nomkgit\RunScript.vbs"
$triggerStart = New-ScheduledTaskTrigger -EventTriggerId 4688 -EventLevel 0
$taskStart = New-ScheduledTask -Action $actionStart -Trigger $triggerStart
Register-ScheduledTask -TaskName "NotepadMKDocsStart" -InputObject $taskStart

$actionStop = New-ScheduledTaskAction -Execute "taskkill.exe" -Argument "/IM wscript.exe"
$triggerStop = New-ScheduledTaskTrigger -EventTriggerId 4689 -EventLevel 0
$taskStop = New-ScheduledTask -Action $actionStop -Trigger $triggerStop
Register-ScheduledTask -TaskName "NotepadMKDocsStop" -InputObject $taskStop
