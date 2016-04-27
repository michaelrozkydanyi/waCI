#!/bin/bash
#
# Clean up Loopback Devices
# Running losetup -a on the Drone host, and seeing a list of devices
# This method has been working without a hitch since I employed it, and periodic losetup -a's on my host confirm that no loop devices are being leaked.
#start-stop-daemon --stop --pidfile "/var/run/docker.pid"

