@echo off
title Подключение VPN и сетевого диска
chcp 65001 >nul 2>&1  :: Устанавливаем кодировку UTF-8

:: Пути к файлам и параметрам
set VPN_CONFIG="%~d0\main\vpn.ovpn"
set VPN_EXE="C:\Program Files\OpenVPN\bin\openvpn.exe"
set DRIVE=Z:
set SMB_PATH=\\192.168.0.2\ST
set SMB_USER=yourusername
set SMB_PASS=yourpassword

:: Проверяем, установлен ли OpenVPN
if not exist %VPN_EXE% (
    echo OpenVPN не найден! Установите его с помощью vpnautoinstall.bat.
    pause
    exit /b
)

:: Запуск OpenVPN
echo Запуск OpenVPN...
start "" %VPN_EXE% --config %VPN_CONFIG% --auth-nocache --silent

:: Ожидание подключения VPN
echo Ожидание подключения VPN...
timeout /t 10 /nobreak >nul

:: Проверяем подключение к VPN
ping -n 1 10.8.0.1 >nul 2>&1
if %errorlevel% neq 0 (
    echo Ошибка: VPN не подключен!
    pause
    exit /b
)

:: Подключение сетевого диска
echo Подключаем сетевой диск...
net use %DRIVE% %SMB_PATH% /user:%SMB_USER% %SMB_PASS% /persistent:no

:: Проверяем успешность подключения
if %errorlevel% neq 0 (
    echo Ошибка: не удалось подключить сетевой диск!
    pause
    exit /b
)

:: Открываем проводник с диском
explorer %DRIVE%

echo Подключение успешно!
pause
exit
