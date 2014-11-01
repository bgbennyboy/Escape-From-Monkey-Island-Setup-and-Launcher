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

program EMILauncher;

{$R *.dres}

uses
  Forms,
  Mainform in 'Mainform.pas' {frmMain},
  ChangeResForm in 'ChangeResForm.pas' {frmChangeRes},
  OptionsForm in 'OptionsForm.pas' {frmOptions},
  uEMIUtils in 'uEMIUtils.pas',
  uEMIConst in 'uEMIConst.pas',
  ChangeNoCdForm in 'ChangeNoCdForm.pas' {frmPatchNoCd};

{$R 'Images.res'}
{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.Title := strAppTitle;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmChangeRes, frmChangeRes);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmPatchNoCd, frmPatchNoCd);
  Application.Run;
end.
