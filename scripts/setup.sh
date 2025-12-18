#!/bin/bash

# Путь к лог-файлу прямо в папке скрипта
LOG_FILE="/opt/devops-project/scripts/setup_log.txt"

# Обновление системы
echo "Обновление системы..." | tee -a "$LOG_FILE"
sudo apt update -y && sudo apt upgrade -y | tee -a "$LOG_FILE"

# Установка Java 17
echo "Установка Java 17..." | tee -a "$LOG_FILE"
sudo apt install -y openjdk-17-jdk | tee -a "$LOG_FILE"

# Установка Gradle
echo "Установка Gradle..." | tee -a "$LOG_FILE"
sudo apt install -y gradle | tee -a "$LOG_FILE"

# Установка Git
echo "Установка Git..." | tee -a "$LOG_FILE"
sudo apt install -y git | tee -a "$LOG_FILE"

# Проверка версий и запись в лог
echo "Проверка версий:" | tee -a "$LOG_FILE"
java -version 2>&1 | tee -a "$LOG_FILE"
gradle -v | tee -a "$LOG_FILE"
git --version | tee -a "$LOG_FILE"

