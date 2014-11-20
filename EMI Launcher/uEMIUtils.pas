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

unit uEMIUtils;

interface

function GetEMIPath: string;
function GetEMIPathAndExe: string;
function GetEMIExe: string;
function GetCloseOnRun: boolean;
function GetUseOriginalExe: boolean;
function GetOpenGL: boolean;
function Get16BitColourDepth: boolean;
function GetHdRun: boolean;
function GetLauncherSounds: boolean;
function CreateDefaultRegKeys : string;
function GetPatchedResolution: string;
function IsMonkey4ExeUpdated: boolean;
procedure RemoveReadOnlyFileAttribute(FileName: string);

implementation

uses
  jclregistry, jclstrings, windows, sysutils, classes;

//Read Path to EMI from Registry
function GetEMIPath: string;
begin
  try
    result:=Strbefore('MONKEY4.EXE',regreadstring(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail','executable'));
  Except On EJclRegistryError do
    result:='';
  end;
end;

//Read Path to EMI Executable from Registry
function GetEMIPathAndExe: string;
begin
  try
    result:=regreadstring(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail','executable');
  Except On EJclRegistryError do
    result:='';
  end;
end;

//Get .exe file name
function GetEMIExe: string;
begin
  if regreadinteger(HKEY_CURRENT_USER,'Software\Quick And Easy\EMI Launcher','originalexe')=1 then
    result:='Monkey4.exe'
  else
    result:='PatchedMonkey4.exe';
end;

//Get if launcher should close on run
function GetCloseOnRun: boolean;
begin
  if regreadinteger(HKEY_CURRENT_USER,'Software\Quick And Easy\EMI Launcher','closeonrun')=1 then
    result:=true
  else
    result:=false;
end;

function GetHdRun: boolean;
begin
  if regreadinteger(HKEY_CURRENT_USER,'Software\Quick And Easy\EMI Launcher','hdrun')=1 then
    result:=true
  else
    result:=false;
end;

function GetLauncherSounds: boolean;
begin
  if regreadinteger(HKEY_CURRENT_USER,'Software\Quick And Easy\EMI Launcher','launchersounds')=1 then
    result:=true
  else
    result:=false;
end;

//Check if using original exe or not
function GetUseOriginalExe: boolean;
begin
  if regreadinteger(HKEY_CURRENT_USER,'Software\Quick And Easy\EMI Launcher','originalexe')=1 then
    result:=true
  else
    result:=false;
end;

//Get if using OpenGl - if not then its Direct3D
function GetOpenGL: boolean;
begin
  if regreadinteger(HKEY_LOCAL_MACHINE,'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail', 'OpenGL')=1 then
    result:=true
  else
    result:=false;
end;

//Get colour depth - if false its 32 bit
function Get16BitColourDepth: boolean;
begin
  if regreadinteger(HKEY_LOCAL_MACHINE,'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail', 'ForceColor')=1 then
    result:=true
  else
    result:=false;
end;

//Create Default Reg Keys
function CreateDefaultRegKeys : string;
begin
  jclregistry.regcreatekey(HKEY_CURRENT_USER,'Software\Quick And Easy\EMI Launcher','0');

  try
    regreadinteger(HKEY_CURRENT_USER,'Software\Quick And Easy\EMI Launcher','closeonrun')

    Except On EJclRegistryError do
      regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'closeonrun', 0);
  end;

  try
    regreadinteger(HKEY_CURRENT_USER,'Software\Quick And Easy\EMI Launcher','originalexe')

    Except On EJclRegistryError do
      regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'originalexe', 1);
  end;

  try
    regreadinteger(HKEY_CURRENT_USER,'Software\Quick And Easy\EMI Launcher','hdrun')

    Except On EJclRegistryError do
      regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'hdrun', 0);
  end;

  try
    regreadinteger(HKEY_CURRENT_USER,'Software\Quick And Easy\EMI Launcher','launchersounds')

    Except On EJclRegistryError do
      regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\EMI Launcher', 'launchersounds', 1);
  end;

  //This should always be here as its created by the installer but just in case...
  try
    regreadinteger(HKEY_LOCAL_MACHINE,'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail', 'OpenGL')

    Except On EJclRegistryError do
      regwriteinteger(HKEY_LOCAL_MACHINE,'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail', 'OpenGL', 0);
  end;

  //This should always be here as its created by the installer but just in case...
  try
    regreadinteger(HKEY_LOCAL_MACHINE,'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail', 'ForceColor')

    Except On EJclRegistryError do
      regwriteinteger(HKEY_LOCAL_MACHINE,'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail', 'ForceColor', 0);
  end;
end;

//Read Cd Drive key from registry
{function GetCdPath: string;
begin
  try
    Result:=regreadstring(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company LLC\Monkey4\Retail','source path');
  Except On EJclRegistryError do

  end;
end;}

procedure RemoveReadOnlyFileAttribute(FileName: string);
var
  Attributes: cardinal;
begin
  if FileName = '' then exit;

  Attributes:=FileGetAttr(FileName);
  if Attributes = INVALID_FILE_ATTRIBUTES then exit;

  if Attributes and faReadOnly = faReadOnly then
    FileSetAttr(FileName, Attributes xor faReadOnly);
end;

function GetPatchedResolution: string;
var
  TheFile: TFileStream;
  TempDWord: DWord;
begin
  Result := '';
  try
  TheFile := TFileStream.Create(getEMIpath + GetEMIexe, fmOpenRead);
  try
    if TheFile.Size < 232800 then exit;

    TheFile.Position := 232785;
    TheFile.Read(TempDWord, 4);
    Result := inttostr(TempDWord);
    TheFile.Seek(7, soFromCurrent);
    TheFile.Read(TempDWord, 4);
    Result := Result + 'x' + inttostr(TempDWord);
  finally
    TheFile.Free;
  end;
  except

  end;
end;


//File a string header within a file
function FindFileHeader(SearchStream: TStream;
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

function IsMonkey4ExeUpdated: boolean;
{
  No version information in Monkey4.exe so we need to find it by other methods
  MD5 is no good because we need to support different language versions and
  resolution and nocd patches. Best way is to see if it contains the string
  'D:\MilesUpgradeCode' - that seems to be only in patched versions.
}
var
  TheFile: TFileStream;
  HeaderPos: integer;
begin
  result := false;

  try
    TheFile := TFileStream.Create(getEMIpath + 'Monkey4.exe', fmOpenRead);
    try
      if TheFile.Size < 870000 then exit;

      HeaderPos := FindFileHeader(TheFile, 784419, TheFile.Size, 'D:\MilesUpgradeCode');
      if HeaderPos > -1 then //Found it
        result := true;
    finally
      TheFile.Free;
    end;
  except

  end;
end;

end.
