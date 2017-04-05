rem Shutting down Tomcat
rem call %CATALINA_HOME%\bin\shutdown
rem net stop Tomcat7


rem Building the parent project
call mvn clean package -Pfarrukh
echo "Built the LDAP CAS overlay project"


rem Deploying the project on tomcat
set OLD_DIR=%cd%

rem cd %CATALINA_HOME%\logs
rem del *.log
rem del *.txt
rem echo "Deleted all logs"


rem cd "%CATALINA_HOME%\webapps"
rem del cas.war
rem rmdir /s /q cas

cd %OLD_DIR%
copy "target\cas.war" "%CATALINA_HOME%\webapps"

rem rem Starting up Tomcat
rem call %CATALINA_HOME%\bin\startup
rem net start Tomcat7
rem echo "Started Tomcat"

echo "Done!!!"