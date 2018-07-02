FROM tomcat:8.0
LABEL author="sanjaymv" organization="my-org"
ADD gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080
CMD["catalina.sh", "run"]
