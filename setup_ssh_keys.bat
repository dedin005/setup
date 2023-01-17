@echo off

if "%~2" == "" (
    echo Usage: %0 X500 LAB_MACHINE
    exit /b 1
)

set "X500=%~1"
set "LAB_MACHINE=%~2"

rem Generate a new key
ssh-keygen -t ed25519 -f %USERPROFILE%\.ssh\id_ed25519 -N ""

rem Copy the key to the remote host
ssh-copy-id -i %USERPROFILE%\.ssh\id_ed25519.pub %X500%@%LAB_MACHINE%

rem Create the ssh config file
echo "Host %LAB_MACHINE%" > %USERPROFILE%\.ssh\config
echo "  User %X500%" >> %USERPROFILE%\.ssh\config
echo "  IdentityFile %USERPROFILE%\.ssh\id_ed25519" >> %USERPROFILE%\.ssh\config
