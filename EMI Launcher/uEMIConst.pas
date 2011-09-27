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

unit uEMIConst;

interface

const
{************************************Global************************************}
  strAppVersion:        string = '1.6';
  strAppTitle:          string = 'Escape From Monkey Island Launcher';
  strFileNotFound:      string = 'File not found: ';

{**********************************Main Form***********************************}
  strOriginalRes:       string = 'Resolution: Original (640x480)';
  strPatchedRes:        string = 'Resolution: Patched (Higher Resolution)';
  strRegKeysNotFound:   string = 'Escape From Monkey Island registry keys not found!'
                                + #13 +
                                'The launcher will not function correctly without these registry keys.'
                                + #13 + #13 +
                                'The easiest way to fix this is to re-install the game.';
  strLecReadmeNotFound: string = 'Lucasarts readme file not found!';
  strWindowedPatchedResWarning:
                        string =
                                 'Windowed mode does not work correctly with higher resolutions.'
                                 + #13 +
                                 'Change the resolution back to the default (640x480) to use windowed mode.';

{*********************************Options Form*********************************}
  strErrNoNetConnection:   string = 'No active internet connection found';
  strErrDownload:     string = 'Error while downloading ';


{********************************Change Res Form*******************************}
  strPatchDisclaimer1:      string = 'READ THIS:';
  strPatchDisclaimer2:      string = 'There are known issues with this patch:';
  strPatchDisclaimer3:      string = '1) Cutscenes display in a 640x480 window and do';
  strPatchDisclaimer4:      string = '    not fill the screen.';
  strPatchDisclaimer5:      string = '2) There may be screen artifacts such as tearing.';
  strPatchDisclaimer6:      string = '3) Saved games made in higher resolutions are not';
  strPatchDisclaimer7:      string = '    always compatible with each other. They will';
  strPatchDisclaimer8:      string = '    usually work but may have visual glitches.';
  strRestoreDefaultRes:     string = 'Restoring resolution to default...';
  strRestoreDefaultResDone: string = '...Done! Resolution is now 640x480';
  strTargetResIs:           string = 'Target resolution is ';
  strErrMonkey4Open:        string = 'Monkey4.exe could not be opened!';
  strErrCreatePatchedExe:   string = 'Could not create new file PatchedMonkey4.exe!';
  strErrPatch1NotFound:     string = 'ERROR: Patch 1 not found!';
  strErrPatch2NotFound:     string = 'ERROR: Patch 2 not found!';
  strErrPatch3NotFound:     string = 'ERROR: Patch 3 not found!';
  strErrPatch4NotFound:     string = 'ERROR: Patch 4 not found!';
  strResPatchSuccessful:    string = 'All patches successfully applied!';
  strNewResIs:              string = 'New resolution is ';
  strErrFinishedPatching:   string = 'Finished...there was an error!';
  strOriginalResRestored:   string = 'Original resolution (640x480) restored';
  strSearchForPatchLoc:     string = 'Searching for locations to patch...';
  strFoundPatch1At:         string = 'Found patch 1 at offset ';
  strFoundPatch2At:         string = 'Found patch 2 at offset ';
  strFoundPatch3At:         string = 'Found patch 3 at offset ';
  strFoundPatch4At:         string = 'Found patch 4 at offset ';
  strApplyPatch1:           string = 'Applying Patch 1...';
  strApplyPatch1Done:       string = '...Patch 1 applied!';
  strApplyPatch2:           string = 'Applying Patch 2...';
  strApplyPatch2Done:       string = '...Patch 2 applied!';
  strApplyPatch3:           string = 'Applying Patch 3...';
  strApplyPatch3Done:       string = '...Patch 3 applied!';
  strApplyPatch4:           string = 'Applying Patch 4...';
  strApplyPatch4Done:       string = '...Patch 4 applied!';
implementation

end.
