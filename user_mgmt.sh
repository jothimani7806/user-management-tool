#!/bin/bash

while true
do
  echo "============================"
  echo "👤 USER MANAGEMENT TOOL"
  echo "============================"
  echo "1. Create User"
  echo "2. Delete User"
  echo "3. Change Password"
  echo "4. List Users"
  echo "5. Exit"
  echo "============================"

  read -p "Enter your choice: " choice

  case $choice in
    1)
  read -p "Enter new username: " username

  sudo useradd "$username"

 
  if [ $? -eq 0 ]; then
  echo "User '$username' created successfully ✅"
  echo "$(date): User $username created" >> logs/actions.log
else
  echo "Failed to create user ❌"
fi
  ;;
    2)
  read -p "Enter username to delete: " username

  sudo userdel "$username"

  if [ $? -eq 0 ]; then
  echo "User '$username' deleted successfully ❌"
  echo "$(date): User $username deleted" >> logs/actions.log
else
  echo "Failed to delete user ❌ (check if user exists or permissions)"
fi
  ;;
    3)
  if [ $? -eq 0 ]; then
  echo "Password updated successfully 🔑"
  echo "$(date): Password changed for $username" >> logs/actions.log
else
  echo "Failed to update password ❌"
fi
  ;;
    4)
  echo "📋 List of users:"
  cut -d: -f1 /etc/passwd
  ;;
    5)
      echo "Exiting... 🚪"
      break
      ;;
    *)
      echo "Invalid option ❌"
      ;;
  esac

  echo ""
read -p "Press Enter to continue..."
clear
done
