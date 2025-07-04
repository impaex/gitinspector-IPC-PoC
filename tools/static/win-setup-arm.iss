; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "GitinspectorGUIOld"
#define MyAppVersion "0.4.5"
#define MyAppURL "https://gitinspectorgui.readthedocs.io/"
#define MyAppExeName "gitinspectorgui-old.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{CF68B05F-9FAD-42D4-8DEE-4112F404DD01}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
; "ArchitecturesAllowed=arm64" specifies that Setup cannot run
; on anything but ARM64.
ArchitecturesAllowed=arm64
; "ArchitecturesInstallIn64BitMode=arm64" requests that the
; install be done in "64-bit mode" on ARM64,
; meaning it should use the native ARM64 Program Files directory and
; the ARM64 view of the registry.
ArchitecturesInstallIn64BitMode=arm64
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
DisableDirPage=no
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
SetupIconFile=icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "..\..\app\bundle\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\..\minigit\*"; DestDir: "{localappdata}\minigit"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

[UninstallDelete]
Type: dirifempty; Name: "{app}"

[Run]
; Add the minigit\cmd folder to the Windows PATH environment variable for the user only
; using PowerShell.
; Use / instead of \\ in path, because in Win11-Arms \\ end up as \ in path, but in
; Win10-Intel, \\ end up as \\ in path.
Filename: "powershell"; Parameters: "-Command [Environment]::SetEnvironmentVariable('PATH', [Environment]::GetEnvironmentVariable('PATH', 'User') + ';{localappdata}/minigit/cmd', 'User')"; Flags: runhidden
