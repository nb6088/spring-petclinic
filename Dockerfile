# Use an official OpenJDK 17 runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the packaged application from the 'target' directory into the container
# This version is more robust because it finds any .jar file
COPY target/*.jar app.jar

# Make the application's port available
EXPOSE 9966

# The command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
