#!/bin/bash

# Copies the Sibelius cache files into the user directory to avoid rescanning of plugins on load
# Requires Sibelius Cache pkg to be installed in /Users/Shared/.admin_tmp

rm -rf ~/Library/Application\ Support/Avid/Sibelius
/usr/bin/ditto /Users/Shared/.admin_tmp/Application\ Support/Avid/Sibelius ~/Library/Application\ Support/Avid/Sibelius
