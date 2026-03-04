#!/bin/bash

# To check the existing jobs - crontab -l
# To add new job - crontab -e
# To remove a job - crontab -r

# * * * * * <command>
# │ │ │ │ │
# │ │ │ │ └─ Day of week (0-7, 0 or 7 = Sunday)
# │ │ │ └── Month (1-12)
# │ │ └── Day of month (1-31)
# │ └── Hour (0-23)
# └── Minute (0-59)

# * * * * * cd /home/paul/scripts && ./create_file.sh

# For every minute
# * * * * 1 cd /Users/srikriydv/Desktop/infra.crux/shell_scripting/12_other_concepts/ && ./02_cron.sh

echo "Cron Job started $RANDOM $(date)" >> output/cron_log.txt 2>&1