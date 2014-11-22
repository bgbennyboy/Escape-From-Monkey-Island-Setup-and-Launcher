;***************************************************************
;  Escape From Monkey Island Setup
;  2004-2014 By Bennyboy
;  Http://quickandeasysoftware.net
;***************************************************************
;
;  This Source Code Form is subject to the terms of the Mozilla Public
;  License, v. 2.0. If a copy of the MPL was not distributed with this
;  file, You can obtain one at http://mozilla.org/MPL/2.0/.

;TODO
;Add other languages

[Setup]
VersionInfoVersion=1.2
VersionInfoCompany=Quick And Easy Software
VersionInfoDescription=Replacement installer for Escape From Monkey Island
VersionInfoTextVersion=1.2
VersionInfoCopyright=Bennyboy 2014
AppCopyright=Bennyboy 2014
AppName=Escape From Monkey Island
AppVerName=Escape From Monkey Island
AppVersion=1.0
RestartIfNeededByRun=false
AllowRootDirectory=false
DefaultDirName={pf}\Lucasarts\Monkey4\
ShowLanguageDialog=auto
InternalCompressLevel=max
DefaultGroupName=Lucasarts\Monkey 4\
OutputBaseFilename=Monkey4Setup
AppPublisher=Quick and Easy Software
AppPublisherURL=http://quickandeasysoftware.net
AppSupportURL=http://quickandeasysoftware.net
AppUpdatesURL=http://quickandeasysoftware.net
AppComments=Contact me via my contact page
AppContact=http://quickandeasysoftware.net/contact
UninstallDisplayIcon={app}\EMI Launcher.exe
UninstallDisplayName=Escape From Monkey Island
DisableProgramGroupPage=false
AllowNoIcons=true
AlwaysUsePersonalGroup=false
PrivilegesRequired=admin
AppID={code:GetAppID|''}
WizardImageFile=Large_Wizard_Image.bmp
WizardSmallImageFile=Small_Wizard_Image.bmp
InfoBeforeFile=Before.rtf
UsePreviousLanguage=no
VersionInfoProductName=Escape From Monkey Island Setup
VersionInfoProductVersion=1.2
VersionInfoProductTextVersion=1.2

[Dirs]
Name: {app}\Install; Flags: uninsalwaysuninstall
Name: {app}\Movies; Flags: uninsalwaysuninstall
Name: {app}\Saves; Flags: uninsalwaysuninstall
Name: {app}\Textures; Flags: uninsalwaysuninstall
Name: {app}\Textures\mego; Flags: uninsalwaysuninstall
Name: {app}\Textures\spago; Flags: uninsalwaysuninstall
Name: {app}\Textures\mego\A; Flags: uninsalwaysuninstall
Name: {app}\Textures\mego\B; Flags: uninsalwaysuninstall
Name: {app}\Textures\mego\C; Flags: uninsalwaysuninstall
Name: {app}\Textures\mego\D; Flags: uninsalwaysuninstall
Name: {app}\Textures\mego\S; Flags: uninsalwaysuninstall
Name: {app}\Textures\spago\A; Flags: uninsalwaysuninstall
Name: {app}\Textures\spago\B; Flags: uninsalwaysuninstall
Name: {app}\Textures\spago\C; Flags: uninsalwaysuninstall
Name: {app}\Textures\spago\D; Flags: uninsalwaysuninstall
Name: {app}\Textures\spago\S; Flags: uninsalwaysuninstall

[Files]
; ALL ON CD 1
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\artAll.m4b"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\artLuc.m4b"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\artMel.m4b"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\lip.m4b"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\sfx.m4b"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\voiceAll.m4b"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\voiceLuc.m4b"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\voiceMel.m4b"; DestDir: "{app}"; Flags: external

Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\bank.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\dock.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\ela2.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\home1.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\intro_a.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\intro_b.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\melt.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\nose.m4b"; DestDir: "{app}\Movies"; Flags: external

Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\FullMonkeyMap.imt"; DestDir: "{app}\Textures"; Flags: external

Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\mego\A\*.*"; DestDir: "{app}\Textures\mego\A\"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\mego\B\*.*"; DestDir: "{app}\Textures\mego\B\"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\mego\S\*.*"; DestDir: "{app}\Textures\mego\S\"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\spago\A\*.*"; DestDir: "{app}\Textures\spago\A\"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\spago\B\*.*"; DestDir: "{app}\Textures\spago\B\"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\spago\S\*.*"; DestDir: "{app}\Textures\spago\S\"; Flags: external

