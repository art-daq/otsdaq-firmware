#!/usr/bin/env python
#____________________________________________________________
#
#  setup_and_install.py -h
#
#  python script to setup and install otsdaq cactus feature
#
#  created: November 2015 
#  by: rrivera at fnal dot gov
#____________________________________________________________
#

import argparse
import os #for isdir abspath dirname

print

parser = argparse.ArgumentParser(description='Setup and Install for Off-the-Shelf DAQ')

parser.add_argument('-d','--dest',help='Destination path')

args = parser.parse_args()

print
print "***********************\n"
print "Setting up and Installing...\n" + \
    "Look for 'Success!' at end of print out.\n"
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


if ((not os.path.isdir(scriptDir + "/simStib")) or 
    (not os.path.isdir(scriptDir + "/simStib/simStib")) ):
    print "Error!\n Check usage. "
    parser.print_help()
    print
    print "****************"
    print "Error: Invalid script location " + \
             "(make sure 'ActiveHDL_proj' and " + \
             "'/ActiveHDL_proj/ethernet_controller' " + \
             "are directories at the script path: '" + scriptDir + "')\n\n"
    raise SystemExit


dest = scriptDir + "/../hdl" #default destination path
if (args.dest): #if option used, then use args.dest
    dest = args.dest

print 'Destination directory is:'
print  dest
print
print

if ((not os.path.isdir(dest ) ):
    print "Error!\n Check usage. "
    parser.print_help()
    print
    print "****************"
    print "Error: Invalid destination path " + \
             "(make sure directory exists  " + \
             "at the destination: '" + dest + "')\n\n"
    raise SystemExit
 



#print
#print  'Clearing destination files...'

#os.system("rm -f " + dest + "/*.v")
#os.system("rm -f " + dest + "/*.vhd")

print
print  'Copying files...'
#os.system("cp " + scriptDir + \
#              "/ActiveHDL_proj/ethernet_controller/src/*.vhd " + \
#              dest + "/ethernet_controller/")

print
print 'Modifying files...'
print

#replaced inferred fifos with coregen fifos, 
#..since inferred doesn't seem to work in ise/vivado
# 2 steps: uncomment coregen, and comment inferred
#os.system("sed -i s/--//g " + dest + "/ethernet_controller/data_manager.vhd")
#os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased/g " + dest + \
          "/ethernet_controller/data_manager.vhd")
print
print 'Removing files for tidiness...'
print

#os.system("rm -f " + dest + "/ethernet_controller/top_tmp.vhd")
#os.system("rm -f " + dest + "/data_manager/inferredFifo.vhd")
    
print
print 'Integration complete.'
print


##### done
print
print "***********************\n"
print "Success!"
print
print
