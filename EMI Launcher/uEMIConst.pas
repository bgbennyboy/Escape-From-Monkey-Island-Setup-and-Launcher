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

unit uEMIConst;

interface

const
{************************************Global************************************}
  strAppVersion:        string = '1.8';
  strAppTitle:          string = 'Escape From Monkey Island Launcher';
  strFileNotFound:      string = 'File not found: ';

{**********************************Main Form***********************************}
  strOriginalRes:           string = 'Resolution: Original (640x480)';
  strPatchedRes:            string = 'Resolution: Patched (Higher Resolution)';
  strRegKeysNotFound:       string = 'Escape From Monkey Island registry keys not found!'
                                      + #13 +
                                      'The launcher will not function correctly without these registry keys.'
                                      + #13 + #13 +
                                      'The easiest way to fix this is to re-install the game.';
  strLecReadmeNotFound:     string = 'Lucasarts readme file not found!';
  strWindowedPatchedResWarning:
                            string =
                                     'Windowed mode does not work correctly with higher resolutions.'
                                     + #13 +
                                     'Change the resolution back to the default (640x480) to use windowed mode.';

  strPatchedExeNotFound:    string = 'PatchedMonkey4.exe has been deleted.' + sLineBreak + sLineBreak + 'You need to run the resolution patch again.';
  strStatusBarError:        string = 'ERROR - run the resolution patch again';
  strPromptUpdateGame:      string = 'You do not have the latest Escape From Monkey Island patch installed.'
                                      + #13#13 + 'Click options and choose ''Upgrade game to version 1.1'' to install it';

{*********************************Options Form*********************************}
  strErrNoNetConnection:    string = 'No active internet connection found';
  strErrDownload:           string = 'Error while downloading ';
  strErrMissingBackupFolder:string = 'Couldn''t find files in backup folder to restore!' + sLineBreak + sLineBreak + 'Backups of Monkey4.exe and FullMonkeyMap.int have NOT been restored';
  strErrRestoreFilesPart1:  string = 'There was a problem restoring the files' + sLineBreak + sLineBreak + 'Error message was: ';
  strErrRestoreFilesPart2:  string = 'Backups of Monkey4.exe and FullMonkeyMap.int have NOT been restored';
  strCdPatchRemoved:        string = 'Cd patch removed, original files have been restored.' + sLineBreak + sLineBreak + 'If you used this launcher to change the resolution then you MUST go and change it again now.';
  strItalianVersionWarn:    string = 'It looks like you have the Italian version of the game.' + sLineBreak + sLineBreak + 'The no cd patch will NOT work with your version. Sorry!';

{********************************No Cd Form*******************************}
  strErrNoMonkeyMapFile:    string = 'Couldnt find FullMonkeyMap.imt !';
  strErrNoMonkey4File:      string = 'Couldnt find Monkey4.exe !';
  strErrPatchesApplied1:    string = 'Something went wrong! Only ';
  strErrPatchesApplied2:    string = '/4 patches were applied!';
  strPatchXApplied1:        string = 'Patch ';
  strPatchXApplied2:        string = ' of 4 applied successfully!';
  strErrPatchXNotApplied1:  string = 'ERROR Patch ';
  strErrPatchXNotApplied2:  string = ' of 4 wasnt applied!';
  strErrNoMonkey4FromReg:   string = 'Couldnt find Monkey4.exe using registry!';
  strErrNoMonkeyMapWithPath:string = 'Couldnt find Textures\FullMonkeyMap.imt';
  strErrCreateBackupFolder: string = 'Couldn''t make backup folder!';
  strErrFileBackupProblem:  string = 'There was a problem backing up the files';
  strErrWholePatchFailed:   string = 'Patch FAILED. The messages above should explain why.';
  strRestoredOrigFiles:     string = 'Restored original files';
  strWholePatchSuccessful:  string = 'Patch successful! You can now play the game without the cds in the drive.' +
                                      sLineBreak + sLineBreak + '***********************************************'  + sLineBreak +
                                      'If you used this launcher to change the resolution then you MUST go and change it again now' + sLineBreak +
                                      '***********************************************' + sLineBreak + sLineBreak +
                                      'If the game crashes then in this launcher - go to "Change resolution" and choose "Default 640 x 480".';

