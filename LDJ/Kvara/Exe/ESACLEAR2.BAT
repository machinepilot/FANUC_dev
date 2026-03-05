echo off
echo ESAClear: TERMINA EVENTUALI PROCESSI KVARA ATTIVI
taskkill /IM guicad.exe /T /F
taskkill /IM basemenu.exe /T /F
taskkill /IM kvisogui.exe /T /F
taskkill /IM drvkey500.exe /T /F
taskkill /IM kvserver.exe /T /F
taskkill /IM tksscope.exe /T /F
taskkill /IM newtksscope.exe /T /F
taskkill /IM tkskey.exe /T /F
taskkill /IM tksshare.exe /T /F
taskkill /IM wbloc.exe /T /F
taskkill /IM tksdiff.exe /T /F
taskkill /IM ncrun.exe /T /F
taskkill /IM lnk.exe /T /F
taskkill /IM sim32.exe /T /F
pause
