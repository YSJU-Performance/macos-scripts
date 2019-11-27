#!/bin/bash

# Copies the Sibelius cache files into the user directory to avoid rescanning of plugins on load
# Requires Sibelius Cache pkg to be installed in /Users/Shared/.admin_tmp

rm -rf ~/Library/Application\ Support/Native\ Instruments
/usr/bin/ditto /Users/Shared/.admin_tmp/Native\ Instruments/Library/Application\ Support/Native\ Instruments ~/Library/Application\ Support/Native\ Instruments
