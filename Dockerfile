FROM anapsix/alpine-java 
LABEL maintainer="shanem@liatrio.com" 
COPY /target/JavaCalculator-1.0-SNAPSHOT.jar /home/JavaCalculator-1.0-SNAPSHOT.jar 
CMD ["java","-jar","/home/JavaCalculator-1.0-SNAPSHOT.jar"]