#!/bin/sh

# Removes all non-local accounts on machines to help stop HDs from filling up
# Will spare the 'admin,' 'root,' and 'Shared' home directories.

users=`find /Users -type d -maxdepth 1 | cut -d"/" -f3`
# you can edit this to remove only accounts that haven't logged in for x days: add '-mtime +<# of days>' after maxdepth

# Delete any folder that isn't admin, shared, or root
for i in $users; do
    if [[ $i = "admin" ]] || [[ $i = "Shared" ]] || [[ $i = "root" ]]; then continue
    else
	    echo "deleting /Users/$i"
        sudo rm -Rf /Users/$i
    fi
done

exit 0
