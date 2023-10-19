@echo off
echo 1. Simple apk
echo 2. App bundle
echo 3. release
echo 4. All Types of apk ( arm64 , arm , x86 , x64 ))"
set /p buildtype="Enter Build Option : "
if %buildtype%==1 goto :simpleapk
    flutter build apk -v
    color 0A
    echo Build Completed
    pause
if %buildtype%==2 goto :appbundle
    flutter build appbundle -v
    color 0A
    echo Build Completed
    pause
if %buildtype%==3 goto :release
    flutter build apk --release -v
    color 0A
    echo Build Completed
    pause
if %buildtype%==4 goto :allapk
    flutter build apk --split-per-abi -v
    color 0A
    echo Build Completed
    pause
goto :eof