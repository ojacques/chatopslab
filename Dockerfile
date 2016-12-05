FROM gcr.io/google_appengine/nodejs

ARG DOCKER_VERSION=1.12.1
ARG DOCKER_COMPOSE=1.9.0
RUN curl -so /tmp/docker.tgz https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz && \
    tar -xvzf /tmp/docker.tgz docker/docker && \
    rm -f /tmp/docker.tgz && \
    mv docker/docker /bin && \
    curl -Lo /bin/docker-compose https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE/run.sh && \
    chmod +x /bin/docker*

# Copy application code.
COPY . /root/chatopslab/

WORKDIR /root/chatopslab/hubot

# Install dependencies.
RUN npm --unsafe-perm install

CMD /root/chatopslab/hubot/start.sh
