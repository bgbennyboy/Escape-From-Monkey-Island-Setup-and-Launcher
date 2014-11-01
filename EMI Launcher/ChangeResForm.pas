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

//Lots here could do with being rewritten. Eg functions returning success rather than global PatchApplied variables.
//But it works, so leaving it for now.

unit ChangeResForm;

interface

uses
  Windows, Forms, Messages, SysUtils, TaskDialog, ImgList, Controls,
  AdvGlowButton, StdCtrls, Classes, ComCtrls, JCLRegistry, uEMIUtils, uEMIConst;

type
  TfrmChangeRes = class(TForm)
    comboboxRes: TComboBoxEx;
    btnChange: TAdvGlowButton;
    dlg640x480: TAdvTaskDialog;
    ImageList1: TImageList;
    editResWidth: TEdit;
    editResHeight: TEdit;
    memoOutput: TMemo;
    procedure btnChangeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure comboboxResChange(Sender: TObject);
    procedure editResWidthChange(Sender: TObject);
    procedure editResHeightChange(Sender: TObject);
  private
    { Private declarations }
    XRes, YRes: integer;
    SourceFile, NewFile: TFileStream;
    MemFile: TMemoryStream;
    PatchError, Patch1Applied, Patch2Applied, Patch3Applied, Patch4Applied: boolean;
    procedure AddOutput(Instring: string; Newline: boolean = false);
    procedure ApplyResPatches;
    procedure FindPatch1And2;
    procedure FindPatch3;
    procedure FindPatch4;
    procedure WritePatch1(Offset: integer);
    procedure WritePatch2(Offset: integer);
    procedure WritePatch3(Offset: integer);
    procedure WritePatch4(Offset: integer);
    function ReadMemStreamByte: byte; inline;
    function PatchBinkFiles(Unpatch: boolean = false): boolean;
    function FindFileHeader(SearchStream: TStream; StartSearchAt, EndSearchAt: Integer; Header: string): integer;
  public
    { Public declarations }
  end;

var
  frmChangeRes: TfrmChangeRes;

const
  TPatch1Array: array[0..18] of integer = (199,68,36,-1,128,2,0,0,199,132,36,-1,0,0,0,224,1,0,0);
  TPatch2Array: array[0..15] of integer = (199,68,36,-1,128,2,0,0,199,68,36,-1,224,1,0,0);
  TPatch3Array: array[0..9]  of integer = (104,128,0,0,0,104,0,1,0,0);
  TPatch4Array: array[0..13] of integer = (69, 248, 128, 2, 0, 0, 199, 69, 252, 224, 1, 0, 0, 255);
  xResolutions: array[0..22] of integer = (640, 800, 852, 1024, 1152, 1280, 1280, 1280, 1365, 1400, 1440, 1600, 1600, 1680, 1920, 1920, 2048, 2560, 3200, 3840, 4000, 6400, 7680);
  yResolutions: array[0..22] of integer = (480, 600, 480, 768,  864,  720,  960,  1024, 768,  1050, 900,  900,  1200, 1050, 1080, 1200, 1536, 1600, 2400, 2400, 3000, 4800, 4800);
  BinkFiles:    array[0..23] of string = ('bank.m4b', 'dock.m4b', 'dumm.m4b', 'ela2.m4b', 'ela3.m4b', 'espy.m4b', 'finis.m4b', 'gmrr.m4b', 'herm.m4b', 'home1.m4b', 'home2.m4b', 'intro_a.m4b', 'intro_b.m4b', 'melt.m4b', 'moh_close_hat.m4b', 'moh_close_nohat.m4b', 'moh_open_hat.m4b', 'moh_open_nohat.m4b', 'nose.m4b', 'oznx.m4b', 'rock.m4b', 'rock1B.m4b', 'rock1C.m4b', 'sory.m4b');

implementation

{$R *.dfm}


function TfrmChangeRes.ReadMemStreamByte: byte;
begin
	MemFile.Read(result,1);
end;

//Form show actions
procedure TfrmChangeRes.FormShow(Sender: TObject);
begin
  memoOutput.Clear;
  AddOutput(strPatchDisclaimer1, true);
end;

//File a string header within a file
function TfrmChangeRes.FindFileHeader(SearchStream: TStream;
  StartSearchAt, EndSearchAt: Integer; Header: string): integer;
var
  HeaderLength, Index: integer;
  TempByte: Byte;
