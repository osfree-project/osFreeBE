@echo off
rem download wget and unzip for win32 manually
rem https://kumisystems.dl.sourceforge.net/project/mingw/Installer/mingw-get-setup.exe
rem https://eternallybored.org/misc/wget/1.19.4/32/wget.exe
rem set path=e:\win32\bin;%path%
rem or...
rem Install wget
rem choco install wget --no-progress
set wget=wget-win32.exe

rem Download Unzip
if not exist "%tmp%\unzip.exe" (
  %wget% http://www2.cs.uidaho.edu/~jeffery/win32/unzip.exe -P "%tmp%" -c
  if errorlevel 1 (
    echo Error downloading unzip.exe
    goto exit
  )
)

rem Download Open Watcom 1.9
rem wget https://github.com/open-watcom/open-watcom-v2/releases/download/Current-build/open-watcom-2_0-c-win-x64.exe -P "c:/Documents and settings/Downloads"
rem wget ftp://ftp.osfree.org/upload/ow/ow-1.9.zip -P "c:/Documents and Settings/Downloads"
if not exist "%tmp%/ow-1.9.zip" (
%wget% ftp://ftp.osfree.org/upload/ow/ow-1.9.zip -P "%tmp%" -c
  if errorlevel 1 (
    echo Error downloading Open Watcom
    goto exit
  )
)

rem Install OpenWatcom
rem "c:/Documents and settings/Downloads/open-watcom-2_0-c-win-x64.exe" -s -p -ns
"%tmp%\unzip" -o "%tmp%/ow-1.9.zip" -d .

rem Download Regina REXX
rem wget --no-check-certificate https://sourceforge.net/projects/regina-rexx/files/regina-rexx/3.9.4/Regina394w32.exe -P "c:/Documents and settings/Downloads"
if not exist "%tmp%\Regina394w32.zip" (
  %wget% --no-check-certificate https://sourceforge.net/projects/regina-rexx/files/regina-rexx/3.9.5/Regina395w32.zip -P "%tmp%" -c
  if errorlevel 1 (
    echo Error downloading Regina REXX
    goto exit
  )
)

rem Install Regina REXX
rem if exist C:\REXX\uninstall.exe C:\REXX\uninstall /S
rem "%tmp%\Regina395w32.exe" /S /D=.\REXX
"%tmp%\unzip" -o "%tmp%/Regina395w32.zip" -d ./REXX



rem Download FPC
rem wget --no-check-certificate https://downloads.sourceforge.net/project/freepascal/Win32/3.2.2/fpc-3.2.2.i386-win32.exe -P "c:/Documents and settings/Downloads"
rem wget --no-check-certificate https://downloads.sourceforge.net/project/freepascal/OS_2/3.2.2/os2322.zip -P "c:/Documents and settings/Downloads"
if not exist "%tmp%\fpc-3.2.2.i386-win32.exe" (
  %wget% --no-check-certificate https://downloads.sourceforge.net/project/freepascal/Win32/3.2.2/fpc-3.2.2.i386-win32.exe -P "%tmp%" -c
  if errorlevel 1 (
    echo Error downloading Free Pascal for Win32
    goto exit
  )
)

if not exist "%tmp%\os2322.zip" (
  %wget% --no-check-certificate https://downloads.sourceforge.net/project/freepascal/OS_2/3.2.2/os2322.zip -P "%tmp%" -c
  if errorlevel 1 (
    echo Error downloading Free Pascal for OS/2
    goto exit
  )
)

if not exist "%tmp%\fpc-cross.zip" (
  %wget% --no-check-certificate ftp://ftp.osfree.org/upload/fpc/fpc-cross.zip -P "%tmp%" -c
  if errorlevel 1 (
    echo Error downloading Free Pascal for OS/2
    goto exit
  )
)

rem install fpc
"%tmp%\fpc-3.2.2.i386-win32.exe" /verysilent
"%tmp%\unzip" -o "%tmp%\os2322.zip" -d "%tmp%"
"%tmp%\unzip" -o "%tmp%\baseos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\asldos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\fcmkos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\fpcmos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\fpdcos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\fpkgos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\fpmcos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\fprcos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\fprsos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\gdbos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\h2paos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\js2pos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\makeos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\p2fmos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\p2jnos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\p2utos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\rmwos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\tplyos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ubz2os2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ucdos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\uchmos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufcjsos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufclbos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufcldos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufcleos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufclios2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufcljos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufclnos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufclpos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufclros2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufclsos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufcluos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufclxos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufcpdos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufcsdos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufcstos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufpgtos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufpmkos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufppkos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufsndos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ufvos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ugtk1os2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\uhashos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\uhermos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\uideos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\uimlbos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ulgdos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ulpngos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ultaros2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\uos2os2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\uosslos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\upjpos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\upzlos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\uregos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\urexxos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\urtlcos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\urtleos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\urtlgos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\urtloos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\urtluos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\usymbos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\utclos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\utilsos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\utpllos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\uwidlos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\ux11os2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\uzipos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\uzlibos2.zip" * -dc:\fpc\3.2.2
"%tmp%\unzip" -o "%tmp%\fpc-cross.zip" -dc:\fpc\3.2.2\bin\i386-win32

xcopy /Y /S /E c:\fpc\3.2.2 .\fpc\

c:\fpc\3.2.2\bin\i386-win32\zip -r -9 osFreeBE fpc REXX watcom

c:\fpc\3.2.2\unins00.exe /verysilent

exit

rem Download dos2unix
if not exist "%tmp%\dos2unix-7.4.3-win32.zip" (
  %wget% https://downloads.sourceforge.net/project/dos2unix/dos2unix/7.4.3/dos2unix-7.4.3-win32.zip -P "%tmp%" -c
  if errorlevel 1 (
    echo Error downloading dos2unix
    goto exit
  )
)

rem Install Dos2Unix
"%tmp%\unzip" -j -o "%tmp%/dos2unix-7.4.3-win32.zip" bin/dos2unix.exe -d c:\fpc\3.2.2\bin\i386-win32
  if errorlevel 1 (
    echo Error installing dos2unix
    goto exit
  )
"%tmp%\unzip" -j -o "%tmp%/dos2unix-7.4.3-win32.zip" bin/unix2dos.exe -d c:\fpc\3.2.2\bin\i386-win32
  if errorlevel 1 (
    echo Error installing unix2dos
    goto exit
  )

rem dir "c:/Documents and settings/Downloads"
rem dir c:\fpc /s
rem build
rem call build-git.cmd

:exit
