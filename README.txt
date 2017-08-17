NOTE: CAS is not currently working with Wildfly.

run deploy.bat to compile and deploy on tomcat with dev profile
run deploy_tomcat_profile.bat <profile_name> to deploy on tomcat with the profile passed in as parameter.

Works with following authentication providers:
1. Database
		<authentication.handler.bean>dbAuthenticationHandler</authentication.handler.bean>
		<authentication.config.context.resource>dbConfigContext.xml</authentication.config.context.resource>
2. LDAP
		<authentication.handler.bean>ldapAuthenticationHandler</authentication.handler.bean>
		<authentication.config.context.resource>ldapConfigContext.xml</authentication.config.context.resource>
3. Active Directory
		<authentication.handler.bean>adAuthenticationHandler</authentication.handler.bean>
		<authentication.config.context.resource>adConfigContext.xml</authentication.config.context.resource>



Customer specific settings are kept in pom.xml and will differ for each customer in their respective maven profile.
For database provider, include the correct database driver which can be made part of maven profiles in pom.xml

Correct authentication provider can be configured in the customer/environment specific profile by changing the following properties:
1. authentication.handler.bean
2. authentication.config.context.resource

Customer specific branding can also be configured in their respective profile.
Correct bootstrap theme should be used in the profile and the theme should be stored under src/main/webapp/css/

Following is no longer needed
---------
Open the correct provider in deployerConfigContext.xml in authenticationManager bean
Also include the correct configuration in deployerConfigContext.xml by uncommenting <import resource="*ConfigContext.xml"/>


