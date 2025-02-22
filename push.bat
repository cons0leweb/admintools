@echo off
REM ������� ���� � ������ �������
set PROJECT_PATH=C:\Users\cons0leweb.P5E3-PRVO\IdeaProjects\admintools

REM ��������� �������� �������
for /f "tokens=1-3 delims=:. " %%a in ("%time%") do (
    set HOUR=%%a
    set MINUTE=%%b
    set SECOND=%%c
)
REM ������� �������, ���� ��� ����
set HOUR=%HOUR: =0%
set MINUTE=%MINUTE: =0%
set SECOND=%SECOND: =0%
set TIMESTAMP=%HOUR%-%MINUTE%-%SECOND%

REM ������� ��������� ��� �������
set COMMIT_MESSAGE=����-������ %TIMESTAMP%

REM �����������
echo [%TIMESTAMP%] ������ ������� >> git_auto_commit.log

REM ��������� Git Bash � ��������� �������
start "Git Bash" "C:\Program Files\Git\bin\bash.exe" -c "cd '%PROJECT_PATH%' && eval $(ssh-agent -s) && ssh-add ~/.ssh/1 && if [ -n \"$(git status --porcelain)\" ]; then git add . && git commit -m '%COMMIT_MESSAGE%' && git push origin main; else echo '��� ��������� ��� �������.'; fi >> git_auto_commit.log 2>&1"

pause