# Backup and Restore Scripts

## Description

These scripts provide a simple way to backup and restore databases using Docker containers and the Linux cron.
These scripts have been created to address the issues I encountered with Firefly III when making backups. Firefly III is a personal finance manager that runs on a web server with a MariaDB database backend. While using Firefly III, I found that the built-in backup functionality was not meeting my needs effectively. Therefore, I developed these scripts to provide a simple and reliable way to backup and restore the MariaDB database associated with Firefly III.

- `backup.sh`: Performs a backup of the MariaDB database running in a Docker container and saves the backup file in the specified directory.
- `restore_backup.sh`: Restores the MariaDB database from a previously created backup file.

## Requirements

- Docker installed and configured
- Write access to the directory where backup files will be saved

## Usage

### Initial Setup

1. Ensure the scripts have execute permissions. If not, you can give them permissions by running `chmod +x backup.sh restore_backup.sh`.

2. Edit the scripts to configure the necessary variables, such as the Docker container name, MySQL credentials, and paths to backup files.
   
3. The MariaDB configuration parameters, including the credentials to access the database, are retrieved from the `.db.env` file. This file stores environment variables used by the MariaDB Docker container, such as `MYSQL_USER`, `MYSQL_PASSWORD`, and `MYSQL_DATABASE`.


### Scheduling Backups

You can schedule backups using the Linux cron.

1. Open the user's crontab using the `crontab -e` command.

2. Add the following lines at the end of the file to schedule the backup, replacing `/full/path/to/backup.sh` with the full path to the `backup.sh` file:

   ```bash
   # Example scheduling backup at 2 AM every day
   0 2 * * * /full/path/to/backup.sh >> /full/path/to/log_backup.txt 2>&1
# Backup and Restore Scripts

## Description

These scripts provide a simple way to backup and restore databases using Docker containers and the Linux cron.

- `backup.sh`: Performs a backup of the MariaDB database running in a Docker container and saves the backup file in the specified directory.
- `restore_backup.sh`: Restores the MariaDB database from a previously created backup file.

## Requirements

- Docker installed and configured
- Write access to the directory where backup files will be saved

## Usage

### Initial Setup

1. Ensure the scripts have execute permissions. If not, you can give them permissions by running `chmod +x backup.sh restore_backup.sh`.

2. Edit the scripts to configure the necessary variables, such as the name of the Docker container, MariaDB credentials, and paths to backup files.

### Scheduling Backups

You can schedule backups using the Linux cron.

1. Open the user's crontab using the `crontab -e` command.

2. Add the following lines at the end of the file to schedule the backup, replacing `/full/path/to/backup.sh` with the full path to the `backup.sh` file:

   ```bash
   # Example scheduling backup at 2 AM every day
   0 2 * * * /full/path/to/backup.sh >> /full/path/to/log_backup.txt 2>&1

## Docker Official Image

For running MariaDB in Docker containers, you can use the official Docker image provided by MariaDB. You can find more information about the official image [here](https://hub.docker.com/_/mariadb).

## Firefly III

If you're using Firefly III with this project, you can find more information and resources in the [Firefly III repository](https://github.com/firefly-iii/firefly-iii).

## Contributors

We appreciate the contributions of the following individuals:

- [@jaenbox](https://github.com/jaenbox)

Thank you for helping to improve this project!
