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

{
BEFORE RELEASE:
    Change build configuration from debug to release
    Update readme
    Replace readme in MainResources.res with new one
}


//TODO
//Update installer
//Get it all tested

unit Mainform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Jpeg, Math, ExtCtrls, jclsysinfo,
  jclshell, JCLFileUtils, AdvGlowButton,
  uEMIUtils, uEMIConst;

type
  TfrmMain = class(TForm)
    Bevel1: TBevel;
    ImageMain: TImage;
    StatusBar1: TStatusBar;
    btnOptions: TAdvGlowButton;
    btnReadmeLec: TAdvGlowButton;
    btnReadmeLauncher: TAdvGlowButton;
    btnRes: TAdvGlowButton;
    btnWindowed: TAdvGlowButton;
    btnPlay: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnReadmeLecClick(Sender: TObject);
    procedure btnWindowedClick(Sender: TObject);
    procedure btnResClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnReadmeLauncherClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    strTempReadMeName: string;
    function GetResourceAsJpeg(const ResName: string): TJPEGImage;
    procedure UpdateStatusBar;
    procedure ChooseImage;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses ChangeResForm, OptionsForm;

{$R *.dfm}

//Load Jpeg from .res
function TfrmMain.GetResourceAsJpeg(const ResName: string): TJPEGImage;
var
  resStream: TResourceStream;
begin
  resStream:=TResourceStream.Create(hInstance, ResName, 'JPEG');
  try
    Result:=TJPEGImage.Create;
    Result.LoadFromStream(resStream);
  finally
    resStream.Free;
  end;
end;

//Choose image
procedure TfrmMain.ChooseImage;
var
  jpg: TJPEGImage;
  i: integer;
begin
  Randomize;
  i:=RandomRange(1,11);

  jpg:=GetResourceAsJpeg('EMI' + inttostr(i));
  try
    ImageMain.Picture.Bitmap.Assign(jpg);
  finally
    jpg.Free;
  end;
end;

//Check which exe is being used
procedure TfrmMain.UpdateStatusBar;
begin
  if GetUseOriginalExe=true then
    StatusBar1.SimpleText:= strOriginalRes
  else
    StatusBar1.SimpleText:= strPatchedRes + ' ' + GetPatchedResolution;
end;

//Form create
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  CreateDefaultRegKeys;
  ChooseImage;

  strTempReadMeName := FindUnusedFileName( IncludeTrailingPathDelimiter( GetWindowsTempFolder) + 'EMILAUNCHERREADME', '.html', '-new');

  if GetEMIpath='' then
    showmessage(strRegKeysNotFound);

  UpdateStatusBar;
end;

//Form destroy
procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //Remove the temporary file if it was created
  if FileExists(strTempReadMeName) then
    DeleteFile(strTempReadMeName);
end;

//Play button click
procedure TfrmMain.btnPlayClick(Sender: TObject);
begin
  if FileExists(GetEMIpath + GetEMIexe)=false then
  begin
    ShowMessage(strFileNotFound + GetEMIpath + GetEMIexe);
    exit;
  end;

  ShellExec(0, 'open', getEMIpath + GetEMIexe, '', getEMIpath, SW_NORMAL);

  if GetCloseOnRun then
    close;
end;

//Windowed button click
procedure TfrmMain.btnWindowedClick(Sender: TObject);
begin
  if FileExists(GetEMIpath + GetEMIexe)=false then
  begin
    ShowMessage(strFileNotFound + GetEMIpath + GetEMIexe);
    exit;
  end
  else
  {if GetUseOriginalExe=false then
    ShowMessage(strWindowedPatchedResWarning)
  else}
  begin
    ShellExec(0, 'open', getEMIpath + GetEMIExe, '-w', getEMIpath, SW_NORMAL);

    if GetCloseOnRun=true then
      Close;
  end;
end;

//Lucasarts Readme Button Click
procedure TfrmMain.btnReadmeLecClick(Sender: TObject);
var
  FileName: string;
begin
  if getEMIpath='' then exit;

  FileName:=getEMIpath + '\install\' + 'Readme.txt';
  if FileExists(FileName) = false then
  begin
    ShowMessage(strLecReadmeNotFound);
    Exit;
  end;

  ShellExec(0, 'open', FileName, '', '', SW_NORMAL);
end;

//Readme Launcher button click
procedure TfrmMain.btnReadmeLauncherClick(Sender: TObject);
var
  resStream: TResourceStream;
begin
  if strTempReadMeName = '' then exit;

  resStream:=TResourceStream.Create(0, 'README', 'TEXT');
  try
    resStream.SaveToFile(strTempReadMeName);
    //Fix for opening webpage in Windows 8. Normally doesnt work from elevated process - this way lets it run as non-elevated
    shellexec(0,'open', 'explorer.exe', strTempReadMeName,  ExtractFilePath(strTempReadMeName), SW_NORMAL);
  finally
    resStream.Free;
  end;
end;

//Resolution button click
procedure TfrmMain.btnResClick(Sender: TObject);
begin
  frmChangeRes.showmodal;

  UpdateStatusBar;
end;

//Options button click
procedure TfrmMain.btnOptionsClick(Sender: TObject);
begin
  frmOptions.showmodal;

  UpdateStatusBar;
end;

end.
