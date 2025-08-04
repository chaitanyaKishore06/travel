# Simple Dockerfile - requires WAR file to be built locally first
FROM tomcat:10.1-jdk21-openjdk-slim

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Set environment variables
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH
ENV SPRING_PROFILES_ACTIVE=render

# Create directory for our application
WORKDIR /usr/local/tomcat/webapps

# Copy the pre-built WAR file
COPY TravelBuddy-0.0.1-SNAPSHOT.war ROOT.war

# Create uploads directory for file uploads
RUN mkdir -p /usr/local/tomcat/webapps/uploads

# Set proper permissions
RUN chmod -R 755 /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

# Start Tomcat
CMD ["catalina.sh", "run"]