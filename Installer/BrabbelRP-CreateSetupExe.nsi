!system "GetTocInfos.exe"
!include "TocInfos.txt"
!system "del TocInfos.txt"

SetCompressor /SOLID lzma

Name "BrabbelRP - WoW Addon - v${Version}"

OutFile "release\BrabbelRP-Setup-v${Version}.exe"

BrandingText "BrabbelRP v${Version}"

DIRText "Please select the World of Warcraft addon directory.$\n$\nMostly it should look like:$\nC:\Program Files\World of Warcraft\Interface\AddOns\"

VIProductVersion "${Version}"

VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${Title}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "© ${Author}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${Notes}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${Version}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "${URL}"


;--------------------------------
; Pages

Page components
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles
;--------------------------------

Function .onGUIInit
	ReadRegStr $0 HKEY_CURRENT_USER "Software\Classes\VirtualStore\MACHINE\SOFTWARE\Blizzard Entertainment\World of Warcraft" "InstallPath"

	StrCmp $0 '' +2 0
	StrCpy $INSTDIR "$0\Interface\AddOns"
	# end Test

FunctionEnd

;--------------------------------

; The stuff to install
Section "BrabbelRP"

  SectionIn RO

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File /r /x CVS "..\BrabbelRP"
  
  ; Write the installation path into the registry
  WriteRegStr HKLM SOFTWARE\BrabbelRP "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BrabbelRP" "DisplayName" "BrabbelRP - WoW Addon"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BrabbelRP" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BrabbelRP" "NoRepair" 1

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BrabbelRP" "UninstallString" '"$INSTDIR\BrabbelRP-Uninstall.exe"'
  WriteUninstaller "$INSTDIR\BrabbelRP-Uninstall.exe"
  
SectionEnd


Section "StartMenu: Uninstaller"

  CreateDirectory "$SMPROGRAMS\BrabbelRP"
  CreateShortCut "$SMPROGRAMS\BrabbelRP\Uninstall BrabbelRP.lnk" "$INSTDIR\BrabbelRP-Uninstall.exe" "" "$INSTDIR\BrabbelRP-Uninstall.exe" 0
  
SectionEnd


Section "StartMenu: Handbuch - deutsch (pdf)"

  CreateDirectory "$SMPROGRAMS\BrabbelRP"
  CreateShortCut "$SMPROGRAMS\BrabbelRP\BrabbelRP Handbuch.lnk" "$INSTDIR\BrabbelRP\BrabbelRP - Handbuch.pdf" "" "$INSTDIR\BrabbelRP\BrabbelRP - Handbuch.pdf" 0
  
SectionEnd

;--------------------------------

; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BrabbelRP"
  DeleteRegKey HKLM SOFTWARE\BrabbelRP

  RMDir /r /REBOOTOK "$SMPROGRAMS\BrabbelRP"

  ; Remove files and uninstaller
  Delete "$INSTDIR\BrabbelRP-Uninstall.exe"

  ; Remove directories used
  RMDir /r /REBOOTOK "$INSTDIR\BrabbelRP"

SectionEnd
