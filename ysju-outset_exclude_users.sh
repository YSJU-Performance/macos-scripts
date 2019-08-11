#!/bin/sh

# Excludes the staff and admin accounts from any outset scripts
/usr/local/outset/outset --add-ignored-user staff
/usr/local/outset/outset --add-ignored-user admin
