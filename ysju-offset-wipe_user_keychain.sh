#!/bin/sh

# Wipes the student user keychain on logout

userFolder="student"

rm -Rf /Users/$userFolder/Library/Keychains/*