begin
  Result:=-1;
  Index:=1;
  if EndSearchAt > SearchStream.Size then
    EndSearchAt:=SearchStream.Size;

  HeaderLength:=Length(Header);
  if HeaderLength <= 0 then exit;


  SearchStream.Position:=StartSearchAt;
  while SearchStream.Position < EndSearchAt do
  begin
    SearchStream.Read(TempByte, 1);
    if Chr(TempByte) <> Header[Index] then
    begin
      if Index > 1 then
        SearchStream.Position := SearchStream.Position  -1;

      Index:=1;
      continue;
    end;

    inc(Index);
    if index > HeaderLength then
    begin
      Result:=SearchStream.Position - HeaderLength;
      exit;
    end;
  end;

end;

//Patch the bink files to enable size doubling
function TfrmChangeRes.PatchBinkFiles(Unpatch: boolean = false): boolean;
var
  BinkFolder: string;
  i, BIKiHeader, PatchedFiles: integer;
  BinkFile: TFileStream;
  TempByte: byte;
begin
  result := false;
  PatchedFiles := 0;
  if Unpatch = true then
    TempByte := 0
  else
    TempByte := 64; //0x40 - enable doubling

  BinkFolder := IncludeTrailingPathDelimiter(getEMIpath) + IncludeTrailingPathDelimiter('Movies');

  //Check all the files are there
  for I := Low(BinkFiles) to High(BinkFiles) do
  begin
    if FileExists(BinkFolder + BinkFiles[i]) = false then
    begin
      AddOutput(strErrNoMovieFile +  BinkFiles[i], true);
      Exit;
    end;
  end;

  //Patch each file
  try
    for I := Low(BinkFiles) to High(BinkFiles) do
    begin
      BinkFile := TFileStream.Create(BinkFolder + BinkFiles[i], fmOpenReadWrite);
      try
        //Find the BIKi header - different place in each file
        BIKiHeader := FindFileHeader(BinkFile, 0, 3000, 'BIKi');
        if BIKiHeader = -1 then
        begin
          AddOutput(strErrNoBikiHeader + BinkFiles[i], true);
          Exit;
        end;

        //Patch it
        BinkFile.Position := BIKiHeader + 39;
        BinkFile.Write(TempByte, 1);
        inc(PatchedFiles);
      finally
        BinkFile.Free;
      end;
    end;
  finally
    if PatchedFiles >= High(BinkFiles) then
    begin
      if Unpatch = true then
        AddOutput(strAllMovieFilesUnPatched, true)
      else
        AddOutput(strAllMovieFilesPatched, true);

      result := true;
    end
    else
      AddOutput(strErrNotAllMoviesPatched, true);
  end;
end;

//Add output
procedure TfrmChangeRes.AddOutput(Instring: string; NewLine: boolean=false);
begin
  memoOutput.Lines.Add(Instring);
  if NewLine=true then
    memoOutput.Lines.Add('');
end;

//Change button click
procedure TfrmChangeRes.btnChangeClick(Sender: TObject);
var
  DialogResult: integer;
begin
  PatchError:=false;
  Patch1Applied:=false;
  Patch2Applied:=false;
  Patch3Applied:=false;
  Patch4Applied:=false;
  memoOutput.Clear;
  AddOutput(strPatchDisclaimer1, true);

  if (xRes = 640) and (yRes = 480) then
  begin
    DialogResult:=dlg640x480.Execute;
    case DialogResult of
      100:  ; //Use patched exe
      101:  begin
              //Just use original exe again
              AddOutput(strRestoreDefaultRes);
              RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'originalexe', 1);
              PatchBinkFiles(true); //unpatch movie files
              AddOutput(strRestoreDefaultResDone);
              exit;
            end;
      else
        exit;
    end;
  end;

  //Movie doubling patch should only apply at 1280x960 and above
  if (xRes <= 1280) and (yRes <= 720) then
  begin
    PatchBinkFiles(true);
  end
  else
  begin
    //Patch the bink movie files
    if PatchBinkFiles = false then
    begin
      AddOutput(strErrPatchingMovieFiles);
      exit;
    end;
  end;

  try
    AddOutput(strTargetResIs + inttostr(xres) + 'x' + inttostr(yres));

    try
      try
        SourceFile:=tfilestream.Create(GetEMIPathAndExe, fmopenread);
      except on e: EfOpenError do
        begin
          PatchError:=true;
          AddOutput(strErrMonkey4Open, true);
        end;
      end;

      try
        Newfile:=tfilestream.Create(getEMIpath + 'PatchedMonkey4.exe', fmCreate);
      except on e: EfCreateError do
        begin
          PatchError:=true;
          AddOutput(strErrCreatePatchedExe, true);
        end;
      end;

      NewFile.CopyFrom(SourceFile, SourceFile.Size);
      ApplyResPatches;
      if Patch1Applied=false then
      begin
        PatchError:=true;
        AddOutput(strErrPatch1NotFound);
      end;
      if Patch2Applied=false then
      begin
        PatchError:=true;
        AddOutput(strErrPatch2NotFound);
      end;
      if Patch3Applied=false then
      begin
        PatchError:=true;
        AddOutput(strErrPatch3NotFound);
      end;
      if Patch4Applied=false then
      begin
        PatchError:=true;
        AddOutput(strErrPatch4NotFound);
      end;

    finally
      SourceFile.Free;
      newfile.Free;
    end;

  finally
    if Patcherror=false then
    begin
      AddOutput(strResPatchSuccessful);
      AddOutput(strNewResIs + inttostr(xres) + 'x' + inttostr(yres));
      regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'originalexe', 0);
    end
    else
    begin
      AddOutput(strErrFinishedPatching);
      regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'originalexe', 1);
      AddOutput(strOriginalResRestored);
    end; //TODO: Possible bug here
  end;   //      What if the patching fails, it reverts to using the original exe, but
