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

unit uEMIUtils;

interface

function GetEMIPath: string;
function GetEMIPathAndExe: string;
function GetEMIExe: string;
function GetCloseOnRun: boolean;
function GetUseOriginalExe: boolean;
function GetOpenGL: boolean;
function Get16BitColourDepth: boolean;
function CreateDefaultRegKeys : string;

implementation

uses
  jclregistry, jclstrings, windows;

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

end.
