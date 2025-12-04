ARG OH_TAG
FROM openhab/openhab:${OH_TAG}
RUN apt-get clean && apt-get update \
    && apt-get install -y iputils-ping mosquitto-clients openssh-client \
    && apt-get autoremove
