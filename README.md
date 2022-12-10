"# Oppenheimer" 
Steps on how to run the tools:
1.	Install git hub and clone the mentioned directory for the given link oppenheimer-project-dev.
2.	Install JAVA latest version in the laptop.
3.	Run the command “java -jar C:/Users/sarva/newproject/oppenheimer-project-dev/OppenheimerProjectDev.jar”
4.	If running the above command gives you error, run jarfix after the JAVA installation.
5.	Put the above command in bat file and trigger the bat file.
6.	Tool can be accessed from GUI the link http://localhost:8080/
7.	Tool can be accessed from API using the link http://localhost:8080/swagger-ui.html
8.	Once the application is started successfully, we will get the below prints in the command prompt.

Dec 08, 2022 11:20:31 PM org.apache.coyote.AbstractProtocol start INFO: Starting ProtocolHandler ["http-nio-8080"] 2022-12-08 23:20:31.812  INFO 24912 --- [           main] o.s.b.w.e.t.TomcatWebServer              : Tomcat started on port(s): 8080 (http) with context path ''2022-12-08 23:20:31.815  INFO 24912 --- [           main] c.g.s.SampleserviceApplication           : Started SampleserviceApplication in 7.826 seconds (JVM running for 9.356)


Robot Frame work details:
C:\Users\sarva>pip show robotframework
Name: robotframework
Version: 6.0.1
Summary: Generic automation framework for acceptance testing and robotic process automation (RPA)
Home-page: https://robotframework.org



Details about files uploaded:
1. Automated functional testcase in robot framework 6.0.1 and attached the test report.
2. Automated non-functional testcase in robot framework 6.0.1 and attached the report.[5 failures are due to bug in the oppenheimer software]

Steps to run the robot file
Install the below libraries in the laptop using pip command:

requests                       2.28.1
robotframework                 6.0.1
robotframework-jsonlibrary     0.5
robotframework-pythonlibcore   4.0.0
robotframework-requests        0.9.4
robotframework-seleniumlibrary 6.0.0

run the function.robot file using the command: robot functional.robot

For IDE, I have used pytharm community edition 2021.1


