FROM anapsix/alpine-java 
COPY /target/JavaCalculator-1.0-SNAPSHOT.jar /home/JavaCalculator-1.0-SNAPSHOT.jar 
CMD ["java","-jar","/home/JavaCalculator-1.0-SNAPSHOT.jar"]