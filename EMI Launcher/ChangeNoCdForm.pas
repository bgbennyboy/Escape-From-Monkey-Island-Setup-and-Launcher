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

unit ChangeNoCdForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IOUtils,
  JCLRegistry,
  uEMIUtils, uEMIConst;

type
  TfrmPatchNoCd = class(TForm)
    memoOutput: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function ApplyNoCdPatch(ExeFile: string): boolean;
    function ApplyMonkeyMapPatch(MonkeyMap: string): boolean;
    function VerifyPatchApplicableAtOffset(PatchArray: array of integer; Offset: integer): boolean;
    function ApplyPatchAtOffset(PatchArray: array of integer; Offset: integer): boolean;
    function ApplySpecificPatch(Source, Dest: array of integer; Offset, PatchNo: integer): boolean;
    procedure AddOutput(Instring: string; NewLine: boolean=false);
  public
    { Public declarations }
  end;

var
  frmPatchNoCd: TfrmPatchNoCd;
  MemStream: TMemoryStream;
const
  arraySourceBytes1: array [0..26] of integer = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 139);
  arraySourceBytes2: array [0..5] of integer = (208, 252, 75,  0, 81, 255); //D0 FC 4B 00 51 FF
  arraySourceBytes3: array [0..5] of integer = (5, 117, 36, 138, 6, 141 ); //05 75 24 8A 06 8D
  arraySourceBytes4: array [0..17] of integer = (77, 111, 110, 107, 101, 121, 52, 92, 77, 111, 110, 107, 101, 121, 68, 97, 116, 97   ); //4D 6F 6E 6B 65 79 34 5C 4D 6F 6E 6B 65 79 44 61 74 61

  arrayDestBytes1: array [0..11] of integer = (73, 110, 115, 116, 97, 108, 108, 32, 80, 97, 116, 104);
  arrayDestBytes2: array [0..2] of integer = (230, 15, 64);
  arrayDestBytes3: array [0..0] of integer = (3);
  arrayDestBytes4: array [0..17] of integer = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


implementation

{$R *.dfm}

//Add output
procedure TfrmPatchNoCd.AddOutput(Instring: string; NewLine: boolean=false);
begin
  memoOutput.Lines.Add(Instring);
  if NewLine=true then
    memoOutput.Lines.Add('');
end;

function TfrmPatchNoCd.ApplyMonkeyMapPatch(MonkeyMap: string): boolean;
var
  StringList: TStringList;
begin
  result := false;

  if FileExists(MonkeyMap) = false then
  begin
    AddOutput(strErrNoMonkeyMapFile);
    exit;
  end;

  StringList := TStringList.Create;
  try
    StringList.LoadFromFile(MonkeyMap);
    StringList.Add(strMonkeyMapPatch);
    StringList.SaveToFile(MonkeyMap);
    result := true;
  finally
    StringList.Free;
  end;
end;

function TfrmPatchNoCd.ApplyNoCdPatch(ExeFile: string): boolean;
var
  TheFile: TFileStream;
  TempByte: byte;
  CurrentOffset, AppliedPatches: integer;
begin
  result := false;
  AppliedPatches := 0;

  if FileExists(ExeFile) = false then
  begin
    AddOutput(strErrNoMonkey4File);
    exit;
  end;

  MemStream := TMemoryStream.Create;
  try
    TheFile := TFilestream.Create(ExeFile, fmopenread);
    try
      MemStream.CopyFrom(TheFile, TheFile.Size); //Much quicker to work with a memory stream
      MemStream.Position := 0;

      //Read one byte at a time then check if it matches first byte of any of the patches
      while MemStream.Position < MemStream.Size do
      begin
        MemStream.Read(TempByte, 1);
        CurrentOffset := MemStream.Position;

        if TempByte=arraySourceBytes1[low(arraySourceBytes1)] then
        begin
          if ApplySpecificPatch(arraySourceBytes1, arrayDestBytes1, CurrentOffset -1, 1) then
            inc(AppliedPatches);
          MemStream.Position := CurrentOffset; //Continue the search
        end
        else
        if TempByte=arraySourceBytes2[low(arraySourceBytes2)] then
        begin
          if ApplySpecificPatch(arraySourceBytes2, arrayDestBytes2, CurrentOffset -1, 2) then
            inc(AppliedPatches);
          MemStream.Position := CurrentOffset; //Continue the search
        end
        else
        if TempByte=arraySourceBytes3[low(arraySourceBytes3)] then
        begin
          if ApplySpecificPatch(arraySourceBytes3, arrayDestBytes3, CurrentOffset -1, 3) then
            inc(AppliedPatches);
          MemStream.Position := CurrentOffset; //Continue the search
        end
        else
        if TempByte=arraySourceBytes4[low(arraySourceBytes4)] then
        begin
          if ApplySpecificPatch(arraySourceBytes4, arrayDestBytes4,CurrentOffset -1, 4) then
            inc(AppliedPatches);
          MemStream.Position := CurrentOffset; //Continue the search
        end
      end;

    finally
      TheFile.Free;
    end;
  finally
    //Check if all 4 patches have been applied
    if AppliedPatches = 4 then
    begin
      MemStream.SaveToFile(ExeFile);
      Result := true;
    end
    else
    begin
      AddOutput(strErrPatchesApplied1 + inttostr(AppliedPatches) + strErrPatchesApplied2, true);
    end;


    MemStream.Free;
  end;


