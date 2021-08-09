
VERSION:=$(shell git describe --always)

release:
	echo $(VERSION)