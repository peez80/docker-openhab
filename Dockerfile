ARG OH_TAG
FROM openhab/openhab:${OH_TAG}
RUN apt-get clean && apt-get update \
    && apt-get install -y iputils-ping mosquitto-clients openssh-client docker.io \
    && apt-get autoremove

# Create openhab user if it doesn't exist and add to docker group
RUN id openhab >/dev/null 2>&1 || useradd -m -u 9001 -s /bin/bash openhab
RUN usermod -aG docker openhab


    #Skip installing gemini, as it will be called via docker-outside-docker
# Set up Node for Gemini CLI
#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
#ENV NVM_DIR=/root/.nvm
#install node 22
#RUN bash -c "source $NVM_DIR/nvm.sh && nvm install 22"

# Now install Gemini CLI globally using npm
#RUN bash -c "source ~/.bashrc && npm install -g @google/gemini-cli@0.35.3"
