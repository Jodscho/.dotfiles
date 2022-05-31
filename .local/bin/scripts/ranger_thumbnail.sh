#!/bin/bash
#echo "$1"
#echo "$2"
ffmpeg -i "$1" -map 0:v -map -0:V -c copy "$2" 
