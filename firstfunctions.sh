#!/bin/bash
# This script demonstrates processing the command line using functions for help

# Task: Add a debug option and a verbose option to this script. Both options should appear on the command line when the script is run. 
#       The debug option should set a variable named 'debug' to the value "yes". The verbose option is '-v' and should set a variable 
#       named 'verbose' to yes. The debug and verbose variables should be set to no by default, but give the option for them on the 
#       command line when running the script. Once processed, the script should print out 2 lines to indicate if the verbose option 
#       is set to yes or no.

##############
# FUNCTIONS
##############
# Define functions for error messages and displaying command line help.
function displayusage {
  echo "Usage: $0 [-h|--help] [-d|--debug] [-v|--verbose]"
}
function errormessage {
  echo "$@" >&2
}

##################
# CLI Processing
##################

debug="no"
verbose="no"

# Process the command line options, saving the results in variables for later use.
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      displayusage
      exit 0
      ;;
    -d|--debug)
      debug="yes"
      ;;
    -v|--verbose)
      verbose="yes"
      ;;
    *)
      errormessage "I don't know what '$1' is. Sorry."
      errormessage "$(displayusage)"
      exit 1
      ;;
  esac
  shift
done

echo "Verbose is set to $verbose"
echo "Debug is set to $debug"

