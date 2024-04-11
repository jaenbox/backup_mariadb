echo '##                 BACKUP                           ##'
echo '######################################################'
# Get values
docker_container='fireflyIII_db'
mysql_user_raw=$(grep -i "MYSQL_USER" .db.env)
mysql_password_raw=$(grep -i "MYSQL_PASSWORD" .db.env)
mysql_database_raw=$(grep -i "MYSQL_DATABASE" .db.env)
# Format raw data
user=$(echo "$mysql_user_raw" | cut -d '=' -f 2)
passwd=$(echo "$mysql_password_raw" | cut -d '=' -f 2)
db=$(echo "$mysql_database_raw" | cut -d '=' -f 2)

backup_name="backup_$db_$(date +'%Y%m%d').sql"

echo  'execute backup'
$(docker exec $docker_container mariadb-dump --databases $db -u$user -p$passwd > backups/$backup_name)
echo 'end backup'