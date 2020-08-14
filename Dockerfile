# Based on the latest GO image
FROM golang:1.15

MAINTAINER John Godson <johngodson90@gmail.com>

# cloning the repository from the remote
RUN yum install -y git &&\
git clone -b master https://github.com/Fullscript/go-web-server.git

# creating the folder for working direcoty and define it 
WORKDIR $GOPATH/go/webapp
RUN chmod -R 775 $GOPATH/go/webapp

#copy the main file from the local repo and move to working directory
COPY . $GOPATH/go/webapp/

# building the main fil,assuming the server has alreaydy go installed and configured
RUN cd $GOPATH/go/webapp && go build -o main 

# open the port 8080 for application 
EXPOSE 8080

# Executing the main file after the conatiner starts
CMD ["/bin/bash"]
ENTRYPOINT "./main"
