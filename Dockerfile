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
WORKDIR /
COPY --from=builder /main .
CMD ["/main"]
