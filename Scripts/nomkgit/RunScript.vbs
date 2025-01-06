Set objShell = CreateObject("WScript.Shell")
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")

' Kill any existing PowerShell process running this script
Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'powershell.exe'")
For Each objProcess in colProcesses
    If InStr(objProcess.CommandLine, "Notepad_MKDocs_Push_to_Github.ps1") > 0 Then
        objProcess.Terminate()
    End If
Next

' Start the PowerShell script
objShell.Run "powershell -ExecutionPolicy Bypass -File ""C:\Users\eduard\Local\Project\blog\documentation\Scripts\nomkgit\Notepad_MKDocs_Push_to_Github.ps1""", 0, False
