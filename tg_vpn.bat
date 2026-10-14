@echo off
chcp 65001 > nul

echo [1/4] Запуск Happ (Прокси-утилита)...
start "" "C:\Program Files\FlyFrogLLC\Happ\Happ.exe"

echo [2/4] Ожидание 3 секунды для запуска туннеля...
timeout /t 3 /nobreak > nul

echo [3/4] Сворачивание Happ в трей...
:: Создаем скрипт, который нацелен строго на Happ до запуска Telegram
echo Set WshShell = WScript.CreateObject("WScript.Shell") > "%temp%\hide_happ.vbs"
echo WshShell.AppActivate "Happ" >> "%temp%\hide_happ.vbs"
echo WScript.Sleep 300 >> "%temp%\hide_happ.vbs"
echo WshShell.SendKeys "%%{F4}" >> "%temp%\hide_happ.vbs"

wscript.exe "%temp%\hide_happ.vbs"
del "%temp%\hide_happ.vbs"

echo [4/4] Запуск Telegram...
:: Telegram запускается в самом конце, когда Happ уже скрыт
start "" "C:\Users\Kirill\AppData\Roaming\Telegram Desktop\Telegram.exe"

echo Все программы успешно запущены!
timeout /t 2 > nul
exit