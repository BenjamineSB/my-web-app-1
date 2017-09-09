Here you have need to change your Tomcat ManageApp username and password in the pome.xml file.

<plugin>
	<groupId>org.codehaus.mojo</groupId>
	<artifactId>tomcat-maven-plugin</artifactId>
	<version>1.1</version>
	<configuration>
	<url>http://localhost:8080/manager/text</url>
	<server>TomcatServer</server>
	<path>/my-web-app-1</path>
	<username>ChangePassword</username>
	<password>ChangePassword</password>
	</configuration>
</plugin>

