FROM golang:1.16

WORKDIR /backend

RUN apt-get update && apt-get install git
RUN git clone https://github.com/docker-hy/material-applications.git /backend

WORKDIR /backend/example-backend

RUN go build server
RUN go test ./...


ENV PORT=$PORT
EXPOSE $PORT

ARG REQUEST_ORIGIN
ENV REQUEST_ORIGIN=$REQUEST_ORIGIN

CMD ["./server", "-l", "$PORT"]
