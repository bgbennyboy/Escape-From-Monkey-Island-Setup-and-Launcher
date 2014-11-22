 {
******************************************************
  Escape From Monkey Island Launcher
  2004-2014 By Bennyboy
  Http://quickandeasysoftware.net
******************************************************
}
{
  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.
}

unit OptionsForm;

interface

uses
  Windows, Messages, SysUtils, Controls, Forms, Classes, Dialogs, ImgList,
  IOUtils, System.UITypes, MMSystem, TaskDialog, WebCopy, AdvGlowButton,
  JCLRegistry, JCLShell,  uEMIUtils, uEMIConst, ChangeNoCdForm;

type
  TfrmOptions = class(TForm)
    WebCopy1: TWebCopy;
    dlgChooseLanguage: TAdvTaskDialog;
    btnCloseOnRun: TAdvGlowButton;
    btnPatch: TAdvGlowButton;
    btnRenderingMode: TAdvGlowButton;
    btnColourDepth: TAdvGlowButton;
    ImageList1: TImageList;
    btnRunWithoutCDs: TAdvGlowButton;
    btnSoundInLauncher: TAdvGlowButton;
    procedure FormShow(Sender: TObject);
    procedure btnCloseOnRunClick(Sender: TObject);
    procedure btnPatchClick(Sender: TObject);
    procedure WebCopy1ConnectError(Sender: TObject);
    procedure WebCopy1URLNotFound(Sender: TObject; url: String);
    procedure WebCopy1ErrorInfo(Sender: TObject; ErrorCode: Integer;
      ErrorInfo: String);
    procedure WebCopy1FileDone(Sender: TObject; idx: Integer);
    procedure WebCopy1CopyCancel(Sender: TObject);
    procedure dlgChooseLanguageDialogButtonClick(Sender: TObject;
      ButtonID: Integer);
    procedure btnRenderingModeClick(Sender: TObject);
    procedure btnColourDepthClick(Sender: TObject);
    procedure btnRunWithoutCDsClick(Sender: TObject);
    procedure btnSoundInLauncherClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

{$R *.dfm}


//Form show actions
procedure TfrmOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if GetLauncherSounds then
    sndPlaySound(pchar(getEMIpath + 'Install\back.wav'), SND_NODEFAULT or SND_ASYNC );
end;

procedure TfrmOptions.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then //Escape key
    Close;
end;

procedure TfrmOptions.FormShow(Sender: TObject);
begin
  if GetCloseOnRun=true then
  begin
    btnCloseOnRun.ImageIndex:=1;
    btnCloseOnRun.Tag:=1;
  end
  else
  begin
    btnCloseOnRun.ImageIndex:=0;
    btnCloseOnRun.Tag:=0;
  end;

  if GetOpenGL=true then
  begin
    btnRenderingMode.ImageIndex:=4;
    btnRenderingMode.Tag:=1;
  end
  else
  begin
    btnRenderingMode.ImageIndex:=3;
    btnRenderingMode.Tag:=0;
  end;

  if Get16BitColourDepth=true then
  begin
    btnColourDepth.ImageIndex:=6;
    btnColourDepth.Tag:=1;
  end
  else
  begin
    btnColourDepth.ImageIndex:=5;
    btnColourDepth.Tag:=0;
  end;

  if GetHdRun=true then
  begin
    btnRunWithoutCDs.ImageIndex:=8;
    btnRunWithoutCDs.Tag:=1;
  end
  else
  begin
    btnRunWithoutCDs.ImageIndex:=7;
    btnRunWithoutCDs.Tag:=0;
  end;

  if GetLauncherSounds=true then
  begin
    btnSoundInLauncher.ImageIndex:=10;
    btnSoundInLauncher.Tag:=1;
  end
  else
  begin
    btnSoundInLauncher.ImageIndex:=9;
    btnSoundInLauncher.Tag:=0;
  end;
end;