end;     //      the user has saved games made in a higher resolution - the game would crash on
         //      the save/load screen.
         //      If they have the saved games in a higher res though, they must have/had the res patch working
         //      though - so this situation is unlikely to arise.


//Form create actions
procedure TfrmChangeRes.FormCreate(Sender: TObject);
begin
  comboboxRes.ItemIndex:=0;
  XRes := xResolutions[comboboxRes.ItemIndex];
  YRes := yResolutions[comboboxRes.ItemIndex];

  editResWidth.Text := inttostr(XRes);
  editResHeight.Text := inttostr(YRes);
end;

procedure TfrmChangeRes.comboboxResChange(Sender: TObject);
begin
  if comboBoxRes.ItemIndex > High(xResolutions) then exit;

  editResWidth.Text := inttostr(xResolutions[comboboxRes.ItemIndex]);
  editResHeight.Text := inttostr(yResolutions[comboboxRes.ItemIndex]);
end;


procedure TfrmChangeRes.editResHeightChange(Sender: TObject);
begin
  YRes := strtoint(editResHeight.Text);
end;

procedure TfrmChangeRes.editResWidthChange(Sender: TObject);
begin
  XRes := strtoint(editResWidth.Text);
end;

{This is how the searches work:
Every byte in the file is read and tested to see if it matches the first byte of a patch
If one does match then it seeks forward and sees if the last byte of the patch is also the same
If the first and last byte are there then there's a decent chance that its going to be the correct sequence
It then examines the bytes inbetween, if they all match then this is the correct place to apply the patch}

{Rather than hardcoding the offsets for the res patch i've made it scan for the 4 'mini-patches' that need to be changed.
This *should* mean that the patch will work for patched/unpatched/non-english versions}
procedure TfrmChangeRes.ApplyResPatches;
var
  FirstByte: byte;
begin
  AddOutput(strSearchForPatchLoc, true);
  SourceFile.Position:=0;
  MemFile:=TMemoryStream.Create;
  MemFile.CopyFrom(SourceFile, SourceFile.Size); //Load the whole file into memory stream - its much faster to search than a filestream
  MemFile.Position:=0;

  try
    while MemFile.Position < MemFile.Size do
    begin
      FirstByte:=ReadMemStreamByte;
      if FirstByte=TPatch1Array[low(TPatch1Array)] then
        FindPatch1And2 //Patches 1 and 2 both begin with the same byte

      else //Patch 3
      if FirstByte=TPatch3Array[low(TPatch3Array)] then
        FindPatch3

      else //Patch 4
      if FirstByte=TPatch4Array[low(TPatch4Array)] then
        FindPatch4;
    end;
    
  finally
    MemFile.Free;
  end;
end;

procedure TfrmChangeRes.FindPatch1And2;
var
  I, PatchPosition, OriginalPosition: Integer;
  FirstByte: byte;
