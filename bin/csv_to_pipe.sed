###############################################################################
# Name        : csv_to_pipe.sed
# Description : converts csv files to pipe delimited
# Author      : Scott Walkinshaw
# Date        : 29 April 2014
# Parameters  : 
#
# Notes       : preserves commas in fields optionally enclosed in quotes
#                 ^
#               tricky bit
###############################################################################
###############################################################################
# File Modification History                                                   #
###############################################################################
# Inits | Date      | Vers | Description                                      #
# SW    | 29 Apr 14 | 1.00 | initial issue                                    #
###############################################################################
s/^ *\(.*[^ ]\) *$/|\1|/;             # put a | at the start of each line
s/" *, */"|/g;                        # put a | after the last quote mark in a field
: loop
  s/| *\([^",|][^,|]*\) *, */|\1|/g;  # change , to | for all fields up to quoted field (or double comma)
  s/| *, */||/g;                      # change all other , to | except for those in quotes
t loop
s/^|\(.*\)|$/\1/;                     # remove the | from the start of each line
s/"//g;                               # remove all quotes from file
