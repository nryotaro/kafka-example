FROM openjdk:17.0.2-slim
RUN useradd -m zookeeper && \
    apt-get update && \
    apt-get install -y curl && \
    curl -L https://dlcdn.apache.org/kafka/3.2.1/kafka_2.13-3.2.1.tgz -o /root/kafka.tgz && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/* && \
    cd /root/ && \
    tar xzf kafka.tgz && \
    chown -R zookeeper:zookeeper kafka_2.13-3.2.1 && \
    mv kafka_2.13-3.2.1 /home/zookeeper/kafka
USER zookeeper
WORKDIR /home/zookeeper
ENTRYPOINT ["kafka/bin/zookeeper-server-start.sh", "kafka/config/zookeeper.properties"]
