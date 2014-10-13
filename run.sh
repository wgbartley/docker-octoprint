#!/bin/bash

sudo docker run -t -d -p 5000:5000 --privileged -v /dev/ttyACM0:/dev/ttyACM0 -v $(pwd)/data:/storage --name=OctoPrint odroid_u3/octoprint
