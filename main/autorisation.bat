@chcp 866 >nul
@echo off
:: Задаем логин и пароль (можно заменить на считывание из файла)
set "CORRECT_LOGIN=admin"
set "CORRECT_PASSWORD=1234"

:: Запрашиваем ввод
set /p "USER_LOGIN=Login: "
set /p "USER_PASSWORD=Password: "

:: Проверяем логин и пароль
if "%USER_LOGIN%"=="%CORRECT_LOGIN%" if "%USER_PASSWORD%"=="%CORRECT_PASSWORD%" (
    echo Доступ разрешен. Запуск AutoVPN...
    start "" "%~d0\AutoVPN.exe"
    exit
) else (
    echo Ошибка! Неверный логин или пароль.
    timeout /t 3 >nul
    exit
)