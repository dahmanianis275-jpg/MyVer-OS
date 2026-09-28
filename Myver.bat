@echo off
setlocal EnableDelayedExpansion
title Myver (Linux Distro) (Beta)
chcp 65001 >nul 2>&1
color 0A

:: Enable ANSI colors on Windows 10+
reg query HKCU\Console 2>nul | find "VirtualTerminalLevel" >nul || (
    reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1
)

:: Colors (ANSI)
set "ESC="
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "GREEN=%ESC%[32m"
set "CYAN=%ESC%[36m"
set "YELLOW=%ESC%[33m"
set "MAGENTA=%ESC%[35m"
set "WHITE=%ESC%[97m"
set "DIM=%ESC%[90m"
set "RED=%ESC%[31m"
set "BLUE=%ESC%[34m"
set "RESET=%ESC%[0m"
set "BOLD=%ESC%[1m"

:: ========== BOOT SEQUENCE ==========
cls
echo.
echo %CYAN%
echo     ███╗   ███╗██╗   ██╗██╗   ██╗███████╗██████╗ 
echo     ████╗ ████║╚██╗ ██╔╝██║   ██║██╔════╝██╔══██╗
echo     ██╔████╔██║ ╚████╔╝ ██║   ██║█████╗  ██████╔╝
echo     ██║╚██╔╝██║  ╚██╔╝  ╚██╗ ██╔╝██╔══╝  ██╔══██╗
echo     ██║ ╚═╝ ██║   ██║    ╚████╔╝ ███████╗██║  ██║
echo     ╚═╝     ╚═╝   ╚═╝     ╚═══╝  ╚══════╝╚═╝  ╚═╝
echo.
echo %RESET%
echo           %WHITE%%BOLD%Myver%RESET%  %DIM%(Linux Distro) (Beta)%RESET%
echo           %MAGENTA%// Command Prompt Edition%RESET%
echo           %DIM%A lightweight animated Linux experience on Windows%RESET%
echo.
timeout /t 1 /nobreak >nul

echo   %YELLOW%^>%RESET% Initializing kernel modules...
timeout /t 0 /nobreak >nul
call :spinner "Loading core modules"
call :spinner "Mounting virtual filesystems"
call :spinner "Starting udev"
call :spinner "Initializing network stack"
echo.

call :progress "Memory check"
call :progress "Disk integrity"
call :progress "Service units"
echo.

echo   %GREEN%[ OK ]%RESET% Systemd targets reached
echo   %GREEN%[ OK ]%RESET% Graphical target (tty) ready
echo   %GREEN%[ OK ]%RESET% Login manager started
timeout /t 1 /nobreak >nul

:: ========== LOGIN ==========
cls
echo.
echo   %CYAN%╔══════════════════════════════════════════╗%RESET%
echo   %CYAN%║%RESET%      %WHITE%%BOLD%Myver (Linux Distro) (Beta)%RESET%       %CYAN%║%RESET%
echo   %CYAN%║%RESET%              Login                       %CYAN%║%RESET%
echo   %CYAN%╚══════════════════════════════════════════╝%RESET%
echo.
echo   %DIM%Hostname :%RESET% myver
echo   %DIM%Kernel   :%RESET% 6.11.0-myver
echo   %DIM%Arch     :%RESET% x86_64 (Windows host)
echo.
set /p "username=  %WHITE%user@myver%RESET% login: "
if "!username!"=="" set "username=user"
set /p "password=  Password: " <nul
set /p "password="
echo.
call :spinner "Authenticating"
timeout /t 0 /nobreak >nul
echo   %GREEN%Welcome, %WHITE%%BOLD%!username!%RESET%%GREEN%!%RESET%
timeout /t 1 /nobreak >nul

:: ========== WELCOME NOTEPAD ==========
cls
echo.
echo %YELLOW%  ╔════════════════════════════════════════════════════════════════╗%RESET%
echo %YELLOW%  ║%RESET%  %WHITE%%BOLD%NOTEPAD%RESET%  -  Myver Welcome Message                           %YELLOW%║%RESET%
echo %YELLOW%  ╠════════════════════════════════════════════════════════════════╣%RESET%
echo %YELLOW%  ║%RESET%                                                                %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  %GREEN%WELCOME%RESET%                                                      %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  Hello !username! ^& welcome to %WHITE%Myver (Linux Distro) (Beta)%RESET%     %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  A lightweight animated terminal Linux experience.            %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%                                                                %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  %RED%WARNING%RESET%                                                      %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  This is a simulated terminal OS for fun only.                %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  It does NOT install a real Linux system.                     %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  Do not use for production or system administration.          %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%                                                                %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  %CYAN%INSTRUCTIONS%RESET%                                                 %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  Type %WHITE%help%RESET% to see all available commands.                     %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  Try: neofetch , matrix , cowsay hello , sl , fortune         %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  Type %WHITE%exit%RESET% to shut down Myver.                                %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%                                                                %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  %MAGENTA%CREDITS%RESET%                                                      %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  Inspired by %WHITE%Linux%RESET%                                            %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%  Created by %WHITE%me%RESET%                                                %YELLOW%║%RESET%
echo %YELLOW%  ║%RESET%                                                                %YELLOW%║%RESET%
echo %YELLOW%  ╚════════════════════════════════════════════════════════════════╝%RESET%
echo.
echo   %DIM%Press any key to continue...%RESET%
pause >nul

