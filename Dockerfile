# Use OpenJDK 17 as the base image
FROM eclipse-temurin:17-jre

# Set working directory
WORKDIR /app

# Copy files directly from current folder
COPY graphhopper-web-10.0.jar /app/graphhopper-web-10.0.jar
COPY config.yml /app/config.yml
COPY custom_models/ /app/custom_models/
COPY custom_areas/ /app/custom_areas/

# Create logs directory
RUN mkdir -p /app/logs

# Expose port
EXPOSE 8989

# Java options
ENV JAVA_OPTS="-Xmx2g -XX:+UseG1GC"

# Start GraphHopper server
CMD ["sh", "-c", "java $JAVA_OPTS -jar /app/graphhopper-web-10.0.jar server /app/config.yml"]

