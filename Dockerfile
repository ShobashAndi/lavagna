 # Docker file for demo purposes

# Alpine - so download is fast
FROM maven:3.6.3-openjdk-8 AS build
#ROM openjdk:8-jre-alpine

WORKDIR /app

COPY ./project .

#RUN mvn clean install
RUN mvn install

FROM openjdk:8-jre-alpine

WORKDIR /app

# Install netcat (if required for debugging or wait-for-db scripts)
RUN apk add --no-cache netcat-openbsd

# Copy built artifacts from the build stage
COPY --from=build /app/target/lavagna-jetty-console.war /app/

# Copy the entrypoint script
COPY ./project/entrypoint.sh .
RUN chmod +x entrypoint.sh

# Expose application port
EXPOSE 8080


# Execute the web archive
ENTRYPOINT ["./entrypoint.sh"]


