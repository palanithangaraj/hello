# Dockerfile
FROM golang:1.24-alpine AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o go-app .

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/go-app .

EXPOSE 8080

CMD ["./go-app"]