; Script for Notepad MKDocs Installer with Uninstall Logic

[Setup]
AppName=Notepad MKDocs Sync
AppVersion=1.0
DefaultDirName={pf}\NotepadMKDocs
DefaultGroupName=Notepad MKDocs
OutputBaseFilename=NotepadMKDocsInstaller
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; Include all necessary files
Source: "Scripts\nomkgit\*"; DestDir: "{app}\Scripts\nomkgit"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".github\workflows\*"; DestDir: "{app}\.github\workflows"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Uninstall"; Filename: "{uninstallexe}"
Name: "{group}\Notepad MKDocs Monitor"; Filename: "{app}\Scripts\nomkgit\RunScript.vbs"

[Tasks]
; Task Scheduler registration tasks
Name: "task_register"; Description: "Register Task Scheduler for Notepad MKDocs"; GroupDescription: "Additional Tasks"

[Run]
; Run the Task Scheduler registration script
Filename: "powershell.exe"; Parameters: "-ExecutionPolicy Bypass -File ""{app}\Scripts\nomkgit\RegisterTaskScheduler.ps1"""; Flags: runhidden

[UninstallRun]
; Run the Task Scheduler cleanup script during uninstallation
Filename: "powershell.exe"; Parameters: "-ExecutionPolicy Bypass -File ""{app}\Scripts\nomkgit\UnregisterTaskScheduler.ps1"""; Flags: runhidden

[Code]
var
  DocsDirEdit: TEdit;

procedure InitializeWizard();
var
  DocsPage: TWizardPage;
begin
  // Create a custom page for documentation directory
  DocsPage := CreateCustomPage(
    wpSelectDir, 
    'Documentation Directory', 
    'Please specify the location for the docs directory.'
  );

  // Add an input box (TEdit) to the page
  DocsDirEdit := TEdit.Create(WizardForm);
  DocsDirEdit.Parent := DocsPage.Surface;
  DocsDirEdit.Top := 40;
  DocsDirEdit.Width := WizardForm.ClientWidth - 60;
  DocsDirEdit.Left := 20;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  DocsDir: String;
  ResultCode: Integer;
begin
  if CurStep = ssInstall then
  begin
    // Clean up any previous installation remnants before installing
    if Exec('powershell.exe', '-ExecutionPolicy Bypass -File ""{app}\Scripts\nomkgit\UnregisterTaskScheduler.ps1""', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
    begin
      MsgBox('Previous installation remnants cleaned up successfully.', mbInformation, MB_OK);
    end
    else
    begin
      MsgBox('Failed to clean up previous installation remnants. Continuing installation.', mbError, MB_OK);
    end;
  end;

  if CurStep = ssPostInstall then
  begin
    // Retrieve the user-specified Docs Directory
    DocsDir := DocsDirEdit.Text;
    if DocsDir = '' then
    begin
      MsgBox('You must specify a docs directory for the program to function.', mbError, MB_OK);
      Abort();
    end;

    // Save the Docs Directory path to a file
    SaveStringToFile(ExpandConstant('{app}\Scripts\nomkgit\docsdir.txt'), DocsDir, True);

    // Ask for GitHub Login
    MsgBox('Please enter your GitHub credentials for the program to function.', mbInformation, MB_OK);
    if Exec('powershell.exe', '-ExecutionPolicy Bypass -File ""{app}\Scripts\nomkgit\SetGitHubCredentials.ps1""', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
    begin
      MsgBox('GitHub credentials saved successfully.', mbInformation, MB_OK);
    end
    else
    begin
      MsgBox('Error saving GitHub credentials. Please try again.', mbError, MB_OK);
    end;
  end;
end;
