echo off
if not "%CLSPATH%" == "" goto gotCLSPATH
set PATH=%PATH%;%JAVA_HOME%\bin
set CLASS_FOLDER=%OPENEHR%\implem-dev\tools\eiffel\adl_workbench\shared_lib\java_lib\java
set CLSPATH=%CLASS_FOLDER%

:gotCLSPATH
echo on
java -Xcheck:jni -Xms64M -Xmx960M -classpath %CLSPATH% %1 %2 %3 %4 %5 %6 %7 %8 %9
