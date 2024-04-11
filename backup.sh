echo '######################################################'
echo '##                 BACKUP                           ##'
echo '######################################################'



echo 'Get values'
docker_container='fireflyIII_db'
mysql_user_raw=grep -i "MYSQL_USER" .db.env
mysql_password_raw=grep -i "MYSQL_DATABASE" .db.env
mysql_database_raw=grep -i "MYSQL_DATABASE" .db.env


echo  'execute backup'
$(sudo docker exec fireflyIII_db mariadb-dump --databases firefly -ufirefly -psecret_firefly_password > backup20240410.sql)
echo 'end backup'