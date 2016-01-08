#!/usr/bin/env python
#____________________________________________________________
#
#  setup_and_install.py
#
#____________________________________________________________
#

import argparse
import os #for isdir abspath dirname

print
print "***********************\n"
print "Setting up and Installing...\n" + \
    "Look for 'Success!' at end of print out.\n"
print


parser = argparse.ArgumentParser(description='Setup Firmware Component')

parser.add_argument('-d','--dest',help='Destination path')
parser.add_argument('-p','--param_name',default='value 2',
		help='Dummy parameter example with expected values specified in param_values/')

args = parser.parse_args()

print
print 'Arguments parsed...'
print args
print
print

########
# at this point call is legal according to argparse

scriptDir = os.path.dirname(os.path.abspath(__file__))
     

print 'Script directory is:'
print scriptDir
print

dest = scriptDir + "/../hdl" #default destination path
if (args.dest): #if option used, then use args.dest
    dest = args.dest

print 'Desitnation directory is:'
print  dest
print
print

#validate destination directory
if ((not os.path.isdir(dest + "/"))):
    print "Error!\n Check usage. "
    parser.print_help()
    print
    print "****************"
    exit("Error: Invalid destination path '" + (args.dest) + "')\n\n")
    

print  'Clearing destination files...'

#os.system("rm " + args.dest + "/*.v")
#os.system("rm " + args.dest + "/*.vhd")

print  'Copying files...'
#os.system("cp " + scriptDir + \
#              "/../dev/*.vhd " + \
#              args.dest + "/")
#os.system("cp " + scriptDir + \
#              "/../dev/*.v  " + \
#              args.dest + "/")
    
print
print "***********************\n"
print 'Success!'
print
print

