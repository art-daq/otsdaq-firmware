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

parser.add_argument('-s','--src',help='Source path')
parser.add_argument('-d','--dest',help='Destination path')
							
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

src = scriptDir + "/../dev" #default source path
if (args.src): #if option used, then take from args
    src = args.src

print 'Source directory is:'
print  src
print
print


#validate source directory
if ((not os.path.isdir(src + "/")) or 
		(not os.path.isdir(src + "/"))	):
    print "Error!\n Check usage. Source directory must exist."
    parser.print_help()
    print
    print "****************"
    exit("Error: Invalid Source path '" + (src) + "')\n\n")


dest = scriptDir + "/../hdl" #default destination path
if (args.dest): #if option used, then take from args
    dest = args.dest

print 'Destination directory is:'
print  dest
print
print

#validate destination directory
if ((not os.path.isdir(dest + "/")) or 
		(not os.path.isdir(dest + "/"))	):
    print "Error!\n Check usage. Destination directory must exist."
    parser.print_help()
    print
    print "****************"
    exit("Error: Invalid Destination path '" + (dest) + "')\n\n")
    


print  'Clearing destination files...'


#os.system("rm " + dest + "/*.v")
#os.system("rm " + dest + "/.vhd")

print  'Copying files...'
#os.system("cp " + scriptDir + \
#              "/../dev/*.vhd " + \
#              dest + "/")
#os.system("cp " + scriptDir + \
#              "/../dev/*.v  " + \
#              dest + "/")
              

print  'Modifying files...'
print

    
os.system("sed -i s/dum_ctr_64/xilinx_64b_counter/g " + src + "/*.vhd")


print
print "***********************\n"
print 'Success!'
print
print

