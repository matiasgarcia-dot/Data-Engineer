# Settings
path_origin="/home/kali/Desktop/Origin/"
path_destiny="/home/kali/Desktop/Destiny/"
date=$(date +"%Y-%m-%d_%H-%M-%S")
log_folder="$path_destiny/logs/"
file_backup="$path_destiny/backup_$date.tar.gz"
log="$log_folder/backup_$date.log"

# Make folder of backrest and logs if they don't exist
mkdir -p "$path_destiny"
mkdir -p "$log_folder"

# Make backup compressed
echo "Starts backup: $date" > "$log"   
tar -czf "$file_backup" -C "$path_origin" . >> "$log" 2>&1

# Verify if tar was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully: $date" >> "$log"
    echo "File generated: $file_backup" >> "$log"
else
    echo "Error during the backup: $date" >> "$log"
fi
