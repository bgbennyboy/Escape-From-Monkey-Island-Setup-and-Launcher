;***************************************************************
;  Escape From Monkey Island Setup
;  Copyright (c) 2007-2008 Bgbennyboy
;  Http://quick.mixnmojo.com
;***************************************************************
;
;  This program is free software; you can redistribute it and/or
;  modify it under the terms of the GNU General Public License
;  as published by the Free Software Foundation; either version 2
;  of the License, or (at your option) any later version.
;
;  This program is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License
;  along with this program; if not, write to the Free Software
;  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

;TODO
;Add other languages
;Enable the do you want to install? message before it starts asking for the cd's
;Include NoCD patch?
;Make a dvd install?


[Setup]
VersionInfoVersion=1.0
VersionInfoCompany=Quick And Easy Software
VersionInfoDescription=Replacement installer for Escape From Monkey Island
VersionInfoTextVersion=1.0
VersionInfoCopyright=bgbennyboy 2008
AppCopyright=bgbennyboy 2010
AppName=Escape From Monkey Island
AppVerName=Escape From Monkey Island 1.0
RestartIfNeededByRun=false
AllowRootDirectory=false
DefaultDirName={pf}\Lucasarts\Monkey4\
ShowLanguageDialog=auto
InternalCompressLevel=max
DefaultGroupName=Lucasarts\Monkey 4\
OutputBaseFilename=Monkey4Setup
AppPublisher=Quick and Easy Software
AppPublisherURL=http://quick.mixnmojo.com
AppSupportURL=http://quick.mixnmojo.com
AppUpdatesURL=http://quick.mixnmojo.com
AppVersion=1.0
AppComments=Contact me via my contact page
AppContact=http://quick.mixnmojo.com/contact
UninstallDisplayIcon={app}\EMI Launcher.exe
UninstallDisplayName=Escape From Monkey Island
DisableProgramGroupPage=false
AllowNoIcons=true
AlwaysUsePersonalGroup=false
PrivilegesRequired=admin
AppID={code:GetAppID|''}
WizardImageFile=Large_Wizard_Image.bmp
WizardSmallImageFile=Small_Wizard_Image.bmp
Compression=lzma
SolidCompression=false
InfoBeforeFile=Before.rtf
UsePreviousLanguage=no

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
Source: {code:GetSourceDrive}Monkey4\MonkeyData\artAll.m4b; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\artLuc.m4b; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\artMel.m4b; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\lip.m4b; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\sfx.m4b; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\voiceAll.m4b; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\voiceLuc.m4b; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\voiceMel.m4b; DestDir: {app}; Flags: external

Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\bank.m4b; DestDir: {app}\Movies; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\dock.m4b; DestDir: {app}\Movies; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\ela2.m4b; DestDir: {app}\Movies; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\home1.m4b; DestDir: {app}\Movies; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\intro_a.m4b; DestDir: {app}\Movies; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\intro_b.m4b; DestDir: {app}\Movies; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\melt.m4b; DestDir: {app}\Movies; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\nose.m4b; DestDir: {app}\Movies; Flags: external

Source: {code:GetSourceDrive}Monkey4\MonkeyData\Textures\FullMonkeyMap.imt; DestDir: {app}\Textures; Flags: external

Source: {code:GetSourceDrive}Monkey4\MonkeyData\Textures\mego\A\*.*; DestDir: {app}\Textures\mego\A\; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Textures\mego\B\*.*; DestDir: {app}\Textures\mego\B\; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Textures\mego\S\*.*; DestDir: {app}\Textures\mego\S\; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Textures\spago\A\*.*; DestDir: {app}\Textures\spago\A\; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Textures\spago\B\*.*; DestDir: {app}\Textures\spago\B\; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Textures\spago\S\*.*; DestDir: {app}\Textures\spago\S\; Flags: external

Source: {code:GetSourceDrive}Monkey4\MonkeyInstall\binkw32.dll; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyInstall\Chorus.flt; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyInstall\local.m4b; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyInstall\Monkey4.exe; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyInstall\Mp3dec.asi; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyInstall\Mss32.dll; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyInstall\Reverb3.flt; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Monkey4\MonkeyInstall\Sdelay.flt; DestDir: {app}; Flags: external

Source: {code:GetSourceDrive}Monkey4\MonkeyInstall\Saves\efmi.cfg; DestDir: {app}\Saves; Flags: external

Source: {code:GetSourceDrive}Monkey.exe; DestDir: {app}; Flags: external


