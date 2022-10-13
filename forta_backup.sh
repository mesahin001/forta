#!/bin/bash
backup () {
        cp /lib/systemd/system/forta.service /root/
		ls -al /root/forta.service
		}
recovery () {
		cp /root/forta.service /lib/systemd/system/
		systemctl daemon-reload
		sleep 3
		systemctl restart forta
		sleep 1
		journalctl -fu forta
		}
PS3="What do you want?: "
select opt in backup recovery quit; 
do
  case $opt in
    backup)
    echo -e '\e[1;32mBackup process begins...\e[0m'
    sleep 1
    backup
    sleep 3
      break
      ;;
	recovery)
    echo -e '\e[1;32mRecovery process begins...\e[0m'
    sleep 1
    recovery
    sleep 3
      break
      ;;  
    quit)
    echo -e '\e[1;32mexit...\e[0m' && sleep 1
      break
      ;;
    *) 
      echo "Invalid $REPLY"
      ;;
  esac
done
