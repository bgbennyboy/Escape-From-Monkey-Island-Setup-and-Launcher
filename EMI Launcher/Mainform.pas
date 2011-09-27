 {
******************************************************
  Escape From Monkey Island Launcher
  Copyright (c) 2004-2010 Bgbennyboy
  Http://quick.mixnmojo.com
******************************************************
}

{
  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either version 2
  of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

{
BEFORE RELEASE:
    DISABLE ReportMemoryLeaksOnShutdown in project .dpr
    Change build configuration from debug to release
    Update readme
    Replace readme in MainResources.res with new one
    Compress with UPX
}

unit Mainform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Jpeg, Math, ExtCtrls,
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
    StatusBar1.SimpleText:= strPatchedRes;
end;

//Form create
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //Set vista fonts if necessary
  //SetDesktopIconFonts(Self.Font);

  CreateDefaultRegKeys;
  ChooseImage;

  //Getting the temp file name also seems to create it, so rename it to html for the readme
  strTempReadMeName:=FileGetTempName('EMI');
  RenameFile(strTempReadMeName, strTempReadMeName + '.html');
  strTempReadMeName:=strTempReadMeName + '.html';

  if GetEMIpath='' then
    showmessage(strRegKeysNotFound);

  UpdateStatusBar;
end;

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

//Lec Readme Button Click
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

//Readme Launcher button click
procedure TfrmMain.btnReadmeLauncherClick(Sender: TObject);
var
  resStream: TResourceStream;
begin
  if strTempReadMeName = '' then exit;

  resStream:=TResourceStream.Create(0, 'README', 'TEXT');
  try
    resStream.SaveToFile(strTempReadMeName);
    shellexec(0,'open', strTempReadMeName, '', ExtractFilePath(strTempReadMeName), SW_NORMAL);
  finally
    resStream.Free;
  end;
end;

end.
