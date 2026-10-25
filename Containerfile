FROM docker.io/library/alpine:latest
RUN apk --no-cache add arti
USER arti
ENTRYPOINT ["arti"]
CMD ["proxy"]