end;

function TfrmPatchNoCd.VerifyPatchApplicableAtOffset(PatchArray: array of integer;
  Offset: integer): boolean;
var
  TempByte: byte;
  i: integer;
begin
  result := false;

  memStream.Position := Offset; //This should mean that we are positioned before the first byte of the patch position
  memStream.Seek(High(PatchArray) , SoFromCurrent); //Seek to the penultimate byte
  memStream.Read(TempByte, 1); //See if the last byte matches
  if TempByte <> PatchArray[High(PatchArray)] then //the last byte wasnt the same
    exit
  else  //It does match
  begin
    memStream.Seek(-High(PatchArray), SoFromCurrent); //seek to the second byte in the sequence

    for i := 1 to High(PatchArray) - 1 do //read all bytes between first and last byte
    begin
      memStream.Read(TempByte, 1);
      if TempByte = PatchArray[i] then //the byte matches the one from the array
      begin
        if i = High(PatchArray) - 1 then //All the bytes matched
        begin
          result := true;
          exit;
        end;
      end
      else //the byte differed
        exit;
    end;
  end;
end;

function TfrmPatchNoCd.ApplyPatchAtOffset(PatchArray: array of integer;
  Offset: integer): boolean;
var
  TempByte: byte;
  i: integer;
begin
  result := true;

  memStream.Position := Offset; //Should mean that we are positioned before the first byte of the patch position

  try
  for i := Low(PatchArray) to High(PatchArray) do
  begin
    TempByte := PatchArray[i];
    memStream.Write(TempByte, 1);
  end;
  except
    result := false;
  end;

end;

function TfrmPatchNoCd.ApplySpecificPatch(Source, Dest: array of integer;
  Offset, PatchNo: integer): boolean;
begin
  result := false;

  if VerifyPatchApplicableAtOffset(Source, Offset) = true then //Verify all bytes are there
    if ApplyPatchAtOffset(Dest, Offset) = true then //Try and apply the patch
    begin
      AddOutput(strPatchXApplied1 + inttostr(PatchNo) + strPatchXApplied2, true);
      result := true;
    end
    else
      AddOutput(strErrPatchXNotApplied1  + inttostr(PatchNo) + strErrPatchXNotApplied2, true);
end;

procedure TfrmPatchNoCd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then //Escape key
    Close;
end;

procedure TfrmPatchNoCd.FormShow(Sender: TObject);
var
  ExeFile, MonkeyMapFile, BackupPath: string;
begin
  MemoOutput.Clear;
  AddOutput(strNoCdPatchDisclaimer, true);

  ExeFile := GetEMIPathAndExe;
  if ExeFile = '' then
  begin
    AddOutput(strErrNoMonkey4FromReg);
    exit;
  end;

  MonkeyMapFile := IncludeTrailingPathDelimiter(GetEMIPath) + 'Textures\FullMonkeyMap.imt';
  if FileExists(MonkeyMapFile) = false then
  begin
    AddOutput(strErrNoMonkeyMapWithPath);
    exit;
  end;

  //Sometimes the files are read only after install from cd
  RemoveReadOnlyFileAttribute(ExeFile);
  RemoveReadOnlyFileAttribute(MonkeyMapFile);

  //First make the Backup folder if necessary
  BackupPath := IncludeTrailingPathDelimiter(GetEMIPath) + 'Backup\';
  if DirectoryExists(BackupPath) = false then
    if CreateDir(BackupPath) = false then
    begin
      AddOutput(strErrCreateBackupFolder);
      exit;
    end;

  //Now make backups of the 2 files
  try
    TFile.Copy(MonkeyMapFile, BackupPath + 'FullMonkeyMap.imt', true);
    TFile.Copy(ExeFile, BackupPath + 'Monkey4.exe', true);
  except
    AddOutput(strErrFileBackupProblem);
    exit;
  end;


  //Patch MonkeyMap file first
  if ApplyMonkeyMapPatch(MonkeyMapFile) = false then
  begin
    AddOutput(strErrWholePatchFailed);
    regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'hdrun', 0);

    //Failed - sp copy the original file back
    TFile.Copy(BackupPath + 'FullMonkeyMap.imt', MonkeyMapFile, true);
    AddOutput(strRestoredOrigFiles);
  end;

  //Then patch Monkey4.exe
  if ApplyNoCdPatch(ExeFile) = false then
  begin
    AddOutput(strErrWholePatchFailed);
    regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'hdrun', 0);

    //Failed - sp copy the original files back
    TFile.Copy(BackupPath + 'FullMonkeyMap.imt', MonkeyMapFile, true);
    TFile.Copy(BackupPath + 'Monkey4.exe', ExeFile, true);
    AddOutput(strRestoredOrigFiles);
  end
  else
  begin
    AddOutput(strWholePatchSuccessful);

    regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'hdrun', 1);
  end;
end;

end.
