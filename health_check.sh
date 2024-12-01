#!/bin/bash

# Log file for debugging
LOG_FILE="health_check.log"

# Function to log messages
log_message() {
    echo "$(date): $1" >> "$LOG_FILE"
}

# Function to check disk usage
check_disk_usage() {
    log_message "Checking disk usage..."
    echo "Disk Usage:"
    df -h
}

# Function to monitor running services
monitor_running_services() {
    log_message "Monitoring running services..."
    echo "Running Services:"
    systemctl list-units --type=service --state=running
}

# Function to assess memory usage
assess_memory_usage() {
    log_message "Assessing memory usage..."
    echo "Memory Usage:"
    free -m
}

# Function to evaluate CPU usage
evaluate_cpu_usage() {
    log_message "Evaluating CPU usage..."
    echo "CPU Usage:"
    top -b -n 1 | head -15
}

# Function to generate a system health report
generate_report() {
    log_message "Generating system health report..."
    REPORT="System Health Report - $(date)\n"
    REPORT+="\nDisk Usage:\n$(df -h)\n"
    REPORT+="\nRunning Services:\n$(systemctl list-units --type=service --state=running)\n"
    REPORT+="\nMemory Usage:\n$(free -m)\n"
    REPORT+="\nCPU Usage:\n$(top -b -n 1 | head -15)\n"
    echo -e "$REPORT"
}

# Function to send an email with the report
send_email_report() {
    REPORT=$(generate_report)
    echo "Sending email report..."
    echo -e "$REPORT" | mail -s "System Health Report" "aadi.ranadive@gmail.com"
    if [ $? -eq 0 ]; then
        echo "Email sent successfully."
        log_message "Email report sent."
    else
        echo "Failed to send email."
        log_message "Failed to send email."
    fi
}

# Display the menu
while true; do
    echo "------------------------------------------"
    echo "System Health Check Menu"
    echo "1. Check Disk Usage"
    echo "2. Monitor Running Services"
    echo "3. Assess Memory Usage"
    echo "4. Evaluate CPU Usage"
    echo "5. Send Comprehensive Report via Email"
    echo "6. Exit"
    echo "------------------------------------------"
    read -p "Enter your choice [1-6]: " choice

    # Start of case block
    case $choice in
        1)
            check_disk_usage
            ;;
        2)
            monitor_running_services
            ;;
        3)
            assess_memory_usage
            ;;
        4)
            evaluate_cpu_usage
            ;;
        5)
            send_email_report
            ;;
        6)
            echo "Exiting... Goodbye!"
            log_message "Script exited by user."
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