Source: "{code:GetSourceDrive}Monkey4\MonkeyInstall\binkw32.dll"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyInstall\Chorus.flt"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyInstall\local.m4b"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyInstall\Monkey4.exe"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyInstall\Mp3dec.asi"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyInstall\Mss32.dll"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyInstall\Reverb3.flt"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyInstall\Sdelay.flt"; DestDir: "{app}"; Flags: external

Source: "{code:GetSourceDrive}Monkey4\MonkeyInstall\Saves\efmi.cfg"; DestDir: "{app}\Saves"; Flags: external

Source: "{code:GetSourceDrive}Monkey.exe"; DestDir: "{app}"; Flags: external


;Install folder - on CD1
Source: "{code:GetSourceDrive}Install\active.tga"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\back.WAV"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\click.WAV"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\close.tga"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\doc.exe"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\focused.tga"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\hover.WAV"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\inactive.tga"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\lecsetup.dll"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\license.txt"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\messages.tab"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\minimize.tga"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\Monkey.rtf"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\open.WAV"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\pressed.tga"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\Product.bmp"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\Product.rgn"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\Product.tab"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\README.RTF"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\readme.txt"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\setup.ini"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\Setup.tab"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\start.WAV"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\syscheck.exe"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\unselect.tga"; DestDir: "{app}\Install"; Flags: external
Source: "{code:GetSourceDrive}Install\url.exe"; DestDir: "{app}\Install"; Flags: external



;These 2 files only on some versions (V1.2 only?)
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\secrets.m4b"; DestDir: "{app}\Textures"; Flags: skipifsourcedoesntexist external
Source: "{code:GetSourceDrive}Monkey4\MonkeyInstall\Sdelay.flt"; DestDir: "{app}"; Flags: skipifsourcedoesntexist external



; ALL ON CD 2
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\artJam.m4b"; DestDir: "{app}"; Flags: external; Check: CD2()
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\artMon.m4b"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\voiceJam.m4b"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\voiceMon.m4b"; DestDir: "{app}"; Flags: external

Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\dumm.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\ela3.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\espy.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\finis.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\gmrr.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\herm.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\home2.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\moh_close_hat.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\moh_close_nohat.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\moh_open_hat.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\moh_open_nohat.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\oznx.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\rock.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\rock1B.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\rock1C.m4b"; DestDir: "{app}\Movies"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Movies\sory.m4b"; DestDir: "{app}\Movies"; Flags: external

Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\mego\C\*.*"; DestDir: "{app}\Textures\mego\C\"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\mego\D\*.*"; DestDir: "{app}\Textures\mego\D\"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\spago\C\*.*"; DestDir: "{app}\Textures\spago\C\"; Flags: external
Source: "{code:GetSourceDrive}Monkey4\MonkeyData\Textures\spago\D\*.*"; DestDir: "{app}\Textures\spago\D\"; Flags: external



;Compile into setup
Source: "..\EMI Launcher\EMILauncher.exe"; DestDir: "{app}"; DestName: "EMI Launcher.exe"
Source: "..\EMI Launcher\ReadMe\Escape From Monkey Island Launcher.html"; DestDir: "{app}"

[Registry]
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\; ValueType: none; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: none; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Analyze Path; ValueData: {app}\Install\SysCheck.exe
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: CD Path; ValueData: {code:GetSourceDrive}
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Executable; ValueData: {app}\Monkey4.exe
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Install Path; ValueData: {app}
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: dword; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: JoystickID; ValueData: 00000000
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Launcher; ValueData: {app}\Monkey4.exe
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Soundcard; ValueData: TRUE
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: dword; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: ForceColor; ValueData: 00000000
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: dword; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: OpenGL; ValueData: 00000000
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Display; ValueData: Primary Display Adapter
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: GUID; ValueData: {{00000000-0000-0000-0000000000000000}}
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Source Dir; ValueData: {code:GetSourceDrive}
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Source Path; ValueData: {code:GetSourceDrive}
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: UninstallString
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: dword; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: InstallType; ValueData: 00000001
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail\; ValueType: dword; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Installed; ValueData: 00000002

[Icons]
Name: {group}\{cm:UninstallProgram,Escape From Monkey Island}; Filename: {uninstallexe}; Comment: Uninstall Escape From Monkey Island
Name: {group}\Launcher Readme; Filename: {app}\Escape From Monkey Island Launcher.html; Comment: The readme file for the replacement launcher
Name: {group}\Lucasarts Readme; Filename: {app}\Install\readme.txt; Comment: The readme file that ships with the game
Name: {group}\Escape From Monkey Island; Filename: {app}\EMI Launcher.exe; Comment: Run Escape From Monkey Island; IconIndex: 0
Name: {userdesktop}\Escape From Monkey Island; Filename: {app}\EMI Launcher.exe; IconIndex: 0; Tasks: " desktopicon"

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}

