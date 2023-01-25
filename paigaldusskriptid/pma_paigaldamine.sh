#!/bin/bash
PMA=$(dpkg-query -W -f="$(Status)" phpmyadmin 2>/dev/null | grep -c "ok installed")
#kui PMA muutuja väärtus võrdub 0-ga
if [ $PMA -eq 0 ]; then
	echo "Paigaldame phpmyadmin ja vajalikud lisad"
	apt install phpmyadmin
	echo "phpmyadmin on paigaldatud"
elif [ $PMA -eq 1 ]; then
	echo "phpmyadmin on juba paigaldatud"
	service phpmyadmin start
	service phpmyadmin status
fi
