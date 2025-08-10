FROM ubuntu

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y bash

RUN chmod +x addition.sh

ENTRYPOINT ["sh", "addition.sh"]
