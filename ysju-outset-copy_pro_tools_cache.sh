#!/bin/bash

# Copies the Pro Tools cache files into the user directory to avoid rescanning of plugins on load
# Requires Pro Tools Cache pkg to be installed in /Users/Shared/.admin_tmp

rm -rf ~/Library/Preferences/Pro\ Tools
/usr/bin/ditto /Users/Shared/.admin_tmp/Pro\ Tools/Library/Preferences/Pro\ Tools ~/Library/Preferences/Avid/Pro\ Tools
