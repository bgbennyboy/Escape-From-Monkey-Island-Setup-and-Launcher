 {
******************************************************
  Escape From Monkey Island Launcher
  Copyright (c) 2004-2008 Bgbennyboy
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

unit OptionsForm;

interface

uses
  Windows, Messages, SysUtils, Controls, Forms, Classes, Dialogs, ImgList, PngImageList,
  TaskDialog, WebCopy,  AdvGlowButton, JCLRegistry, JCLShell, uEMIUtils, uVistaFuncs,
  uEMIConst;

type
  TfrmOptions = class(TForm)
    WebCopy1: TWebCopy;
    dlgChooseLanguage: TAdvTaskDialog;
    btnCloseOnRun: TAdvGlowButton;
    btnPatch: TAdvGlowButton;
    btnRenderingMode: TAdvGlowButton;
    btnColourDepth: TAdvGlowButton;
    PngImageList1: TPngImageList;
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
    procedure FormCreate(Sender: TObject);
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
procedure TfrmOptions.FormCreate(Sender: TObject);
begin
  SetDesktopIconFonts(Self.Font);
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
end;

//Close on run button click
procedure TfrmOptions.btnCloseOnRunClick(Sender: TObject);
begin
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

//Colour depth button click
procedure TfrmOptions.btnColourDepthClick(Sender: TObject);
begin
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
  ShowMessage(strErrNoNetConnection);
end;

//Webcopy URL not found
procedure TfrmOptions.WebCopy1URLNotFound(Sender: TObject; url: String);
begin
  ShowMessage(strFileNotFound + url);
end;

//Webcopy error info
procedure TfrmOptions.WebCopy1ErrorInfo(Sender: TObject;
  ErrorCode: Integer; ErrorInfo: String);
begin
  ShowMessage(strErrDownload + chr(10) + errorinfo);
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
