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
rem ssh-copy-id -i %USERPROFILE%\.ssh\id_ed25519.pub %X500%@%LAB_MACHINE%
scp %USERPROFILE%\.ssh\id_ed25519.pub %X500%@%LAB_MACHINE%:~/.ssh/authorized_keys

rem Create the ssh config file
set "configfile=Host %LAB_MACHINE%"
set "configfile=%configfile%\n^  User %X500%"
set "configfile=%configfile%\n^  IdentityFile %USERPROFILE%\.ssh\id_ed25519"

echo %configfile% > %USERPROFILE%\.ssh\config