begin
  //Record the position to revert back to if any bytes arent found anywhere
  OriginalPosition:=memfile.Position;

  //FIRST we see if its patch 2
  //Seek to the penultimate byte of patch 2
  MemFile.Seek(High(TPatch2Array) - 1, SoFromCurrent);
  //see if the last byte matches
  FirstByte:=ReadMemStreamByte;

  if FirstByte = TPatch2Array[High(TPatch2Array)] then //it matches patch 2
  begin
    MemFile.Seek(-High(TPatch2Array), SoFromCurrent); //seek to the second byte in the sequence
    OriginalPosition := MemFile.Position; //This is where we need to search from next if this turns out not to be the correct place in the file - it'll return to this point and continue searching
    //Now see if all the other bytes match
    for I := 1 to High(TPatch2Array) - 1 do
    begin
      if TPatch2Array[i] = -1 then
      begin
        //-1 means that this byte could be anything, so seek past it, in the patcharray -1 is a wildcard
        MemFile.Seek(1, SoFromCurrent);
        Continue;
      end
      else if ReadMemStreamByte = TPatch2Array[i] then //the byte matches the one from the array
      begin
        if i = High(TPatch2Array) - 1 then //All the bytes matched
        begin
          PatchPosition := OriginalPosition - 1;
          AddOutput(strFoundPatch2At + IntToStr(PatchPosition));
          WritePatch2(PatchPosition); //Write the patch to the file
          Patch2Applied:=true;
        end;
      end
      else //the byte differed
      begin
        MemFile.Position := OriginalPosition; // Move back to where it was searching
        break; //break the loop
      end;
    end;
  end

  //If its not patch 2 then perhaps its patch 1
  else if FirstByte=TPatch1Array[15] then //the 16th byte differs between the patches, so if its this then its patch 1 not patch 2
  begin
    //Seek to the penultimate byte of patch 1
    MemFile.Seek(OriginalPosition + High(TPatch1Array) - 1, SoFromBeginning);
    if ReadMemStreamByte = TPatch1Array[High(TPatch1Array)] then //it matches patch 1
    begin
      MemFile.Seek(-High(TPatch1Array), SoFromCurrent); //seek to the second byte in the sequence
      OriginalPosition := MemFile.Position; //This is where we need to search from next if this turns out not to be the correct place in the file - it'll return to this point and continue searching
      //Now see if all the other bytes match
      for I := 1 to High(TPatch1Array) - 1 do
      begin
        if TPatch1Array[i] = -1 then
        begin
          //-1 means that this byte could be anything, so seek past it, in the patcharray -1 is a wildcard
          MemFile.Seek(1, SoFromCurrent);
          Continue;
        end
        else if ReadMemStreamByte = TPatch1Array[i] then //the byte matches the one from the array
        begin
          if i = High(TPatch1Array) - 1 then //All the bytes matched
          begin
            PatchPosition := OriginalPosition - 1;
            AddOutput(strFoundPatch1At + IntToStr(PatchPosition));
            WritePatch1(PatchPosition); //Write the patch to the file
            Patch1Applied:=true;
          end;
        end
        else //the byte differed
        begin
          MemFile.Position := OriginalPosition; // Move back to where it was searching
          break; //break the loop
        end;
      end;
    end;
  end

  else  //Its neither - seek back to the original position and cleanup
  begin
    MemFile.Position := OriginalPosition;
  end;

end;

procedure TfrmChangeRes.FindPatch3;
var
  i, OriginalPosition, PatchPosition: Integer;
begin
  MemFile.Seek(High(TPatch3Array) - 1, SoFromCurrent); //Seek to the penultimate byte
  //see if the last byte matches
  if ReadMemStreamByte <> TPatch3Array[High(TPatch3Array)] then //the last byte wasnt the same, so go back to the beginning and carry on searching
    MemFile.Seek(-High(TPatch3Array), SoFromCurrent)
  else  //It does match
  begin
    MemFile.Seek(-High(TPatch3Array), SoFromCurrent); //seek to the second byte in the sequence
    OriginalPosition := MemFile.Position; //This is where we need to search from next if this turns out not to be the correct place in the file - it'll return to this point and continue searching
    //Now see if all the other bytes match
    for i := 1 to High(TPatch3Array) - 1 do //bytes 1..17
    begin
      if TPatch3Array[i] = -1 then
      begin
        //-1 means that this byte could be anything, so seek past it, in the patcharray -1 is a wildcard
        MemFile.Seek(1, SoFromCurrent);
        Continue;
      end
      else if ReadMemStreamByte = TPatch3Array[i] then //the byte matches the one from the array
      begin
        if i = High(TPatch3Array) - 1 then //All the bytes matched
        begin
          PatchPosition := OriginalPosition - 1;
          AddOutput(strFoundPatch3At + IntToStr(PatchPosition));
          WritePatch3(PatchPosition); //Write the patch to the file
          Patch3Applied:=true;
        end;
      end
      else //the byte differed
      begin
        MemFile.Position := OriginalPosition; // Move back to where it was searching
        break; //break the loop
      end;
    end;
  end;
