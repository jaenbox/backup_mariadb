echo '######################################################'
echo '##                 RESTORE BACKUP                   ##'
echo '######################################################'

# Get values
docker_container='fireflyIII_db'
mysql_user_raw=$(grep -i "MYSQL_USER" .db.env)
mysql_password_raw=$(grep -i "MYSQL_PASSWORD" .db.env)
# Format raw data
user=$(echo "$mysql_user_raw" | cut -d '=' -f 2)
passwd=$(echo "$mysql_password_raw" | cut -d '=' -f 2)

echo "Please enter the SQL file to restore (e.g., backups/backupXXXXXX.sql):"
read file
echo "Are you sure you want to restore this database? (Y/n)"
read confirmation
confirmation=$(echo "$confirmation" | tr '[:upper:]' '[:lower:]')

# Check the user's input
if [ "$confirmation" = "y" ]; then
    echo "Database restoration confirmed. Wait a moment..."
    # Proceed with the restoration process here
elif [ "$confirmation" = "n" ]; then
    echo "Database restoration cancelled."
else
    echo "Invalid input. Please enter 'Y' or 'n'."
fi

if [ ! -f "$file" ]; then
    echo "The file $file does not exist."
else
    $(docker exec -i $docker_container sh -c "exec mariadb -u$user -p'$passwd'" < $file)
    echo 'end restore'
    echo 'enjoy your restored copy :)'
fi