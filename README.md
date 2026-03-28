Simple dockerimage with openhab/openhab as base, adding some tools via apt-get.


# Gemini docker-outside-docker
docker run -v /var/run/docker.sock:/var/run/docker.sock -it [IMAGE]