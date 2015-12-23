# OpenHAB Dockerfile

# STILL UNDER CONSTRUCTION

Docker Container with the current OpenHAB Version 1.7.1 and Java8.

Run container with

    docker run -itd -p 8080:8080 peez/openhab

## Container Parametrization
There are several parameters that can be passed to the container for configuring OpenHAB.

### Mounting Config directory
This probably will be the most used parametrization in order to store the configuration persistent to your local disk. There are two ways to do this, in private docker containers I always recommend the host volume mappings over data volumes.
Mount a configuration directory on the host:

    docker run -itd -v /config/dir/on/host:/opt/openhab/configurations peez/openhab
### Configuring Bindings
For Performance Reasons no Bindings are activated by default but they are delivered for configuration with the OpenHAB image. All binding jars are available inside the container at /opt/openhab-all-bindings.
For activating a binding it is recommended to create a Dockerfile enhancing peez/openhab and creating symlinks for the binding jar. (TODO: Create a start-script to activate bindings passed by environment variables)

    FROM peez/openhab
	MAINTAINER me@stiffi.de
	RUN ln -s org.openhab.binding.milight-1.7.1.jar /opt/openhab/addons/org.openhab.binding.milight-1.7.1.jar

Of course it's also possible to copy or move a addon directly to /opt/openhab/addons.

## Access to OpenHAB
After launching the container, HABMin is reachable at:

    http://localhost:8080/habmin

### Demo Application
When not mounting a configuration directory, the OpenHAB Demo Application is installed and reachable at:

    http://localhost:8080/TODOTODO

