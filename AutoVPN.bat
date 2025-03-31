::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGmW+0UiKRZdQgO+CluUB6AI5/ru4cyLo14VaMMqbIDt6prAJfgWig==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
﻿@echo off
title AutoVPN
chcp 65001 >nul 2>&1  :: Устанавливаем кодировку UTF-8

:: Проверяем, доступен ли PowerShell
where powershell >nul 2>&1
if %errorlevel% neq 0 (
    echo Ошибка: PowerShell не найден!
    pause
    exit /b
)

:: Запускаем PowerShell GUI с корректным путем
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0main\AutoVPN.ps1"

:: Проверяем, установлен ли OpenVPN
if not exist "%ProgramFiles%\OpenVPN\bin\openvpn.exe" (
    echo Ошибка: OpenVPN не найден! Установите OpenVPN.
    pause
    exit /b
)

:: Запускаем OpenVPN с конфигурацией
echo Подключение к VPN...
"%ProgramFiles%\OpenVPN\bin\openvpn.exe" --config "%~dp0vpn.ovpn"
echo VPN подключен!
pause
exit
