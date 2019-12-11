usr_local ?= /usr/local

bindir = $(usr_local)/bin
libdir = $(usr_local)/lib

build:
	swift build -c release --disable-sandbox

install: build
	install ".build/release/pecker" "$(bindir)"

uninstall:
	rm -rf "$(bindir)/pecker"
	
clean:
	rm -rf .build

# https://forums.swift.org/t/indexstoredb-support-error/28253
genProject:
	swift package generate-xcodeproj --xcconfig-overrides overrides.xcconfig

.PHONY: build install uninstall clean genProject
