FROM docker.io/library/alpine:latest
RUN apk --no-cache add arti
COPY arti.toml /etc/arti/arti.toml
USER arti
ENTRYPOINT ["arti"]
CMD ["proxy","--config","/etc/arti/arti.toml"]
