ARG OH_TAG
FROM openhab/openhab:${OH_TAG}
RUN apt-get clean && apt-get update \
    && apt-get install -y iputils-ping mosquitto-clients openssh-client \
    && apt-get autoremove


# Set up Node for Gemini CLI
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
ENV NVM_DIR=/root/.nvm
#install node 22
RUN bash -c "source $NVM_DIR/nvm.sh && nvm install 22"

# Now install Gemini CLI globally using npm
RUN bash -c "source ~/.bashrc &&npm install -g @google/gemini-cli"
