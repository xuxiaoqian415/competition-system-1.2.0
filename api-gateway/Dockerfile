FROM jdk:8
MAINTAINER xuxiaoqian "1065791875@qq.com"
LABEL Description="gateway" Vendor="xuxiaoqian" Version="1.2.0"
RUN mkdir -p /opt/app
COPY ./api-gateway-1.2.0.jar /opt/app/app.jar
ENV JAVA_HOME /opt/jdk/jdk1.8.0_333
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $JAVA_HOME/bin:$PATH
EXPOSE 9500
ENTRYPOINT ["java","-jar","-Xms64m","-Xmx64m","-Xmn32m","-Xss1024k","/opt/app/app.jar"]
#ENTRYPOINT ["java","-jar","-Xms64m","-Xmx64m","-Xmn32m","-Xss1024k","-Dspring.profiles.active=prod","/opt/app/app.jar"]