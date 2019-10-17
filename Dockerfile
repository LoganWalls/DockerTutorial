# This is a Dockerfile. This is where you can tell Docker how to set up your
# virtual computer. Docker will follow your instructions step by step until the
# setup is complete.

# The FROM command lets you use an existing image as a starting
# point instead of starting from scratch. Docker will first look at the images
# on your computer, and if it cannot find the image you asked for then it will
# search DockerHub for the image.
# You can search for publicly available images here: https://hub.docker.com

# Let's start with an image that already has python installed.
FROM python:3.8.0-buster 

# The RUN command lets you execute commands in the container's shell.
# The python image we chose comes with Linux installed, so we can use Linux
# shell commands.
RUN mkdir -p /docker_tutorial/test-data

# The WORKDIR command sets the working directory inside your container.
# This means two things:
# 1) Subsequent commands in this Dockerfile will be executed relative to the working directory.
# 2) When you run this image, it will start at the working directory.
WORKDIR /docker_tutorial

# The COPY command lets you copy files between your computer and the container:
# COPY [FROM HERE] [TO HERE]
# Here we are copying our sample data and our script from our computer into the container.
# Notice that the first path is on your machine, and the second path is inside the container.
COPY data/sample.txt test-data/
COPY script.py .

# CMD Specifies what command should be executed when the container gets run.
# Let's tell it to run our sample script.
CMD [ "python", "script.py" ]   