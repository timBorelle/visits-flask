# our base image
FROM alpine:latest

# Install python and pip
RUN apk add --update py2-pip

# upgrade pip
RUN pip install --upgrade pip

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY app.py /usr/src/app/

# tell the port number the container should expose
EXPOSE 80

# run the application
CMD ["python", "/usr/src/app/app.py"]
