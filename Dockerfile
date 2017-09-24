FROM golang:1.9
LABEL maintainer="steven.rachman@gmail.com"

RUN curl -sL https://deb.nodesource.com/setup_8.x \
  | bash - \
  && apt-get install --no-install-recommends -y npm

RUN go get github.com/jteeuwen/go-bindata/... \
  && go get github.com/tools/godep

WORKDIR /go/src/github.com/yudai/gotty
COPY . ./
RUN make

EXPOSE 8080
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV PATH $PATH:/usr/games
RUN apt-get install --no-install-recommends -y cmatrix sl
CMD ["./gotty", "cmatrix"]
