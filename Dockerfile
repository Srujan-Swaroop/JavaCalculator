FROM openjdk:8-alpine
COPY target/JavaCalculator-1.0-SNAPSHOT.jar /home/JavaCalculator-1.0-SNAPSHOT.jar
CMD ["java","-cp","/home/JavaCalculator-1.0-SNAPSHOT.jar","Calculator"]
