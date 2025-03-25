 # Docker file for demo purposes

# Alpine - so download is fast
FROM maven:3.6.3-openjdk-8
#ROM openjdk:8-jre-alpine

RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./project . 

#RUN mvn clean install
RUN mvn install


#ENV DB_DIALECT="MYSQL"
#ENV DB_URL="jdbc:mysql://mysql:3306/lavagna?autoReconnect=true&useSSL=false"
#ENV DB_USER="lavagna"
#ENV DB_PASS="lavagna_pass"
#ENV SPRING_PROFILE="dev"

EXPOSE 8080

COPY ./project/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Execute the web archive
ENTRYPOINT ["./entrypoint.sh"]


