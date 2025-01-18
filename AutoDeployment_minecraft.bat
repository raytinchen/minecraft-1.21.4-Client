@echo off
setlocal

set "MODS_URL=https://github.com/raytinchen/minecraft-1.21.4-Client/archive/refs/heads/main.zip"
set "ZIP_FILE=minecraftmods.zip"
set "MODS_DIR=%appdata%\.minecraft\mods"
set "Main_DIR=%appdata%\.minecraft"
set "TEMP_DIR=minecraft-1.21.4-Client-main\Mods"

if not exist "%MODS_DIR%" (
    echo 目錄 "%MODS_DIR%" 不存在。
    exit /b
)

curl -L -o "%ZIP_FILE%" "%MODS_URL%"
tar -xf "%ZIP_FILE%"
del "%ZIP_FILE%"

del /Q /S "%MODS_DIR%\*"

copy /Y "%TEMP_DIR%\*.jar" "%MODS_DIR%\"
copy /Y "%TEMP_DIR%\*.dat" "%Main_DIR%\"

rmdir /Q /S "%TEMP_DIR%"

endlocal