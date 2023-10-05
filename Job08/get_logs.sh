user="laplateforme"
chmod +x get_logs.sh
Ctime=$(date +"%d-%m-%Y-%H:%M")
echo $(cat /var/log/auth.log | grep "session opened for user $user" | wc -l) > "number_connection-$Ctime"
tar "-cf" "Backup/$Ctime.tar" "number_connection-$Ctime"
rm "number_connection-$Ctime"
if [ $(cat /etc/crontab | grep "get_logs.sh" | wc -l) = "0" ]
then
    echo "*/30 * * * * root \"$(pwd)/get_logs.sh\"" >> /etc/crontab
fi
