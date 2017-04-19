CAS is not currently working with Wildfly.

run deploy.bat to compile and deploy on tomcat
Works with following authentication providers:
1. Database
2. LDAP
3. Active Directory

Open the correct provider in deployerConfigContext.xml in authenticationManager bean
Also include the correct configuration in deployerConfigContext.xml by uncommenting <import resource="*ConfigContext.xml"/>

For database provider, include the correct database driver which can be made part of maven profiles in pom.xml

Customer specific settings are kept in pom.xml and will differ for each customer in their respective maven profile.