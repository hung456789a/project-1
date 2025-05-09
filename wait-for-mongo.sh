#!/bin/sh
# Đợi đến khi MongoDB lắng nghe trên cổng 27017
echo "Waiting for MongoDB to be ready..."
until nc -z mongo 27017; do
  sleep 1
done
echo "MongoDB is ready. Starting the app..."
exec java -jar app.jar
