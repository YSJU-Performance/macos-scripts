#!/bin/bash

# Outset login-once script setting the default network order to prioritise Wi-Fi

networksetup -ordernetworkservices "Wi-Fi" "Ethernet" "Thunderbolt Bridge" "Bluetooth PAN"
