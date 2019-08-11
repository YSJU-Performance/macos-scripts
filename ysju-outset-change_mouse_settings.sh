#!/bin/bash

# Outset login-every script to set default values for mouse settings on each login.

# Change mouse and trackpad tracking speed
defaults write -g com.apple.mouse.scaling 3
defaults write -g com.apple.trackpad.scaling 2.5

# Enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable two button mouse
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton
defaults write com.apple.driver.AppleHIDMouse Button2 -integer 2

exit 0
