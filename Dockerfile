FROM aimvector/fluentd-demo:latest
RUN gem install fluent-plugin-parser-cri --no-document
COPY entrypoint.sh /fluentd/entrypoint.sh
RUN chmod +x /fluentd/entrypoint.sh
ENTRYPOINT ["tini", "--", "/fluentd/entrypoint.sh"]