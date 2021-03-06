#!/bin/bash

# Global Variables
runuser=$(whoami)
tempdir=$(pwd)

# Title Function
func_title(){
  clear

  # Echo Title
  echo '=========================================================================='
  echo ' SimplyDomain Setup Script | [Updated]: 2017'
  echo '=========================================================================='
  echo ' [Web]: Http://obscuritylabs.com | [Twitter]: @KillSwitch-GUI'
  echo '=========================================================================='
}



# Environment Checks
func_check_env(){
  # Check Sudo Dependency going to need that!
  if [ $(which sudo|wc -l) -eq '0' ]; then
    echo
    echo ' [ERROR]: This Setup Script Requires sudo!'
    echo '          Please Install sudo Then Run This Setup Again.'
    echo
    exit 1
  fi
}

func_install(){
# Setup virtual env
  pip install autoenv
  echo "source `which activate.sh`" >> ~/.bashrc
  apt-get install python-virtualenv -y
  virtualenv --no-site-packages SD
  source SD/bin/activate


  pip3 install -r setup/requirements.txt

}


# Menu Case Statement
case $1 in
  *)
  func_title
  func_check_env
  func_install
  ;;

esac
