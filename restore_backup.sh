echo '######################################################'
echo '##                 RESTORE BACKUP                   ##'
echo '######################################################'

echo 'execute restore'
docker_container='fireflyIII_db'
$(sudo docker exec -i fireflyIII_db sh -c 'exec mariadb -ufirefly -p"secret_firefly_password"' < backup20240410.sql)
echo 'end restore'