;Install folder - on CD1
Source: {code:GetSourceDrive}Install\active.tga; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\back.WAV; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\click.WAV; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\close.tga; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\doc.exe; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\focused.tga; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\hover.WAV; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\inactive.tga; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\lecsetup.dll; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\license.txt; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\messages.tab; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\minimize.tga; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\Monkey.rtf; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\open.WAV; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\pressed.tga; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\Product.bmp; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\Product.rgn; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\Product.tab; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\README.RTF; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\readme.txt; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\setup.ini; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\Setup.tab; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\start.WAV; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\syscheck.exe; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\unselect.tga; DestDir: {app}\Install; Flags: external
Source: {code:GetSourceDrive}Install\url.exe; DestDir: {app}\Install; Flags: external





; ALL ON CD 2
Source: {code:GetSourceDrive}Monkey4\MonkeyData\artJam.m4b; DestDir: {app}; Flags: external; Check: CD2()
Source: {code:GetSourceDrive}Monkey4\MonkeyData\artMon.m4b; DestDir: {app}; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\voiceJam.m4b; DestDir: {app}; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\voiceMon.m4b; DestDir: {app}; Flags: external; Check: 

Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\dumm.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\ela3.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\espy.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\finis.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\gmrr.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\herm.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\home2.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\moh_close_hat.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\moh_close_nohat.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\moh_open_hat.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\moh_open_nohat.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\oznx.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\rock.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\rock1B.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\rock1C.m4b; DestDir: {app}\Movies; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Movies\sory.m4b; DestDir: {app}\Movies; Flags: external; Check: 

Source: {code:GetSourceDrive}Monkey4\MonkeyData\Textures\mego\C\*.*; DestDir: {app}\Textures\mego\C\; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Textures\mego\D\*.*; DestDir: {app}\Textures\mego\D\; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Textures\spago\C\*.*; DestDir: {app}\Textures\spago\C\; Flags: external; Check: 
Source: {code:GetSourceDrive}Monkey4\MonkeyData\Textures\spago\D\*.*; DestDir: {app}\Textures\spago\D\; Flags: external; Check: 



;Compile into setup
Source: EMI Launcher.exe; DestDir: {app}
Source: Escape From Monkey Island Launcher.html; DestDir: {app}


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
var
	SourceDrive: string;
	CallCount: integer;

#include "FindCd.iss"


function IsX64: Boolean;
begin
	Result := Is64BitInstallMode;
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

function GetSourceDrive(Param: String): String;
begin
	Result:=SourceDrive;
end;

function CD2(): Boolean;
begin
	//If these if's are both true then first+last file on cd1 have been copied, so we can assume that all file
	//copying on CD1 is done. Its therefore OK to display the CD2 prompt.
	//Without this check the CD2 prompt appears before the installation begins.

	CallCount:=CallCount + 1;

	//Extra check here - if its already been installed and this installer is running again then
	//the files will be found - even though the files havent been copied off cd1 yet.
	//Without this check the CD2 prompt appears, the user has to insert cd2 and the installer then tries to copy files from CD1.

	if (IsUpgrade()) and (CallCount < 2) then //Need to check callcount because this check function is called multiple times before file copying even begins
	begin
		//MsgBox('Its an upgrade install!', mbError, MB_OKCANCEL);
		result:=true;
	end
	else

	if (FileExists(AddBackslash(ExpandConstant('{app}')) + 'artAll.m4b')) and (FileExists(AddBackslash(ExpandConstant('{app}')) + 'Install\url.exe')) then
	begin
		while not FileExists(AddBackslash(ExpandConstant('{code:GetSourceDrive}')) + 'Monkey4\MonkeyData\voiceMon.m4b') do
		begin
			if MsgBox('Please insert Escape From Monkey Island CD 2 in any drive and press OK.' + Chr(13) + Chr(13) +
				'Or press cancel to exit setup.', mbError, MB_OKCANCEL)=IDOK then

			else
			begin
				result:=false;
				WizardForm.Close();
				exit;
			end;
		end;
		result:=true;
	end

	else
		result:=true;
end;

procedure InitializeWizard();
begin
	if IsUpgrade() then
	begin
		if MsgBox('Escape From Monkey Island is already installed!' + Chr(13) + Chr(13) + 'Continue anyway? (Existing files will be overwritten).', mbError, MB_OKCANCEL)=IDCANCEL then
			abort;
	end;


	SourceDrive:=GetSourceCdDrive();
end;


procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
	if CurUninstallStep=usUninstall then
	begin
		if MsgBox('Delete any saved games?',mbConfirmation,MB_YESNO)=idYes then
		begin
			DelTree(ExpandConstant('{app}\Saves'),true,true,true);
		end;
	end;
end;
