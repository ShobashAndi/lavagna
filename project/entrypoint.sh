#!/bin/sh

while ! nc -zv mysql 3306; do
echo "Waiting for MySQL to be available..."
sleep 5
done

exec java -Xms64m -Xmx128m \
-Ddatasource.dialect="${DB_DIALECT}" \
-Ddatasource.url="${DB_URL}" \
-Ddatasource.username="${DB_USER}"  \
-Ddatasource.password="${DB_PASS}" \
-Dspring.profiles.active="${SPRING_PROFILE}"  \
-jar lavagna-jetty-console.war --headless
