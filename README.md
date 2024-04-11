# Backup and Restore Scripts

## Description

These scripts provide a simple way to backup and restore databases using Docker containers and the Linux cron.

- `backup.sh`: Performs a backup of the database and saves the backup file in the specified directory.
- `restore_backup.sh`: Restores the database from a previously created backup file.

## Requirements

- Docker installed and configured
- Write access to the directory where backup files will be saved

## Usage

### Initial Setup

1. Ensure the scripts have execute permissions. If not, you can give them permissions by running `chmod +x backup.sh restore_backup.sh`.

2. Edit the scripts to configure the necessary variables, such as the Docker container name, MySQL credentials, and paths to backup files.

### Scheduling Backups

You can schedule backups using the Linux cron.

1. Open the user's crontab using the `crontab -e` command.

2. Add the following lines at the end of the file to schedule the backup, replacing `/full/path/to/backup.sh` with the full path to the `backup.sh` file:

   ```bash
   # Example scheduling backup at 2 AM every day
   0 2 * * * /full/path/to/backup.sh >> /full/path/to/log_backup.txt 2>&1