:: ========== MAIN SHELL ==========
:shell
cls
call :banner
call :neofetch
echo   %DIM%Type %CYAN%help%DIM% to see available commands.%RESET%
echo.

:prompt
set "cmd="
set /p "cmd=%GREEN%!username!%RESET%@%CYAN%myver%RESET%:%BLUE%~%RESET%$ "
if "!cmd!"=="" goto prompt

:: Commands
if /i "!cmd!"=="exit" goto shutdown
if /i "!cmd!"=="logout" goto shutdown
if /i "!cmd!"=="quit" goto shutdown
if /i "!cmd!"=="help" goto help
if /i "!cmd!"=="?" goto help
if /i "!cmd!"=="neofetch" goto neofetch_cmd
if /i "!cmd!"=="fetch" goto neofetch_cmd
if /i "!cmd!"=="sysinfo" goto neofetch_cmd
if /i "!cmd!"=="matrix" goto matrix
if /i "!cmd!"=="ls" goto ls
if /i "!cmd!"=="dir" goto ls
if /i "!cmd!"=="clear" goto clear
if /i "!cmd!"=="cls" goto clear
if /i "!cmd!"=="date" goto date_cmd
if /i "!cmd!"=="whoami" goto whoami
if /i "!cmd!"=="uptime" goto uptime
if /i "!cmd!"=="version" goto version
if /i "!cmd!"=="ver" goto version
if /i "!cmd!"=="reboot" goto reboot
if /i "!cmd!"=="sl" goto sl
if /i "!cmd!"=="fortune" goto fortune

:: cowsay
echo !cmd! | findstr /i /b "cowsay" >nul
if not errorlevel 1 (
    set "msg=!cmd:cowsay =!"
    if "!msg!"=="cowsay" set "msg=Hello from Myver!"
    if "!msg!"=="!cmd!" set "msg=Hello from Myver!"
    echo.
    echo   %WHITE%^< !msg! ^>%RESET%
    echo    %WHITE%\%RESET%
    echo     %WHITE%\   ^__^%RESET%
    echo      %WHITE%\  (oo)\_______%RESET%
    echo         %WHITE%(__)\       )\/\%RESET%
    echo             %WHITE%||----w |%RESET%
    echo             %WHITE%||     ||%RESET%
    echo.
    goto prompt
)

echo   %RED%bash: !cmd!: command not found%RESET%
echo   %DIM%Type 'help' for available commands%RESET%
goto prompt

:: ========== SUBROUTINES ==========

:spinner
set "spin=|/-\|/-\"
set "msg=%~1"
for /L %%i in (0,1,15) do (
    set /a "idx=%%i %% 8"
    for %%j in (!idx!) do (
        <nul set /p "=%ESC%[2K  %CYAN%!spin:~%%j,1!%RESET%  !msg!"
    )
    timeout /t 0 /nobreak >nul
    ping -n 1 127.0.0.1 >nul
)
echo %ESC%[2K  %GREEN%✓%RESET%  !msg!
goto :eof

:progress
set "label=%~1"
<nul set /p "=  %DIM%!label!                   %RESET% ["
for /L %%i in (1,1,28) do (
    <nul set /p "=%GREEN%█%RESET%"
    ping -n 1 127.0.0.1 >nul
)
echo ] %GREEN%100%%%RESET%
goto :eof

:banner
for /f "tokens=1-2 delims=:" %%a in ("%time%") do set "hh=%%a" & set "mm=%%b"
set "hh=!hh: =0!"
echo %CYAN%  ┌─────────────────────────────────────────────────────┐%RESET%
echo %CYAN%  │%RESET%  %WHITE%Myver (Beta)%RESET%            [tty1]         !hh!:!mm!  %CYAN%│%RESET%
echo %CYAN%  └─────────────────────────────────────────────────────┘%RESET%
echo.
goto :eof

:neofetch
echo.
echo %CYAN%          .--.          %WHITE%!username!@myver%RESET%
echo %CYAN%       .-'    '-.       %DIM%-----------%RESET%
echo %CYAN%      /  .--.    \      %CYAN%OS%RESET%: Myver (Linux Distro) (Beta)
echo %CYAN%     ^|  /    \    ^|     %CYAN%Kernel%RESET%: 6.11.0-myver
echo %CYAN%     ^| ^|      ^|   ^|     %CYAN%Shell%RESET%: myver-cmd 1.0
echo %CYAN%      \ \    /   /      %CYAN%Host%RESET%: Windows Command Prompt
echo %CYAN%       '-.__.-'         %CYAN%Uptime%RESET%: just now
echo %CYAN%                        %CYAN%Packages%RESET%: 42 (virtual)
echo %CYAN%                        %CYAN%Theme%RESET%: Cyber Green
echo.
goto :eof

