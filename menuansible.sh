#!/bin/bash
# Menu shell ansible for IBM i
# Linux server / desktop.


# Purpose: Display pause prompt
# $1-> Message (optional)
function pause(){
 local message="$@"
 [ -z $message ] && message="Press [Enter] key to continue..."
 read -p "$message" readEnterKey
}

# Purpose  - Display a menu on screen
function show_menu(){
    date
    echo "---------------------------"
    echo "  Tareas Ansible  "
    echo "---------------------------"
 echo "1. Create user profile"
 echo "2. Display user profile"
 echo "3. Delete user profile"
 echo "4. Ver  PTF"
 echo "5. Enviar y restaurar una biblioteca"
 echo "6. Info sobre de trabajos"
 echo "7. Salir"
}

# Purpose - Display header message
# $1 - message
function write_header(){
 local h="$@"
 echo "---------------------------------------------------------------"
 echo "     ${h}"
 echo "---------------------------------------------------------------"
}

# Purpose - Crea usuario
function crtusrprf(){
 write_header " Create user profile "
 ansible-playbook crtusrprf.yml
 #pause "Press [Enter] key to continue..."
 pause
}

# Purpose - Visualiza info usuario
function dspusrprf(){
 write_header " Visualiza info usuario "
 ansible-playbook dspusrprf.yml
 #pause "Press [Enter] key to continue..."
 pause
}

# Purpose - Delete user profile
function dltusrprf(){
  write_header " Delete user profile "
 ansible-playbook dltusrprf.yml
 #pause "Press [Enter] key to continue..."
 pause

}

# Purpose - Ver un PTF 
 function dspptf(){
  write_header " Ver PTF "
 ansible-playbook dspptf.yml
 #pause "Press [Enter] key to continue..."
 pause
 }

# Purpose - Enviar y restaurar una biblioteca
function savrstlib(){
  write_header " Enviar y restaurar una biblioteca "
 ansible-playbook savrstlib.yml
 #pause "Press [Enter] key to continue..."
 pause
 }
 
 # Purpose - Info sobre de trabajos
function work_management(){
  write_header " Info sobre de trabajos "
 ansible-playbook work_management.yml
 #pause "Press [Enter] key to continue..."
 pause
 }
 
# Purpose - Get input via the keyboard and make a decision using case..esac 
function read_input(){
 local c
 read -p "Enter your choice [ 1 - 7 ] " c
 case $c in
  1) crtusrprf ;;
  2) dspusrprf ;;
  3) dltusrprf ;;
  4) dspptf ;;
  5) savrstlib "last" ;;
  6) work_management ;;
  7) echo "Bye!"; exit 0 ;;
  *) 
   echo "Please select between 1 to 7 choice only."
   pause
 esac
}

# ignore CTRL+C, CTRL+Z and quit singles using the trap
trap '' SIGINT SIGQUIT SIGTSTP

# main logic
while true
do
 clear
  show_menu # display memu
  read_input  # wait for user input
done