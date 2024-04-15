#Build stage
FROM golang:1.21-alpine3.18 AS builder 
WORKDIR /app
COPY . .
RUN go build -o main main.go


#Run stage
FROM alpine
WORKDIR /app 
COPY --from=builder /app/main .
COPY app.env .
COPY start.sh .
COPY wait-for.sh .
COPY db/migration ./db/migration
RUN chmod +x /app/start.sh 
RUN chmod +x /app/wait-for.sh

EXPOSE 8080 9090 
CMD [ "/app/main" ]
ENTRYPOINT [ "/app/start.sh" ]