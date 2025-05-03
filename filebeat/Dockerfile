FROM docker.elastic.co/beats/filebeat:9.0.0
ENV setup.kibana.host=kibana:5601
ENV output.elasticsearch.hosts=["elasticsearch:9200"]
COPY filebeat.docker.yml /usr/share/filebeat/filebeat.yml