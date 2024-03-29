FROM centos:7
MAINTAINER breakinfenro <1972952841@qq.com>

RUN mkdir -p /app/bin
RUN echo $CLIENT_ADDR
ENV PATH="/app/bin:/go/bin:${PATH}"

ADD etcd/etcd /app/bin
ADD etcd/etcdctl /app/bin
ADD Procfile /app
ADD goreman/goreman /app
EXPOSE 2379 22379 32379 2380 22380 32380
WORKDIR /app

CMD ["/app/goreman", "start"]