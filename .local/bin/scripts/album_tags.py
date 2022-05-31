#!/bin/python

import os
import sys
import eyed3

path = str(sys.argv[1])
artist = str(sys.argv[2])
album = str(sys.argv[3])

files = os.listdir(path)

for f in files:
	file = os.path.splitext(f)[0]
	audiofile = eyed3.load(path+"/"+f)
	audiofile.tag.artist = artist
	audiofile.tag.album = album
	audiofile.tag.title = file
	audiofile.tag.save()


