#!/bin/sh

# Wipes the student user folders on logout

userFolder="student"

rm -Rf /Users/$userFolder/Applications/* 
rm -Rf /Users/$userFolder/Desktop/* 
rm -Rf /Users/$userFolder/Documents/* 
rm -Rf /Users/$userFolder/Downloads/* 
rm -Rf /Users/$userFolder/Movies/* 
rm -Rf /Users/$userFolder/Music/* 
rm -Rf /Users/$userFolder/Pictures/* 
rm -Rf /Users/$userFolder/Public/*

touch "/Users/$userFolder/Documents/__DO NOT LEAVE FILES HERE"
touch "/Users/$userFolder/Downloads/__DO NOT LEAVE FILES HERE"
touch "/Users/$userFolder/Movies/__DO NOT LEAVE FILES HERE"
touch "/Users/$userFolder/Music/__DO NOT LEAVE FILES HERE"
touch "/Users/$userFolder/Pictures/__DO NOT LEAVE FILES HERE"
touch "/Users/$userFolder/Public/__DO NOT LEAVE FILES HERE"
