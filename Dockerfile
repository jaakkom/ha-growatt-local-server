ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache perl perl-dev perl-app-cpanminus make build-base musl-obstack-dev && \
  perl -V:make && \
  cpanm Net::MQTT::Simple && \
  cpanm Net::MQTT::Constants && \
  cpanm Data::Hexify && \
  cpanm Proc::ProcessTable --force && \
  cpanm Proc::Daemon && \
  cpanm JSON && \
  true  
  


# Copy data for add-on
COPY . /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
