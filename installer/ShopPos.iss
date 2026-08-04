#define MyAppName "Hina Enterprises POS"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Bijay Yadav"
#define MyAppExeName "shop_app.exe"

[Setup]
AppId={{A5A5B2C4-93F2-4F80-B7B1-4C20FBB7D101}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}

AppCopyright=© 2026 Bijay Yadav
VersionInfoCompany=Bijay Yadav
VersionInfoDescription=Point of Sale Software for Hina Enterprises
VersionInfoProductName={#MyAppName}
VersionInfoCopyright=© 2026 Bijay Yadav

DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}

OutputDir=Output
OutputBaseFilename=HinaPOS_Setup_v1.0.0

Compression=lzma2
SolidCompression=yes

WizardStyle=modern
PrivilegesRequired=admin

ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

SetupIconFile=shop.ico
UninstallDisplayIcon={app}\{#MyAppExeName}

DisableProgramGroupPage=yes

UsePreviousAppDir=yes
UsePreviousLanguage=yes
UsePreviousTasks=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create Desktop Shortcut"; GroupDescription: "Additional Icons:"; Flags: checkedonce

[Files]
Source: "..\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "vc_redist.x64.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"

[Run]
Filename: "{tmp}\vc_redist.x64.exe"; Parameters: "/install /quiet /norestart"; Flags: waituntilterminated skipifdoesntexist
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}"