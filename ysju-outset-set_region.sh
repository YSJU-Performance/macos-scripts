#!/bin/sh

###############
## variables ##
###############

# Make sure to change these variables
KEYBOARDNAME="British"                        # Keyboard name
KEYBOARDCODE="2"                              # Keyboard layout code (currently set to British)
LANG="en"                                     # macOS language
REGION="en_GB"                                # macOS region

#### These variables can be left alone
PLBUDDY=/usr/libexec/PlistBuddy
SW_VERS=$(sw_vers -productVersion)
BUILD_VERS=$(sw_vers -buildVersion)
ARD="/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart"
CRASHREPORTER_SUPPORT="/Library/Application Support/CrashReporter"
CRASHREPORTER_DIAG_PLIST="${CRASHREPORTER_SUPPORT}/DiagnosticMessagesHistory.plist"

#############################################
######## Do not edit below this line ########
#############################################

###############
## functions ##
###############

update_kdb_layout() {
  ${PLBUDDY} -c "Delete :AppleCurrentKeyboardLayoutInputSourceID" "${1}" &>/dev/null
  if [ ${?} -eq 0 ]
  then
    ${PLBUDDY} -c "Add :AppleCurrentKeyboardLayoutInputSourceID string com.apple.keylayout.${KEYBOARDNAME}" "${1}"
  fi

  for SOURCE in AppleDefaultAsciiInputSource AppleCurrentAsciiInputSource AppleCurrentInputSource AppleEnabledInputSources AppleSelectedInputSources
  do
    ${PLBUDDY} -c "Delete :${SOURCE}" "${1}" &>/dev/null
    if [ ${?} -eq 0 ]
    then
      ${PLBUDDY} -c "Add :${SOURCE} array" "${1}"
      ${PLBUDDY} -c "Add :${SOURCE}:0 dict" "${1}"
      ${PLBUDDY} -c "Add :${SOURCE}:0:InputSourceKind string 'Keyboard Layout'" "${1}"
      ${PLBUDDY} -c "Add :${SOURCE}:0:KeyboardLayout\ ID integer ${KEYBOARDCODE}" "${1}"
      ${PLBUDDY} -c "Add :${SOURCE}:0:KeyboardLayout\ Name string '${KEYBOARDNAME}'" "${1}"
    fi
  done
}

update_language() {
  ${PLBUDDY} -c "Delete :AppleLanguages" "${1}" &>/dev/null
  if [ ${?} -eq 0 ]
  then
    ${PLBUDDY} -c "Add :AppleLanguages array" "${1}"
    ${PLBUDDY} -c "Add :AppleLanguages:0 string '${LANG}'" "${1}"
  fi
}

update_region() {
  ${PLBUDDY} -c "Delete :AppleLocale" "${1}" &>/dev/null
  ${PLBUDDY} -c "Add :AppleLocale string ${REGION}" "${1}" &>/dev/null
  ${PLBUDDY} -c "Delete :Country" "${1}" &>/dev/null
  ${PLBUDDY} -c "Add :Country string ${REGION:3:2}" "${1}" &>/dev/null
}

################
#### Script ####
################

# Change Keyboard Layout
update_kdb_layout "/Library/Preferences/com.apple.HIToolbox.plist" "${KEYBOARDNAME}" "${KEYBOARDCODE}"

for HOME in /Users/*
  do
    if [ -d "${HOME}"/Library/Preferences ]
    then
      cd "${HOME}"/Library/Preferences
      HITOOLBOX_FILES=`find . -name "com.apple.HIToolbox.*plist"`
      for HITOOLBOX_FILE in ${HITOOLBOX_FILES}
      do
        update_kdb_layout "${HITOOLBOX_FILE}" "${KEYBOARDNAME}" "${KEYBOARDCODE}"
      done
    fi
done

# Set the computer language
update_language "/Library/Preferences/.GlobalPreferences.plist" "${LANG}"

for HOME in /Users/*
  do
    if [ -d "${HOME}"/Library/Preferences ]
    then
      cd "${HOME}"/Library/Preferences
      GLOBALPREFERENCES_FILES=`find . -name "\.GlobalPreferences.*plist"`
      for GLOBALPREFERENCES_FILE in ${GLOBALPREFERENCES_FILES}
      do
        update_language "${GLOBALPREFERENCES_FILE}" "${LANG}"
      done
    fi
done

# Set the region
update_region "/Library/Preferences/.GlobalPreferences.plist" "${REGION}"

for HOME in /Users/*
  do
    if [ -d "${HOME}"/Library/Preferences ]
    then
      cd "${HOME}"/Library/Preferences
      GLOBALPREFERENCES_FILES=`find . -name "\.GlobalPreferences.*plist"`
      for GLOBALPREFERENCES_FILE in ${GLOBALPREFERENCES_FILES}
      do
        update_region "${GLOBALPREFERENCES_FILE}" "${REGION}"
      done
    fi
done


# Set the time zone to London
/usr/sbin/systemsetup -settimezone "Europe/London"

# Enable network time servers
/usr/sbin/systemsetup -setusingnetworktime on

# Configure a specific NTP server
/usr/sbin/systemsetup -setnetworktimeserver "time.euro.apple.com"

exit 0
