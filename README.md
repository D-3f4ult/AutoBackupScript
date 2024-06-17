# Auto Backup Script

This script automatically creates backups of files from a specified source directory to a destination directory. The backups are compressed, and backups older than 7 days are automatically deleted to save space.

## Requirements
- A Unix-like operating system (Linux, macOS, or WSL on Windows)
- Bash shell
- tar utility
- cron (for scheduling, if desired)

## Usage

### 1. Clone the repository:
```bash
git clone https://github.com/yourusername/AutoBackupScript.git
2. Navigate to the project directory:
cd AutoBackupScript
3. Make the script executable:
chmod +x backup_script.sh
4. Configure the script:
Edit the backup_script.sh file to set the SOURCE_DIR and BACKUP_DIR variables according to your needs:

SOURCE_DIR="$HOME/Documents"  # The source directory for backups
BACKUP_DIR="$HOME/Backup"     # The destination directory for backups
5. Run the script:
./backup_script.sh
cheduling the Backup
You can schedule the script to run at regular intervals using cron. To edit the crontab file:

crontab -e
Add a line to run the script daily at 2 AM:

0 2 * * * /path/to/backup_script.sh

The script performs the following steps:

Checks if the destination directory exists, and creates it if it doesn't.
Compresses the files from the source directory into a tar.gz archive in the destination directory.
Logs the success or failure of the backup operation.
Deletes backups older than 7 days to free up space.
Example Log Output
The script logs its actions to a log file in the backup directory (backup.log):
2024-06-17_14-30-00: Backup successful: backup_2024-06-17_14-30-00.tar.gz
2024-06-18_14-30-00: Backup successful: backup_2024-06-18_14-30-00.tar.gz
...

Ensure you have write permissions in the destination directory.
Ensure you have enough space to store the backups.
License
This project is licensed under the MIT License - see the LICENSE file for details.