{********************************Change Res Form*******************************}
  strPatchDisclaimer1:      string = 'READ THIS. There are known problems with this patch:' + sLineBreak  + sLineBreak +
                                     '1) Cutscenes may not fill the whole screen. The patch makes the videos double in size at resolutions of 1280x960 and above. But if you choose a resolution other than 640x480 or 1280x960 the videos will not fill the whole screen.' + sLineBreak  + sLineBreak +
                                     '2) There may be some visual glitches like tearing.' + sLineBreak  + sLineBreak +
                                     '3) Playing in a window wont work with some resolutions. Fullscreen will still work though.' + sLineBreak  + sLineBreak +
                                     '4) Saved games made in higher resolutions are not always compatible with each other. They will usually work but there may be visual glitches if you load a saved game that you made in a different resolution.'  + sLineBreak  + sLineBreak +
                                     'If you have problems then choose "640 x 480 (default) to restore the game to its original resolution.';
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
  strNoCdPatchDisclaimer:   string = 'This patch will only work with version 1.1 of the game. So if it doesnt work, go back to the options menu and click "Update game to version 1.1"';
  strErrNoBikiHeader:       string = 'Couldn''t find BIKi header in: ';
  strErrNoMovieFile:        string = 'Couldnt find movie file: ';
  strAllMovieFilesUnPatched:string = 'All movie files unpatched and restored.';
  strAllMovieFilesPatched:  string = 'All movie files patched.';
  strErrNotAllMoviesPatched:string = 'Error - not all movie files were patched.';
  strErrPatchingMovieFiles: string = 'Error - patching the movie files';
  strMonkeyMapPatch:        string =  '/*' + slineBreak +
                                      '.cueButton id 66 x 320 y 248 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\4120.m4b"' + slineBreak +
                                      '.cueButton id 67 x 232 y 188 sync 1 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3102.m4b"' + slineBreak +
                                      '.cueButton id 68 x 287 y 283 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\4115.m4b"' + slineBreak +
                                      '.cueButton id 69 x 130 y 273 sync 2 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\4100.m4b"' + slineBreak +
                                      '.cueButton id 70 x 526 y 223 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3150.m4b"' + slineBreak +
                                      '.cueButton id 71 x 414 y 225 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3145.m4b"' + slineBreak +
                                      '.cueButton id 72 x 197 y 227 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\4110.m4b"' + slineBreak +
                                      '.cueButton id 73 x 64 y 193 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3140.m4b"' + slineBreak +
                                      '.cueButton id 74 x 622 y 80 sync 3 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3135.m4b"' + slineBreak +
                                      '.cueButton id 75 x 586 y 30 sync 3 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3120.m4b"' + slineBreak +
                                      '.cueButton id 76 x 461 y 121 sync 4 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3130.m4b"' + slineBreak +
                                      '.cueButton id 77 x 436 y 71 sync 4 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3115.m4b"' + slineBreak +
                                      '.cueButton id 78 x 244 y 121 sync 1 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3100.m4b"' + slineBreak +
                                      '.cueButton id 79 x 89 y 111 sync 5 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3125.m4b"' + slineBreak +
                                      '.cueButton id 80 x 92 y 79 sync 5 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3110.m4b"' + slineBreak +
                                      '.cueButton id 81 x 289 y 17 sync 6 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3105.m4b"' + slineBreak +
                                      '.cueButton id 82 x 185 y 164 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "C\3210.m4b"' + slineBreak +
                                      '.cueButton id 83 x 380 y 261 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "C\3200.m4b"' + slineBreak +
                                      '.cueButton id 84 x 469 y 260 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "C\3205.m4b"' + slineBreak +
                                      '.cueButton id 85 x 405 y 304 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3147.m4b"' + slineBreak +
                                      '.cueButton id 86 x 275 y 216 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "C\4215.m4b"' + slineBreak +
                                      '.cueButton id 87 x 55 y 241 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\4105.m4b"' + slineBreak +
                                      '.cueButton id 88 x 325 y 65 sync 6 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3106.m4b"' + slineBreak +
                                      '.cueButton id 89 x 203 y 77 sync 6 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\3107.m4b"' + slineBreak +
                                      '.cueButton id 90 x 68 y 309 sync 2 type state   ""' + slineBreak +
                                      '.playFile trim 127 "C\4106.m4b"' + slineBreak +
                                      '*/' + slineBreak +
                                      '' + slineBreak +
                                      '/*' + slineBreak +
                                      '.cueButton id 91 x 58 y 91 sync 1 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5145.m4b"' + slineBreak +
                                      '.cueButton id 92 x 401 y 235 sync 2 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5142.m4b"' + slineBreak +
                                      '.cueButton id 93 x 359 y 204 sync 2 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5141.m4b"' + slineBreak +
                                      '.cueButton id 94 x 583 y 341 sync 3 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5138.m4b"' + slineBreak +
                                      '.cueButton id 95 x 394 y 343 sync 3 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5137.m4b"' + slineBreak +
                                      '.cueButton id 96 x 500 y 291 sync 3 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5136.m4b"' + slineBreak +
                                      '.cueButton id 97 x 671 y 252 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5170.m4b"' + slineBreak +
                                      '.cueButton id 98 x 207 y 232 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "D\5205.m4b"' + slineBreak +
                                      '.cueButton id 99 x 50 y 229 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5120.m4b"' + slineBreak +
                                      '.cueButton id 100 x 317 y 71 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "D\5215.m4b"' + slineBreak +
                                      '.cueButton id 101 x 497 y 73 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "D\5230.m4b"' + slineBreak +
                                      '.cueButton id 102 x 409 y 109 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "D\5225.m4b"' + slineBreak +
                                      '.cueButton id 103 x 406 y 47 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5117.m4b"' + slineBreak +
                                      '.cueButton id 104 x 92 y 123 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5115.m4b"' + slineBreak +
                                      '.cueButton id 105 x 117 y 32 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "D\5220.m4b"' + slineBreak +
                                      '.cueButton id 106 x 728 y 137 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\6105.m4b"' + slineBreak +
                                      '.cueButton id 107 x 730 y 89 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\6100.m4b"' + slineBreak +
                                      '.cueButton id 108 x 544 y 250 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5165.m4b"' + slineBreak +
                                      '.cueButton id 109 x 586 y 196 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5160.m4b"' + slineBreak +
                                      '.cueButton id 110 x 475 y 230 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "D\5200.m4b"' + slineBreak +
                                      '.cueButton id 111 x 450 y 199 sync 2 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5140.m4b"' + slineBreak +
                                      '.cueButton id 112 x 377 y 306 sync 3 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5135.m4b"' + slineBreak +
                                      '.cueButton id 113 x 273 y 295 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5155.m4b"' + slineBreak +
                                      '.cueButton id 114 x 321 y 249 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5150.m4b"' + slineBreak +
                                      '.cueButton id 115 x 227 y 199 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5130.m4b"' + slineBreak +
                                      '.cueButton id 116 x 140 y 232 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5125.m4b"' + slineBreak +
                                      '.cueButton id 117 x 96 y 184 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5110.m4b"' + slineBreak +
                                      '.cueButton id 118 x 144 y 72 sync 1 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5105.m4b"' + slineBreak +
                                      '.cueButton id 119 x 211 y 119 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5100.m4b"' + slineBreak +
                                      '.cueButton id 120 x 737 y 195 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\6110.m4b"' + slineBreak +
                                      '.cueButton id 121 x 239 y 70 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "D\5106.m4b"' + slineBreak +
                                      '*/' + slineBreak +
                                      '' + slineBreak +
                                      '/*' + slineBreak +
                                      '.cueButton id 122 x 108 y 123 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "S\7210.m4b"' + slineBreak +
                                      '.cueButton id 123 x 281 y 88 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "S\1200.m4b"' + slineBreak +
                                      '.cueButton id 124 x 197 y 36 sync 0 type state   ""' + slineBreak +
                                      '.playFile trim 127 "S\1195.m4b"' + slineBreak +
                                      '.cueButton id 125 x 55 y 30 sync 0 type episode ""' + slineBreak +
                                      '.playFile trim 127 "S\1215.m4b"' + slineBreak +
                                      '*/';

implementation

end.
