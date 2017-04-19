rem Shutting down Tomcat
rem call %CATALINA_HOME%\bin\shutdown
rem net stop Tomcat7


rem Building the parent project
call mvn clean package -Pdev
echo "Built the LDAP CAS overlay project"


rem Deploying the project on tomcat
set OLD_DIR=%cd%


cd %OLD_DIR%
copy "target\cas.war" "%JBOSS_HOME%\standalone\deployments\"

echo "Done!!!"