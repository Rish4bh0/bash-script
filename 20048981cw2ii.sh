#!/bin/bash

# To check if the user entered 2 parameters
if [ $# != 2 ]
 then

 echo -e "SORRY! could not enter the program"
 echo
 sleep 0.6
 echo -e "Error! Username or ID missing"
 echo
 sleep 0.6
 echo -e "Instruction bash <programname> <username> <ID>"
 echo
 sleep 1
 echo -e "\e[31mTerminating program \e[0m"
 sleep 1
 echo -e ".\c"
 sleep 1
 echo -e ".\c"
 sleep 1
 echo -e ".\c"
 sleep 1
 echo -e ".\c"
 sleep 1
 echo "."
 sleep 1
 echo
 echo "Program terminated successfully."
 exit 1
fi

#To check if the first parameter is username and second parameter is ID
until [[ "$1" =~ ^[A-Za-z]+$ && "$2" =~ ^[+-]?[0-9]+$ ]]
do
 sleep 1
 echo
 echo " INVALID PARAMETER "
 sleep 1
 echo
 echo " Error! Enter Username as letter and ID as a number "
 exit
done
figlet "WELCOME"

# Function to ask user for secret key
input_password(){
echo -e "Enter the secretkey: \c"
read -s key
}

input_password
secretkey=test123
tries=1

# Loop for checking is the secretkey is valid or not
while [ $tries -lt 3 ]
        do
 if [ $secretkey = $key ]
        then
 echo ""
 echo -e "Loading..\c"
 echo -e "..................................Loading 100%" | pv -qL 10
 sleep 1
 figlet "Hi"
 sleep 1
 echo
 echo "========================================="
 echo       " WELCOME TO THE PROGRAM!"
 echo
 echo " ID: "$2" "
 echo " Name: "$1" "
 echo " Date: $(date +'%m/%d/%Y') "
 echo " Time: $(date +'%r') "
 echo
 echo "========================================="
 sleep 1
 break
 else
 echo -e "Error! Invalid Secret Key please try again"
 input_password
 tries=`expr $tries + 1`
 fi
done

# Loop for terminating the program after entering wrong password for the third time.
while [ $tries = 3 ]
         do
 echo "Sorry! You entered wrong password for 3 times"
 echo
 echo -e "\e[31m Terminating program \e[0m"
 sleep 0.7
 echo -e ".\c"
 sleep 0.7
 echo -e ".\c"
 sleep 0.7
 echo -e ".\c"
 sleep 0.7
 echo -e ".\c"
 sleep 0.7
 echo "."
 sleep 0.7
 echo
 echo "Program terminated successfully."
 exit 1
 done
 
# Function to ask user for the best band
band_selection(){
  echo -e "\n\t\t SELECT A BAND"
  echo -e "________________________________________________"
  echo -e "| Band                  | code                  |"
  echo -e "-------------------------------------------------"
  echo -e "| Beatles               | BEA                   |"
  echo -e "| AC/DC                 | AD                    |"
  echo -e "| Queen                 | QUE                   |"
  echo -e "| Blondie               | BLO                   |"
  echo -e "| Nirvana               | NIR                   |"
  echo -e "_________________________________________________"
  sleep 1
echo -e "\nWhich is the best music band(Enter band code):-\c"
  read best_band_code
  if [[ "$best_band_code" = "AD" ]]; then
    echo -e "Congrats! you choose the best band"
    echo -e "================================================================================"
    sleep 1
    echo -e "\t\t\tAC/DC is the best band"
    sleep 1
    echo -e "The Scottish-born brothers Malcolm and Angus Young founded the Australian"
    sleep 1
    echo -e "rock band AC/DC in Sydney in 1973. Hard rock, blues rock and heavy metal"
    sleep 1
    echo -e "have all been used to describe the band's music; however, rock and roll is what"
    sleep 1
    echo -e "they call it."
    echo -e "================================================================================"
  elif [[ "$best_band_code" = "BEA" || "$best_band_code" = "QUE" || "$best_band_code" = "BLO" || "$best_band_code" = "NIR" ]]; then
  sleep 1
  echo -e "Error! Wrong Band!"
      sleep 1
      echo -e "$best_band_code is not the best music band"
      band_selection
  else
    echo -e "Error! Invalid Input!"
    band_selection
  fi
}
 
member_selection(){
  echo -e "\nThe Five Star band members are:"
  echo -e "________________________________________________"
  echo -e "| Members              | code                   |"
  echo -e "-------------------------------------------------"
  echo -e "| John Lenon           | JL                     |"
  echo -e "| Angus Young          | AY                     |"
  echo -e "| Freddie Mercury      | FM                     |"
  echo -e "| Debbie Harry         | DH                     |"
  echo -e "| Kurt Cobain          | KC                     |"
  echo -e "_________________________________________________"
  sleep 0.7
  echo
  echo -e "Choose three band members represented by codes separated by spaces:"
  read a b c
  number_validate $a $b $c
  validate "$a"
  validate "$b"
  validate "$c"
  
}
validate(){
  # to check if the players are valid
  if [[ $1 != "JL" && $1 != "AY" && $1 != "FM" && $1 != "DH" && $1 != "KC" ]]; then
    sleep 0.7
    echo -e "Error! band member doesnt exist Try again"
    sleep 0.7
    member_selection
  fi
}
number_validate(){
# to check if there are exactly 3 inputs
  if [[ $# != 3 ]]; then
  sleep 0.7
  echo -e "Error! Invalid number of inputs, Enter only 3 band members"
  sleep 0.7
  member_selection
  fi
  # to check if there are duplicate inputs
  if [[ "$1" == "$2" || "$2" == "$3" || "$1" == "$3" ]]; then
    sleep 0.7
    echo -e "Error! Duplicate inputs!"
   sleep 0.7
   member_selection
  fi
}
# Function for choosing file
file(){
  PS3="Enter a number as per list for choosing a band member you want:"
  select member in $a $b $c
    do
      if [ -z $member ]
        then
        echo -e "Please use correct number"
      elif [ -r $member ]
        then
         echo ""
         sleep 0.7
         echo -e "You selected" $member
         echo ""
         sleep 0.7
          cat $member
          break
      else
        echo -e "Error! Can not find file!"
     band_selection
     fi
    done
}

# Funtion to exit or restart the program
execute(){
band_selection
member_selection
file
echo -e "Do you want to start over?(y/n):-\c"
read y
case $y in
 "YES"|"yes"|"Yes"|"Y"|"y")
   execute
   ;;
 *)
  figlet Program Terminated Successfully
  exit
  ;;
esac
}
execute;

