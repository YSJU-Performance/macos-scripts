#!/bin/bash

# Copies the Sibelius cache files into the user directory to avoid rescanning of plugins on load
# Requires Sibelius Cache pkg to be installed in /Users/Shared/.admin_tmp

rm -rf ~/Library/Caches/AudioUnitCache
/usr/bin/ditto /Users/Shared/.admin_tmp/Logic/Library/Caches/AudioUnitCache ~/Library/Caches/AudioUnitCache

rm -rf ~/Music/Audio\ Music\ Apps/Databases
/usr/bin/ditto /Users/Shared/.admin_tmp/Logic/Music/Audio\ Music\ Apps/Databases ~/Music/Audio\ Music\ Apps/Databases