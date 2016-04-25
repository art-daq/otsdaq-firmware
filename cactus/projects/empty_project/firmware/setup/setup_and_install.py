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
parser.add_argument('-b','--board',default='picozed',
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

print 'Destination directory is:'
print  dest
print
print

#validate destination directory
if ((not os.path.isdir(dest + "/")) or 
		(not os.path.isdir(scriptDir + "/../cfg/"))	):
    print "Error!\n Check usage. ../hdl and ../cfg must exist relative to script "
    parser.print_help()
    print
    print "****************"
    exit("Error: Invalid script path '" + (scriptDir) + "')\n\n")
    


print  'Clearing destination files...'


#os.system("rm " + dest + "/*.v")
os.system("rm " + dest + "/*.vhd")

print  'Copying files...'
os.system("cp " + scriptDir + \
              "/../dev/*.vhd " + \
              dest + "/")
#os.system("cp " + scriptDir + \
#              "/../dev/*.v  " + \
#              dest + "/")
              

print  'Modifying files...'
print
print  'Board selected as: ' + args.board
    
os.system("sed -i s/boards.\*/boards\\\/"+args.board+"/g " + scriptDir + "/../cfg/top.dep")


print
print "***********************\n"
print 'Success!'
print
print

