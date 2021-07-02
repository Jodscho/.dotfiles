#!/bin/bash

kill -s SIGTERM $(pgrep dwmblocks) && dwmblocks &