end;

procedure TfrmChangeRes.FindPatch4;
var
  i, OriginalPosition, PatchPosition: Integer;
begin
  MemFile.Seek(High(TPatch4Array) - 1, SoFromCurrent); //Seek to the penultimate byte
  //see if the last byte matches
  if ReadMemStreamByte <> TPatch4Array[High(TPatch4Array)] then //the last byte wasnt the same, so go back to the beginning and carry on searching
    MemFile.Seek(-High(TPatch4Array), SoFromCurrent)
  else  //It does match
  begin
    MemFile.Seek(-High(TPatch4Array), SoFromCurrent); //seek to the second byte in the sequence
    OriginalPosition := MemFile.Position; //This is where we need to search from next if this turns out not to be the correct place in the file - it'll return to this point and continue searching
    //Now see if all the other bytes match
    for i := 1 to High(TPatch4Array) - 1 do //bytes 1..17
    begin
      if TPatch4Array[i] = -1 then
      begin
        //-1 means that this byte could be anything, so seek past it, in the patcharray -1 is a wildcard
        MemFile.Seek(1, SoFromCurrent);
        Continue;
      end
      else if ReadMemStreamByte = TPatch4Array[i] then //the byte matches the one from the array
      begin
        if i = High(TPatch4Array) - 1 then //All the bytes matched
        begin
          PatchPosition := OriginalPosition - 1;
          AddOutput(strFoundPatch4At + IntToStr(PatchPosition));
          WritePatch4(PatchPosition); //Write the patch to the file
          Patch4Applied:=true;
        end;
      end
      else //the byte differed
      begin
        MemFile.Position := OriginalPosition; // Move back to where it was searching
        break; //break the loop
      end;
    end;
  end;
end;


//Write patch 1 to file
procedure TfrmChangeRes.WritePatch1(Offset: integer);
var
  tempdword: dword;
begin
  AddOutput(strApplyPatch1);
  newfile.Seek(Offset, sofrombeginning);
  newfile.Seek(4, sofromcurrent);
  tempdword:=xres;
  newfile.Write(tempdword, 4);
  newfile.Seek(7, sofromcurrent);
  tempdword:=yres;
  newfile.Write(tempdword, 4);

  AddOutput(strApplyPatch1Done, true);
end;

//Write patch 2 to file
procedure TfrmChangeRes.WritePatch2(Offset: integer);
var
  tempdword: dword;
begin
  AddOutput(strApplyPatch2);
  newfile.Seek(Offset, sofrombeginning);
  newfile.Seek(4, sofromcurrent);
  tempdword:=xres;
  newfile.Write(tempdword, 4);
  newfile.Seek(4, sofromcurrent);
  tempdword:=yres;
  newfile.Write(tempdword, 4);

  AddOutput(strApplyPatch2Done, true);
end;

//Write patch 3 to file
procedure TfrmChangeRes.WritePatch3(Offset: integer);
var
  tempbyte: byte;
begin
  AddOutput(strApplyPatch3);
  newfile.Seek(Offset, sofrombeginning);
  newfile.Seek(1, sofromcurrent);
  tempbyte:=0;
  newfile.Write(tempbyte, 1);
  tempbyte:=1;
  newfile.Write(tempbyte, 1);
  newfile.Seek(4, sofromcurrent);
  tempbyte:=2;
  newfile.Write(tempbyte, 1);

  AddOutput(strApplyPatch3Done, true);
end;

//Write patch 4 to file
//Patch 4fixes windowed mode so it works when the res is changed
procedure TfrmChangeRes.WritePatch4(Offset: integer);
var
  tempdword: dword;
begin
  AddOutput(strApplyPatch4);
  newfile.Seek(Offset, sofrombeginning);
  newfile.Seek(2, sofromcurrent);
  tempdword:=xres;
  newfile.Write(tempdword, 4);
  newfile.Seek(3, sofromcurrent);
  tempdword:=yres;
  newfile.Write(tempdword, 4);

  AddOutput(strApplyPatch4Done, true);
end;

end.
