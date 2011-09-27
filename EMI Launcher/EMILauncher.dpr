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

program EMILauncher;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain},
  ChangeResForm in 'ChangeResForm.pas' {frmChangeRes},
  OptionsForm in 'OptionsForm.pas' {frmOptions},
  uEMIUtils in 'uEMIUtils.pas',
  uEMIConst in 'uEMIConst.pas';

{$R 'MainResources.res'}
{$R 'Images.res'}
{$R 'UAC.res'}


begin
  //ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.Title := strAppTitle;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmChangeRes, frmChangeRes);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.
