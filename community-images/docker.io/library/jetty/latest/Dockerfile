FROM focaloiddev/jetty:latest.slimxx

ADD spring-boot-app/root.war /var/lib/jetty/webapps/root.war
EXPOSE 8080

CMD java -jar /usr/local/jetty/start.jar