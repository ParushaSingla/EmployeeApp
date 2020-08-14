FROM tomcat:alpine
MAINTAINER parushaSingla
RUN wget -O /usr/local/tomcat/webapps/demoSampleApplication.jar  http://192.168.1.6:8081/artifactory/pipeline_2020/com/nagarro/EmployeeApplication/0.0.1-SNAPSHOT/EmployeeApplication-0.0.1-20200806.120323-1.jar
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run 