//Close on run button click
procedure TfrmOptions.btnCloseOnRunClick(Sender: TObject);
begin
  if GetLauncherSounds then
    sndPlaySound(pchar(getEMIpath + 'Install\click.wav'), SND_NODEFAULT or SND_ASYNC );

  if btnCloseOnRun.Tag=1 then
  begin
    btnCloseOnRun.ImageIndex:=0;
    btnCloseOnRun.Tag:=0;
    regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'closeonrun', 0);
  end
  else
  if btnCloseOnRun.Tag=0 then
  begin
    btnCloseOnRun.ImageIndex:=1;
    btnCloseOnRun.Tag:=1;
    regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'closeonrun', 1);
  end
end;

//Rendering Mode Button Click
procedure TfrmOptions.btnRenderingModeClick(Sender: TObject);
begin
  if GetLauncherSounds then
    sndPlaySound(pchar(getEMIpath + 'Install\click.wav'), SND_NODEFAULT or SND_ASYNC );

  if btnRenderingMode.Tag=1 then
  begin
    btnRenderingMode.ImageIndex:=3;
    btnRenderingMode.Tag:=0;
    regwriteinteger(HKEY_LOCAL_MACHINE,'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail', 'OpenGL', 0);
  end
  else
  if btnRenderingMode.Tag=0 then
  begin
    btnRenderingMode.ImageIndex:=4;
    btnRenderingMode.Tag:=1;
    regwriteinteger(HKEY_LOCAL_MACHINE,'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail', 'OpenGL', 1);
  end
end;

procedure TfrmOptions.btnRunWithoutCDsClick(Sender: TObject);
var
  BackupPath: string;
begin
  if GetLauncherSounds then
    sndPlaySound(pchar(getEMIpath + 'Install\click.wav'), SND_NODEFAULT or SND_ASYNC );

  if btnRunWithoutCDs.Tag=1 then
  begin
    //Try and restore the backups
    BackupPath := IncludeTrailingPathDelimiter(GetEMIPath) + IncludeTrailingPathDelimiter('Backup');
    if (DirectoryExists(BackupPath) = false) or
       (FileExists(BackupPath + 'Monkey4.exe') = false) or
       (FileExists(BackupPath + 'FullMonkeyMap.imt') = false)
    then
    begin
      MessageDlg(strErrMissingBackupFolder, mtWarning , [mbOk], 0);
      Exit;
    end;

    //Sometimes files are read only so we cant copy them back
    RemoveReadOnlyFileAttribute(BackupPath + 'Monkey4.exe');
    RemoveReadOnlyFileAttribute(BackupPath + 'FullMonkeyMap.imt');
    RemoveReadOnlyFileAttribute(GetEMIPathAndExe);
    RemoveReadOnlyFileAttribute(IncludeTrailingPathDelimiter(GetEMIPath) + 'Textures\FullMonkeyMap.imt');

    //Copy the files back to their original location
    try
      TFile.Copy(BackupPath + 'FullMonkeyMap.imt', IncludeTrailingPathDelimiter(GetEMIPath) + 'Textures\FullMonkeyMap.imt', true);
      TFile.Copy(BackupPath + 'Monkey4.exe', GetEMIPathAndExe, true);
    except on e: exception do
    begin
      MessageDlg(strErrRestoreFilesPart1 + e.Message + sLineBreak + sLineBreak +
                 strErrRestoreFilesPart2, mtError , [mbOk], 0);
      Exit;
    end;
    end;

    //If we get here then files have been successfully restored
    btnRunWithoutCDs.ImageIndex:=7;
    btnRunWithoutCDs.Tag:=0;
    regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'hdrun', 0);
    MessageDlg(strCdPatchRemoved, mtInformation , [mbOk], 0);
  end
  else
  if btnRunWithoutCDs.Tag=0 then
  begin
    frmPatchNoCd.ShowModal;

    //Now check if it was successful
    if GetHdRun=true then
    begin
      btnRunWithoutCDs.ImageIndex:=8;
      btnRunWithoutCDs.Tag:=1;
    end
    else
    begin
      btnRunWithoutCDs.ImageIndex:=7;
      btnRunWithoutCDs.Tag:=0;
    end;
  end
end;

