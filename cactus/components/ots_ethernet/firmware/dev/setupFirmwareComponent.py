#!/usr/bin/env python
#____________________________________________________________
#
#  setupFirmwareComponent
#
#____________________________________________________________
#

import argparse
import os #for isdir abspath dirname

print
print "Setting up Firmware Component...\n" + \
    "Look for 'Success!' at end of print out.\n"
print


parser = argparse.ArgumentParser(description='Setup Firmware Component')

parser.add_argument('dest',help='Destination path')

parser.add_argument('-p','--phy',
                    help='an integer for the accumulator')

args = parser.parse_args()


if ((not os.path.isdir(args.dest + "/gec")) or 
    (not os.path.isdir(args.dest + "/data_manager")) ):
    print "Error!\n Check usage. "
    parser.print_help()
    print
    print "****************"
    exit("Error: Invalid destination path (gec and data_manager " +
         "should be dirs at the specified path '" + (args.dest) + "')\n\n")
    
 

scriptDir = os.path.dirname(os.path.abspath(__file__))
   

print 'Script directory found as:'
print scriptDir
print
print 'Desitnation directory found as:'
print  args.dest
print
print

print  'Clearing destination files...'

os.system("rm " + args.dest + "/gec/*.v")
os.system("rm " + args.dest + "/gec/*.vhd")
os.system("rm " + args.dest + "/data_manager/*.v")
os.system("rm " + args.dest + "/data_manager/*.vhd")
os.system("rm " + args.dest + "/*.v")
os.system("rm " + args.dest + "/*.vhd")

print  'Copying files...'
os.system("cp " + scriptDir + \
              "/ActiveHDL_proj/ethernet_controller/src/*.vhd " + \
              args.dest + "/gec/")
os.system("cp " + scriptDir + \
              "/ActiveHDL_proj/ethernet_controller/src/*.v  " + \
              args.dest + "/gec/")
os.system("cp " + scriptDir + \
              "/ActiveHDL_proj/ethernet_controller/compile/*.vhd " + \
              args.dest + "/gec/")
    
print 'Changing permissions...'
os.system("chmod 755 " + args.dest + "/gec/*.vhd")
os.system("chmod 755 " + args.dest + "/gec/*.v")



#if !args.destPath

if (args.phy):
    print "this is the phy " + args.phy

