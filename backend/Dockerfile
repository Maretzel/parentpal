# Use an official OpenJDK runtime as the base image
FROM openjdk:21-jdk-slim

# Set working directory inside container
WORKDIR /app

# Copy your built jar file into the container
COPY target/backend-0.0.1-SNAPSHOT.jar ./parentpal-backend.jar

# Expose the port your app listens on (adjust if needed)
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "parentpal-backend.jar"]
