#FROM scratch
#ADD main /
#CMD ["/main"]

FROM golang as builder
ENV GO111MODULE on
WORKDIR /
COPY . .
RUN go get -u
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o main .

FROM scratch
COPY --from=builder /main .
CMD ["/main"]

# docker run -it --rm -v /data/mes-9200/auto/config.yml:/config.yml --env CONFIG_PATH=/config.yml -p 1323:1323 test
