FROM tomcat

# Copy the default web apps from the distribution to the webapps directory
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps

# Copy your web application WAR file to the webapps directory
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/
