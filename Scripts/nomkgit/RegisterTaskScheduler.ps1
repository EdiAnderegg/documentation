# Define the base installation directory dynamically
$installDir = "C:\Users\eduard\Local\Project\blog\documentation\"
$scriptPath = Join-Path $installDir "Scripts\nomkgit\RunScript.vbs"
$notepadPath = "C:\Program Files\WindowsApps\Microsoft.WindowsNotepad_11.2410.21.0_x64__8wekyb3d8bbwe\Notepad\Notepad.exe"

# Enable Audit Process Creation and Termination
auditpol /set /subcategory:"Process Creation" /success:enable
auditpol /set /subcategory:"Process Termination" /success:enable

# Save the XML query for triggering on Notepad start
$triggerOnNotepadXml = @"
<Task version="1.4" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
  <Triggers>
    <EventTrigger>
      <Enabled>true</Enabled>
      <Subscription>&lt;QueryList&gt;
        &lt;Query Id="0" Path="Security"&gt;
          &lt;Select Path="Security"&gt;
            *[System[Provider[@Name='Microsoft-Windows-Security-Auditing'] and (EventID=4688)]]
            and
            *[EventData[Data[@Name='NewProcessName'] and (Data='$notepadPath')]]
          &lt;/Select&gt;
        &lt;/Query&gt;
      &lt;/QueryList&gt;</Subscription>
    </EventTrigger>
  </Triggers>
  <Actions Context="Author">
    <Exec>
      <Command>wscript.exe</Command>
      <Arguments>"$scriptPath"</Arguments>
    </Exec>
  </Actions>
  <Settings>
    <StartWhenAvailable>true</StartWhenAvailable>
    <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>
    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>
    <RunOnlyIfNetworkAvailable>true</RunOnlyIfNetworkAvailable>
    <ExecutionTimeLimit>PT0S</ExecutionTimeLimit>
  </Settings>
</Task>
"@
$triggerOnNotepadXmlPath = "$env:Temp\TriggerOnNotepad.xml"
$triggerOnNotepadXml | Set-Content -Path $triggerOnNotepadXmlPath

# Save the XML query for stopping the task when Notepad stops
$triggerOnStopXml = @"
<Task version="1.4" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
  <Triggers>
    <EventTrigger>
      <Enabled>true</Enabled>
      <Subscription>&lt;QueryList&gt;
        &lt;Query Id="0" Path="Security"&gt;
          &lt;Select Path="Security"&gt;
            *[System[Provider[@Name='Microsoft-Windows-Security-Auditing'] and (EventID=4689)]]
            and
            *[EventData[Data[@Name='ProcessName'] and (Data='$notepadPath')]]
          &lt;/Select&gt;
        &lt;/Query&gt;
      &lt;/QueryList&gt;</Subscription>
    </EventTrigger>
  </Triggers>
  <Actions Context="Author">
    <Exec>
      <Command>taskkill.exe</Command>
      <Arguments>/IM wscript.exe</Arguments>
    </Exec>
  </Actions>
  <Settings>
    <StartWhenAvailable>true</StartWhenAvailable>
    <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>
    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>
    <RunOnlyIfNetworkAvailable>true</RunOnlyIfNetworkAvailable>
    <ExecutionTimeLimit>PT0S</ExecutionTimeLimit>
  </Settings>
</Task>
"@
$triggerOnStopXmlPath = "$env:Temp\TriggerOnStop.xml"
$triggerOnStopXml | Set-Content -Path $triggerOnStopXmlPath

# Register task for starting when Notepad is opened
Register-ScheduledTask -TaskName "NotepadMKDocsStart" -Xml (Get-Content -Path $triggerOnNotepadXmlPath -Raw)

# Register task for stopping when Notepad is closed
Register-ScheduledTask -TaskName "NotepadMKDocsStop" -Xml (Get-Content -Path $triggerOnStopXmlPath -Raw)
