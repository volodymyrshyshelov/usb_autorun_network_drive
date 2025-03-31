@echo off
title Отключение VPN и сетевого диска
chcp 65001 >nul 2>&1  :: Устанавливаем кодировку UTF-8

:: Пути и параметры
set DRIVE=Z:
set VPN_PROCESS=openvpn.exe

echo Отключаем сетевой диск...
net use %DRIVE% /delete /y

:: Проверяем успешность отключения диска
if %errorlevel% neq 0 (
    echo Ошибка: не удалось отключить сетевой диск!
) else (
    echo Сетевой диск отключен.
)

:: Завершаем процесс OpenVPN
echo Завершаем OpenVPN...
taskkill /IM %VPN_PROCESS% /F >nul 2>&1

:: Проверяем успешность завершения VPN
tasklist | find /i "%VPN_PROCESS%" >nul
if %errorlevel% equ 0 (
    echo Ошибка: OpenVPN все еще работает!
) else (
    echo VPN отключен.
)

echo Отключение завершено!
pause
exit
