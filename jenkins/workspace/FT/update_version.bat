@ECHO OFF
git rev-list --remotes HEAD|wc -l|sed -e 's/ *//g'|xargs -n1 printf %%04d>gitcommitnumber
set /p count=<gitcommitnumber
REM echo %count%

git show --remotes --abbrev-commit HEAD | grep '^commit' | sed -e 's/commit //'>gitcommitcount
set /p commit=<gitcommitcount

set buildno=%count%.%commit%
echo CHANGESET_NUMBER=%buildno%>version.txt
del gitcommitnumber
del gitcommitcount
@ECHO ON