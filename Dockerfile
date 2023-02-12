FROM golang:1.14.2 AS build

WORKDIR /go/src/app
COPY ./src .

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /go/bin/app

FROM scratch
COPY --from=build /go/bin/app /app

ENTRYPOINT ["/app"]