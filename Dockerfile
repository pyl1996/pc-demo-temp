FROM maven:3.8.4-jdk-11 as build
WORKDIR /app
COPY app /app
RUN mvn clean package


FROM tomcat:9.0-slim
COPY flag /flag
EXPOSE 8080
COPY --from=build /app/target/helloworld.war $CATALINA_HOME/webapps

RUN echo "credit card number: 4321-1234-1234-1234" >> /var/tmp/importantdata.txt
RUN echo "credit card number: 4321-1234-1234-1234" >> /var/tmp/importantdata.txt
Run echo "AWS_ACCESS_KEY_ID=yLryKGwcGc3ez9G8YAnjeYMQOc" >> /var/tmp/secret.txt
Run echo "AWS_SECRET_ACCESS_KEY=nAH2VzKrMrRjySLlt8HCdFU3tM2TUuUZgh39NX" >> /var/tmp/secret.txt
