#!/bin/bash

set -e

APP_DIR="/home/abinesh/javaapp"
LOG_FILE="/home/abinesh/deploy.log"

echo "============================" >> $LOG_FILE
echo "Deploy started at $(date)" >> $LOG_FILE

cd $APP_DIR

# 🔄 Pull latest code
echo "Pulling latest code..." >> $LOG_FILE
git pull origin main >> $LOG_FILE 2>&1

# 🚀 Run Ansible playbook
echo "Running Ansible..." >> $LOG_FILE
ansible-playbook -i inventory deploy.yml >> $LOG_FILE 2>&1

echo "Deploy completed at $(date)" >> $LOG_FILE