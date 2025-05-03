FROM docker.elastic.co/elasticsearch/elasticsearch:9.0.0
ENV discovery.type=single-node
ENV ELASTIC_PASSWORD=123456
ENV ELASTIC_USERNAME=elastic
COPY elasticsearch.yml /usr/share/elasticsearch/config/
COPY jvm.options /usr/share/elasticsearch/config/
COPY log4j2.file.properties /usr/share/elasticsearch/config/