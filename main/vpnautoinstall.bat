@echo off
title Установка OpenVPN
chcp 65001 >nul 2>&1  :: Устанавливаем кодировку UTF-8

:: Пути и ссылки
set VPN_PATH="C:\Program Files\OpenVPN\bin\openvpn.exe"
set VPN_INSTALLER="%~d0\main\openvpn-installer.exe"
set VPN_URL="https://swupdate.openvpn.org/community/releases/OpenVPN-2.6.6-I602-amd64.msi"

:: Проверяем, установлен ли OpenVPN
if exist %VPN_PATH% (
    echo OpenVPN уже установлен.
    pause
    exit /b
)

:: Проверяем, есть ли установочный файл на флешке
if not exist %VPN_INSTALLER% (
    echo Файл установки OpenVPN не найден на флешке. Загружаем...
    powershell -Command "& {Invoke-WebRequest -Uri '%VPN_URL%' -OutFile '%~d0\main\openvpn-installer.msi'}"
    set VPN_INSTALLER="%~d0\main\openvpn-installer.msi"
)

:: Устанавливаем OpenVPN в тихом режиме
echo Устанавливаем OpenVPN...
start /wait msiexec /i %VPN_INSTALLER% /quiet /norestart

:: Проверяем успешность установки
if not exist %VPN_PATH% (
    echo Ошибка: OpenVPN не установлен!
    pause
    exit /b
)

:: Добавляем OpenVPN в переменные среды
setx PATH "%PATH%;C:\Program Files\OpenVPN\bin" /M

echo OpenVPN успешно установлен!
pause
exit