procedure TfrmOptions.btnSoundInLauncherClick(Sender: TObject);
begin
  if GetLauncherSounds then
    sndPlaySound(pchar(getEMIpath + 'Install\click.wav'), SND_NODEFAULT or SND_ASYNC );

  if btnSoundInLauncher.Tag=1 then
  begin
    btnSoundInLauncher.ImageIndex:=9;
    btnSoundInLauncher.Tag:=0;
    regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'launchersounds', 0);
  end
  else
  if btnSoundInLauncher.Tag=0 then
  begin
    btnSoundInLauncher.ImageIndex:=10;
    btnSoundInLauncher.Tag:=1;
    regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'launchersounds', 1);
  end
end;

//Colour depth button click
procedure TfrmOptions.btnColourDepthClick(Sender: TObject);
begin
  if GetLauncherSounds then
    sndPlaySound(pchar(getEMIpath + 'Install\click.wav'), SND_NODEFAULT or SND_ASYNC );

  if btnColourDepth.Tag=1 then
  begin
    btnColourDepth.ImageIndex:=5;
    btnColourDepth.Tag:=0;
    regwriteinteger(HKEY_LOCAL_MACHINE,'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail', 'ForceColor', 0);
  end
  else
  if btnColourDepth.Tag=0 then
  begin
    btnColourDepth.ImageIndex:=6;
    btnColourDepth.Tag:=1;
    regwriteinteger(HKEY_LOCAL_MACHINE,'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail', 'ForceColor', 1);
  end
end;

//Patch button click
procedure TfrmOptions.btnPatchClick(Sender: TObject);
var
  i: integer;
begin
  if GetLauncherSounds then
    sndPlaySound(pchar(getEMIpath + 'Install\click.wav'), SND_NODEFAULT or SND_ASYNC );

  //First disable all items
  //May as well set the targetdir here too
  for I := 0 to webcopy1.Items.Count - 1 do
  begin
    Webcopy1.Items.Items[i].targetdir:=GetEMIpath;
    WebCopy1.Items.Items[i].Active:=false;
  end;

  dlgChooseLanguage.Execute;
  WebCopy1.Execute;
end;

procedure TfrmOptions.dlgChooseLanguageDialogButtonClick(Sender: TObject;
  ButtonID: Integer);
begin
  //Enable the one that was selected
  case ButtonID of
    2:  exit; //Cancel was pressed
  100:  WebCopy1.Items.Items[0].Active:=true;
  101:  WebCopy1.Items.Items[1].Active:=true;
  102:  WebCopy1.Items.Items[2].Active:=true;
  103:  WebCopy1.Items.Items[3].Active:=true;
  104:  WebCopy1.Items.Items[4].Active:=true;
  105:  WebCopy1.Items.Items[5].Active:=true;
  else exit;
  end;
end;

//Webcopy connect error
procedure TfrmOptions.WebCopy1ConnectError(Sender: TObject);
begin
  MessageDlg(strErrNoNetConnection, mtWarning , [mbOk], 0);
end;

//Webcopy URL not found
procedure TfrmOptions.WebCopy1URLNotFound(Sender: TObject; url: String);
begin
  MessageDlg(strFileNotFound + url, mtWarning , [mbOk], 0);
end;

//Webcopy error info
procedure TfrmOptions.WebCopy1ErrorInfo(Sender: TObject;
  ErrorCode: Integer; ErrorInfo: String);
begin
  MessageDlg(strErrDownload + chr(10) + errorinfo, mtError , [mbOk], 0);
end;

//Webcopy file done
procedure TfrmOptions.WebCopy1FileDone(Sender: TObject; idx: Integer);
var
  MonkeyExe: string;
begin
  MonkeyExe:=WebCopy1.Items.Items[idx].TargetFilename;
  ShellExec(0, 'open', getEMIpath + MonkeyExe, '', getEMIpath, SW_NORMAL);
end;

//Webcopy cancel
procedure TfrmOptions.WebCopy1CopyCancel(Sender: TObject);
begin
  WebCopy1.CancelCopy;
end;

end.
