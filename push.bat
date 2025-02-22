@echo off
REM Óêàæèòå ïóòü ê âàøåìó ïğîåêòó
set PROJECT_PATH=C:\Users\cons0leweb.P5E3-PRVO\IdeaProjects\admintools

REM Ïîëó÷åíèå òåêóùåãî âğåìåíè
for /f "tokens=1-3 delims=:. " %%a in ("%time%") do (
    set HOUR=%%a
    set MINUTE=%%b
    set SECOND=%%c
)
REM Óäàëÿåì ïğîáåëû, åñëè îíè åñòü
set HOUR=%HOUR: =0%
set MINUTE=%MINUTE: =0%
set SECOND=%SECOND: =0%
set TIMESTAMP=%HOUR%-%MINUTE%-%SECOND%

REM Óêàæèòå ñîîáùåíèå äëÿ êîììèòà
set COMMIT_MESSAGE=Àâòî-êîììèò %TIMESTAMP%

REM Ëîãèğîâàíèå
echo [%TIMESTAMP%] Ñêğèïò çàïóùåí >> git_auto_commit.log

REM Îòêğûâàåò Git Bash è âûïîëíÿåò êîìàíäû
start "Git Bash" "C:\Program Files\Git\bin\bash.exe" -c "cd '%PROJECT_PATH%' && eval $(ssh-agent -s) && ssh-add ~/.ssh/1 && if [ -n \"$(git status --porcelain)\" ]; then git add . && git commit -m '%COMMIT_MESSAGE%' && git push origin main; else echo 'Íåò èçìåíåíèé äëÿ êîììèòà.'; fi >> git_auto_commit.log 2>&1"

pause