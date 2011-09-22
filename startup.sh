#This script should be run as the user admin. Do not sudo.

#This sets the current directory for the commands
cd /var/data/app/current/
#This starts the software so that thumbnails can be made.
god -c config/god/all.god
#This makes the shell wait 2 minutes, and then checks on the processes
sleep 120
if `god -c config/god/all.god | grep resque -c ` == 4
then
#if there are 4 processes then everything worked, so exit with no errors 
return 0
else 
#something is wrong, e-mail for some help and return error code -1
SUBJECT="CALL THE LINUX SYSADMIN!"
EMAIL="patrick.mcmorran@yale.edu"
EMAILMESSAGE="/tmp/emergencymsg.txt"
echo "Time: `date`" >> $EMAILMESSAGE
echo "Warning: The Threads for thumbnails are misbehaving" >> $EMAILMESSAGE
/bin/mail -s "$SUBJECT" "$EMAIL" < $EMAILMESSAGE
return -1
fi
