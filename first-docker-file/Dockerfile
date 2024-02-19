FROM ubuntu:latest

#set the working directory in the image
WORKDIR /app

#copy the files from the host file system to the image file system
COPY . /app

#install the necessary packages
RUN apt-get update && apt-get install -y python3 python3-pip

# Set envrionment variables
ENV NAME World

#Run a command to start the application
CMD [ "Python3", "app.py" ]

