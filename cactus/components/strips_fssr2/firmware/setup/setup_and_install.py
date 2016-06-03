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

parser.add_argument('-n','--nsensor',type=int,default=2,
		choices=range(1,8),
                    help='Number of sensors. Default is 2.', metavar='')
					
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

src = scriptDir + "/../dev"


print 'Source directory is:'
print src
print

if ((not os.path.isdir(src + "/simStib")) or 
    (not os.path.isdir(src + "/simStib/simStib")) ):
    print "Error!\n Check usage. "
    parser.print_help()
    print
    print "****************"
    print "Error: Invalid source location " + \
             "(make sure '../dev/ActiveHDL_proj' and " + \
             "'../dev/ActiveHDL_proj/ethernet_controller' " + \
             "are directories relative to the script path: '" + scriptDir + "')\n\n"
    raise SystemExit


dest = scriptDir + "/../hdl" #default destination path
if (args.dest): #if option used, then use args.dest
    dest = args.dest

print 'Destination directory is:'
print  dest
print
print

if ( (not os.path.isdir(dest )) ):
    print "Error!\n Check usage. "
    parser.print_help()
    print
    print "****************"
    print "Error: Invalid destination path " + \
             "(make sure directory exists  " + \
             "at the destination: '" + dest + "')\n\n"
    raise SystemExit
 



print
print  'Clearing destination files...'

os.system("rm -f " + dest + "/*.v")
os.system("rm -f " + dest + "/*.vhd")

print
print  'Copying files...'
os.system("cp " + src + \
              "/simStib/simStib/src/*.vhd " + \
              dest + "/")

print
print 'Modifying files...'
print


#modify strip interface 
#(note: do for all strip files.. not particular ones anymore)
os.system("sed -i s/---\ //g " + dest + "/*.vhd")
os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased/g " + dest + \
          "/*.vhd")
#os.system("sed -i s/---//g " + dest + "/strip_interface.vhd")
#os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased/g " + dest + \
#          "/strip_interface.vhd")
#os.system("sed -i s/---//g " + dest + "/stripstream.vhd")
#os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased/g " + dest + \
#          "/stripstream.vhd")
#os.system("sed -i s/---//g " + dest + "/stripclk.vhd")
#os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased/g " + dest + \
#          "/clk.vhd")
#os.system("sed -i s/---//g " + dest + "/stripfifo.vhd")
#os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased/g " + dest + \
#          "/stripfifo.vhd")
#os.system("sed -i s/---//g " + dest + "/trigprim.vhd")
#os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased/g " + dest + \
#          "/trigprim.vhd")
#os.system("sed -i s/---//g " + dest + "/trigproc.vhd")
#os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased/g " + dest + \
#          "/trigproc.vhd")


#set default number of sensors
nsensor = 2;
if(args.nsensor > 0 and args.nsensor < 9):
	nsensor = args.nsensor
os.system("sed -i s/nsensor.*\:.*\;/" + \
              "nsensor\ \:\ integer\ \:\=\ " + \
              str(nsensor)+"\ \)\;/g " + dest + \
              "/strip_interface.vhd")

print "Set Default Number of Sensors, nsensor: " + str(nsensor)
print
		  
		  
print
print 'Removing files for tidiness...'
print


os.system("rm -f " + dest + "/inferred*.vhd")
    
print
print 'Integration complete.'
print


##### done
print
print "***********************\n"
print "Success!"
print
print
