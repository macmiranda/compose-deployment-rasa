FROM python:3.6-alpine

LABEL version="0.2"
LABEL description="Simple flask app that greets you"
LABEL maintainer="github.com/macmiranda"

# Set the working directory to /app
RUN mkdir /app
WORKDIR /app

# add contents to /app 
ADD *.py /app
ADD *.txt /app
ADD *.ini /app

# install dependencies
RUN apk add --no-cache --virtual .build-deps build-base linux-headers python3-dev \
    && pip install -r requirements.txt \
    && apk del .build-deps \
    && rm -rf `pip cache dir`

# run the comman
CMD ["uwsgi", "--ini", "user_greeting_service.ini"]
