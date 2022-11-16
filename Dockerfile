FROM alpine:latest

RUN apk update && apk add --no-cache postgresql-client py-pip && \
  pip install awscli && \
  mkdir /backup

ENV S3_PATH=postgres AWS_DEFAULT_REGION=us-east-1

COPY entrypoint.sh /usr/local/bin/entrypoint
COPY backup.sh /usr/local/bin/backup
ENV Postgres_URI=
VOLUME /backup

CMD /usr/local/bin/entrypoint
