#!/bin/bash

#Turns on show Hard Disks, External disks, CDs, DVDs, and iPads, and Connected Servers
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true;
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true;
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true;
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true;

#Shows Status Bar

defaults write com.apple.finder ShowStatusBar -bool true;

#Shows Tab View

defaults write com.apple.finder ShowTabView -bool true;

#Shows Path Bar

defaults write com.apple.finder ShowPathbar -bool true;

#Changes Finder to Column View
#Four-letter codes for the other view modes: 'icnv', 'clmv', 'Flwv', 'Nlsv'

defaults write com.apple.finder FXPreferredViewStyle -string 'clmv'

#New Finder windows now opens in /Users/<username>

defaults write com.apple.finder NewWindowTarget -string 'PfHm'

#Turns off re-open programs/windows after restart/login/shutdown

defaults write com.apple.loginwindow.plist TALLogoutSavesState -bool false

#Restarts cfprefsd and Finder

killAll cfprefsd
killAll Finder

echo "Finder Preferences set"

exit 0
