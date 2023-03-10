FROM imamfahrurrofi/vernemq:1.12.6.2

COPY --chown=vernemq:vernemq ./ssl/ ./ssl/
COPY --chown=vernemq:vernemq ./vmq.acl /etc/vernemq/vmq.acl

ENV DOCKER_VERNEMQ_ALLOW_ANONYMOUS 'off'
ENV DOCKER_VERNEMQ_PLUGINS.vmq_passwd 'on'
ENV DOCKER_VERNEMQ_PLUGINS.vmq_acl 'on'
ENV DOCKER_VERNEMQ_USER_server 'server123'
ENV DOCKER_VERNEMQ_USER_client 'pass123'
ENV DOCKER_VERNEMQ_PERSISTENT_CLIENT_EXPIRATION '1d'
ENV DOCKER_VERNEMQ_LISTENER__WSS__CAFILE './ssl/cert.pem'
ENV DOCKER_VERNEMQ_LISTENER__WSS__CERTFILE './ssl/cert.pem'
ENV DOCKER_VERNEMQ_LISTENER__WSS__KEYFILE './ssl/key.pem'

EXPOSE 1883
EXPOSE 8080
EXPOSE 8443
