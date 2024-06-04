FROM golang AS builder

WORKDIR /go/app

COPY . .

RUN go build my-app.go



FROM scratch

WORKDIR /go/app

COPY --from=builder /go/app/my-app .

ENTRYPOINT [ "./my-app" ]
