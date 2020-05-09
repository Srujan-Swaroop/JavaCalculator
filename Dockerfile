FROM openjdk:8-alpine
COPY /target/my-app-1.0-SNAPSHOT.jar /home/my-app-1.0-SNAPSHOT.jar
CMD ["java","-cp","/home/my-app-1.0-SNAPSHOT.jar","Calculator"]
