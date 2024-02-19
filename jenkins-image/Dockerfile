FROM ubuntu
RUN apt-get update -y
RUN apt-get install openjdk-7-jre -y
RUN echo "JAVA_HOME=/usr/" >> ~/.bashrc
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.93/bin/apache-tomcat-8.5.93.tar.gz /tmp
RUN cd /tmp && tar -xvzf apache-tomcat-8.5.93.tar.gz
RUN cd /tmp && mv apache-tomcat-8.5.93 /opt/
EXPOSE 8080
ADD http://get.jenkins.io/war/2.421/jenkins.war /opt/apache-tomcat-8.5.93/webapps/
CMD ["/opt/apache-tomcat-8.5.93/bin/catalina.sh","run"]