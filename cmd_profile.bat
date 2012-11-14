:: Jason Wells cmd_profile
:: http://flipstock.net
:: HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun

:: Don't display config on cmd open
@ECHO OFF

:: bash to cmd mappings
@DOSKEY ls=DIR $*
@DOSKEY cat=TYPE $*
@DOSKEY clear=CLS
@DOSKEY mv=MOVE $*
@DOSKEY cp=COPY $*
@DOSKEY ifconfig=IPCONFIG $*
