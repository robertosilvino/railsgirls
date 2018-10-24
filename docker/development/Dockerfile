FROM robertosilvino/railsgirls-dev-base:latest

WORKDIR ${APP_DIR}

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose Nginx HTTP service
EXPOSE $RACK_PORT
