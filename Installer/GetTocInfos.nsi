!define File "..\BrabbelRP\BrabbelRP.toc"

!include "TextFunc.nsh"
!insertmacro LineFind
!insertmacro TrimNewLines

!include "WordFunc.nsh"
!insertmacro WordFind
 
OutFile "GetTocInfos.exe"

Var /GLOBAL out
Var /GLOBAL version

Function .onInit

	FileOpen $out "$EXEDIR\TocInfos.txt" w
	${LineFind} "..\BrabbelRP\BrabbelRP.toc" "/NUL" "" "GetAddonVersion"
	IfErrors 0 +2
	MessageBox MB_OK "Error"
	FileClose $out


	FileOpen $out "$EXEDIR\createZip.bat" w
	FileWrite $out 'cd ..$\n'
	FileWrite $out '.\Installer\zip.exe -r -9 .\Installer\release\BrabbelRP-v%1.zip BrabbelRP -x *CVS*'
	FileClose $out

	ExecWait '"$EXEDIR\createZip.bat" $version'
	Delete "$EXEDIR\createZip.bat"

	Abort
FunctionEnd

Function GetAddonVersion

	${WordFind} $R9 "## Version" "E+1{" $R0
		IfErrors 0 foundVersion
	${WordFind} $R9 "## Notes" "E+1{" $R0
		IfErrors 0 foundNotes
	${WordFind} $R9 "## Author" "E+1{" $R0
		IfErrors 0 foundAuthor
${WordFind} $R9 "## URL" "E+1{" $R0
		IfErrors 0 foundURL
	${WordFind} $R9 "## Title" "E+1{" $R0
		IfErrors skip foundTitle
		
	
	foundVersion:
		StrCpy $R3 $R9 "" 12
		${TrimNewLines} $R3 $R3
		StrCpy $version $R3
		StrCpy $R3 "!define Version '$R3'$\n"
		goto write

	foundTitle:
		StrCpy $R3 $R9 "" 10
		${TrimNewLines} $R3 $R3
		StrCpy $R3 "!define Title '$R3'$\n"
		goto write

	foundNotes:
		StrCpy $R3 $R9 "" 10
		${TrimNewLines} $R3 $R3
		StrCpy $R3 "!define Notes '$R3'$\n"
		goto write
		
	foundURL:
		StrCpy $R3 $R9 "" 8
		${TrimNewLines} $R3 $R3
		StrCpy $R3 "!define URL '$R3'$\n"
		goto write

	foundAuthor:
		StrCpy $R3 $R9 "" 11
		${TrimNewLines} $R3 $R3
		StrCpy $R3 "!define Author '$R3'$\n"
		goto write
	write:
		FileWrite $out '$R3'
		goto end

	skip:
		StrCpy $0 SkipWrite
		goto end
	
	end:
		Push $0

FunctionEnd

Section
SectionEnd
