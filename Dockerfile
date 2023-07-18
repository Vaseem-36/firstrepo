#create a docker file using openjdk 17 alpine
#copy the jar file to the docker image
#execute the jar file
#expose the port 8080

FROM openjdk:17-alpine
#jar name demo-0.0.1-SNAPSHOT.jar
COPY target/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/demo-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080


