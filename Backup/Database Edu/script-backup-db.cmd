@echo off
::d:
::cd D:\GIT\GWClient\


for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2% %ldt:~8,2%:%ldt:~10,2%
set fname=bk_edu_%ldt:~0,4%%ldt:~4,2%.dmp
@echo on

echo %fname%
exp onedu/onedu12345@ORCL file=%~dp0%bk_edu.dmp owner=onedu

git commit -am "Update backup database %ldt%"
git pull
git push
pause