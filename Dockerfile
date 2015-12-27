# We have selected Ubuntu, version 14.04
FROM ubuntu:14.04

# The owner/author of the file
MAINTAINER javatab

RUN apt-get update && apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository ppa:webupd8team/java

RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections

RUN apt-get update && apt-get install -y oracle-java8-installer maven

# Add the files to the container
ADD . /usr/local/helloworld

# Commands to run the container
RUN cd /usr/local/helloworld && mvn install

CMD ["java", "-cp", "/usr/local/helloworld/target/dockerizing-java-0.0.1-SNAPSHOT.jar", "HelloWorld"]