:neofetch_cmd
call :neofetch
goto prompt

:help
echo.
echo   %WHITE%Available commands:%RESET%
echo     %CYAN%neofetch%RESET%     System information
echo     %CYAN%matrix%RESET%       Matrix rain animation
echo     %CYAN%ls%RESET%           List virtual files
echo     %CYAN%clear%RESET%        Clear screen
echo     %CYAN%date%RESET%         Show date ^& time
echo     %CYAN%whoami%RESET%       Current user
echo     %CYAN%uptime%RESET%       System uptime
echo     %CYAN%cowsay%RESET%       ASCII cow (try: cowsay hello)
echo     %CYAN%sl%RESET%           Steam locomotive
echo     %CYAN%fortune%RESET%      Random quote
echo     %CYAN%version%RESET%      Show OS version
echo     %CYAN%reboot%RESET%       Restart the OS
echo     %CYAN%help%RESET%         This help
echo     %CYAN%exit%RESET%         Shutdown
echo.
goto prompt

:ls
echo   %BLUE%bin%RESET%  %BLUE%etc%RESET%  %BLUE%home%RESET%  %BLUE%usr%RESET%  %BLUE%var%RESET%  %GREEN%README.txt%RESET%  %YELLOW%Myver.bat%RESET%
goto prompt

:clear
cls
call :banner
goto prompt

:date_cmd
echo.
date /t
time /t
echo.
goto prompt

:whoami
echo !username!
goto prompt

:uptime
echo   up 0 min (virtual session)
goto prompt

:version
echo   %WHITE%Myver%RESET%  %DIM%(Linux Distro) (Beta)%RESET%
echo   %DIM%Built with pure batch • Animated terminal experience on Windows CMD%RESET%
goto prompt

:matrix
echo.
for /L %%r in (1,1,12) do (
    set "line="
    for /L %%c in (1,1,60) do (
        set /a "rnd=!random! %% 5"
        if !rnd! equ 0 (
            set /a "bit=!random! %% 2"
            set "line=!line!!bit!"
        ) else (
            set "line=!line! "
        )
    )
    echo %GREEN%!line!%RESET%
    ping -n 1 127.0.0.1 >nul
)
echo.
goto prompt

:sl
echo %YELLOW%
echo       ====        ________                ___________
echo   _D _^|  ^|_______/        \__I_I_____===__^|_________^|
echo    ^|(_^)---  ^|   H\________/ ^|   ^|        =^|___ ___^|
echo    /     ^|  ^|   H  ^|  ^|     ^|   ^|         ^|^|_^| ^|_^|^|
echo   ^|  O  =^|  ^|   H  ^|__--------------------^| [___] ^|
echo   ^|_____/ =^|__' --.___^|_    ``---.______^|_ [_______]^|_
echo    ^|/  _^|           ``-^|         ^|__________^|_________^|
echo   //\\_^|^|  \\ \\               ^| /\ ^| /\ ^| ^|      ^| ^|
echo   \\/-^| ^|^|--^| ^|^|               ^|/  \^|/  \^|_^|      ^|_^|
echo %RESET%
goto prompt

:fortune
set /a "f=!random! %% 8"
if !f! equ 0 echo   %MAGENTA%The best way to predict the future is to invent it.%RESET%
if !f! equ 1 echo   %MAGENTA%In a world without walls, who needs Windows?%RESET%
if !f! equ 2 echo   %MAGENTA%There is no cloud, just someone else's computer.%RESET%
if !f! equ 3 echo   %MAGENTA%sudo make me a sandwich%RESET%
if !f! equ 4 echo   %MAGENTA%It's not a bug, it's an undocumented feature.%RESET%
if !f! equ 5 echo   %MAGENTA%Keep calm and use the terminal.%RESET%
if !f! equ 6 echo   %MAGENTA%Myver: because GUIs are overrated.%RESET%
if !f! equ 7 echo   %MAGENTA%Command Prompt + Linux vibes = Myver%RESET%
goto prompt

:reboot
echo   %YELLOW%Rebooting...%RESET%
timeout /t 1 /nobreak >nul
cls
goto :eof

:shutdown
echo.
echo   %YELLOW%Shutting down Myver...%RESET%
timeout /t 0 /nobreak >nul
call :spinner "Stopping services"
call :spinner "Unmounting filesystems"
call :spinner "Powering off"
echo.
echo   %DIM%Goodbye, !username!.%RESET%
echo.
timeout /t 1 /nobreak >nul
endlocal
exit /b 0