[UninstallDelete]
Name: {app}\PatchedMonkey4.exe; Type: files

[CustomMessages]
RemoveSavedGames=Remove Saved Games?

[Code]

#include "FindCd.iss"

var
	SourceDrive: string;
	CallCount: integer;
	UserPage: TOutputMsgMemoWizardPage;

const
	CD1UniqueFile = 'Monkey4\MonkeyData\voiceMel.m4b';
	strAlreadyInstalled = 'Escape From Monkey Island is already installed!' + #13#10#13#10 + 'Continue anyway? (Existing files will be overwritten).';
	strCD1Error = 'Couldn''t find EMI CD1 in any drive!' + #13#10#13#10 + 'Make sure you''ve got the correct cd in the drive and try again.';
	strDeleteSavedGames = 'Delete any saved games?';
	strUserPageMemoText = 'Setup will search all drives and find the CD.' + #13#10#13#10 + 'In rare cases the search may not complete and setup will hang.' + #13#10 +  'If this happens then its because Windows cannot get information about all the drives on your system. Try disabling any virtual cd devices such as Daemon Tools, check that your drives work or as a last resort - restart in safe mode and run this installer from there.';
	strUserPageTitle = 'Insert CD 1';
	strUserPageHeader = 'Please insert Escape From Monkey Island CD 1 in any drive';
	strUserPageText = 'When you have done this click next';
	strCD2Prompt = 'Please insert Escape From Monkey Island CD 2 and press OK.' +  #13#10  'If you are using a virtual drive, then unmount CD 1 and remount CD 2 in the same drive' + #13#10#13#10 + 'Or press cancel to exit setup.';


function IsX64: Boolean;
begin
	Result := Is64BitInstallMode;
end;

function GetSourceDrive(Param: String): String;
begin
	Result:=SourceDrive;
end;

function GetAppID(param: String): String;
begin
	Result := 'bgbennyboyEMIReplacementSetup';
end;

function IsUpgrade(): Boolean; //is it already installed?
var
   sPrevPath: String;
begin
	sPrevPath := '';

	if not RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\' + getAppID('') + '_is1', 'UninstallString', sPrevpath) then
		RegQueryStringValue(HKCU, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{getAppID('') + _is1', 'UninstallString', sPrevpath);

	Result := (sPrevPath <> '');
end;

procedure InitializeWizard();
begin
	if IsUpgrade() then
	begin
		if MsgBox(strAlreadyInstalled, mbError, MB_OKCANCEL)=IDCANCEL then
			abort;
	end;

	SourceDrive := '';

	UserPage := CreateOutputMsgMemoPage(wpReady, strUserPageTitle, strUserPageHeader, strUserPageText, strUserPageMemoText);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
	if CurPageID = UserPage.ID then
	begin
		if SourceDrive = '' then
		begin
			SourceDrive:=GetSourceCdDrive(CD1UniqueFile);
			if SourceDrive <> '' then
				result := true
			else
			begin
				result := false;
				MsgBox(strCD1Error, mbError, MB_OK);
			end;
		end;
	end
	else
		Result := true;
end;

function CD2(): Boolean;
begin
	result:=true;

	{Extra check here:
		If its already been installed and you are installing again over the top then
		the FileExists() check below will pass and it'll jump straight to prompting
		for cd2 - it wont even bother copying files off cd1.
	}

	{
	CallCount:
		To make matters worse, this CD2() check function gets called multiple times
		when doing an 'upgrade install'. The only reliable way I've found of knowing
		when to let it show the CD2 MessageBox because it wants to copy the files is to
		count how many times this function is called.
	}

	Inc(CallCount);

	if ( IsUpgrade() ) and ( CallCount < 3) then
	begin
		//MsgBox('Its an upgrade install!', mbError, MB_OKCANCEL);
		result:=true;
	end
	else
	if (FileExists(AddBackslash(ExpandConstant('{app}')) + 'artAll.m4b')) and (FileExists(AddBackslash(ExpandConstant('{app}')) + 'Install\url.exe')) then //cd1 has copied all its files
	begin
		while FileExists(AddBackslash(ExpandConstant('{code:GetSourceDrive}')) + 'Monkey4\MonkeyData\voiceMon.m4b') = false do
		begin
			if MsgBox(strCD2Prompt, mbError, MB_OKCANCEL)=IDOK then

			else
			begin
				WizardForm.Close();
				exit;
			end;
		end;
	end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
	if CurUninstallStep=usUninstall then
	begin
		if MsgBox(strDeleteSavedGames ,mbConfirmation, MB_YESNO) = idYes then
		begin
			DelTree(ExpandConstant('{app}\Saves'), true, true, true);
		end;
	end;
end;
