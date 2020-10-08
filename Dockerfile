FROM python:3.6-alpine

LABEL version="0.1"
LABEL description="Simple flask app that greets you"
LABEL maintainer="github.com/macmiranda"

# Set the working directory to /app
WORKDIR /app

# add contents to /app 
ADD *.py /app
ADD *.txt /app

# install dependencies
RUN pip install -r requirements.txt

# run the comman
CMD ["python", "user_greeting_service.py"]
