#!/bin/sh
radiusd start
while true; do echo hello world; sleep 1; done
exec $@

