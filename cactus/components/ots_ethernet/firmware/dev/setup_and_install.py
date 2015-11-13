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
parser.add_argument('-p','--phy',
                    help='Phy solution (e.g. XILINX_7SERIES_RGMII or ' +\
                        'MII_100_1000 or LOGIC_RGMII) default is ' +\
                        'MII_100_1000')
parser.add_argument('-s','--simple',nargs='?',const="YES",
                    help='Select simplified interface. This removes ' +\
                    'some inputs/outputs from the interface that are less commonly used.')

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


if ((not os.path.isdir(scriptDir + "/ActiveHDL_proj")) or 
    (not os.path.isdir(scriptDir + "/ActiveHDL_proj/ethernet_controller")) ):
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

print 'Desitnation directory is:'
print  dest
print
print

if ((not os.path.isdir(dest + "/ethernet_controller")) or 
    (not os.path.isdir(dest + "/data_manager")) ):
    print "Error!\n Check usage. "
    parser.print_help()
    print
    print "****************"
    print "Error: Invalid destination path " + \
             "(make sure 'ethernet_controller' and 'data_manager' " + \
             "are directories at the destination: '" + dest + "')\n\n"
    raise SystemExit
 



print
print  'Clearing destination files...'

os.system("rm -f " + dest + "/ethernet_controller/*.v")
os.system("rm -f " + dest + "/ethernet_controller/*.vhd")
os.system("rm -f " + dest + "/data_manager/*.v")
os.system("rm -f " + dest + "/data_manager/*.vhd")
os.system("rm -f " + dest + "/*.v")
os.system("rm -f " + dest + "/*.vhd")

print
print  'Copying files...'
os.system("cp " + scriptDir + \
              "/ActiveHDL_proj/ethernet_controller/src/*.vhd " + \
              dest + "/ethernet_controller/")
os.system("cp " + scriptDir + \
              "/ActiveHDL_proj/ethernet_controller/src/*.v  " + \
              dest + "/ethernet_controller/")
os.system("cp " + scriptDir + \
              "/ActiveHDL_proj/ethernet_controller/compile/*.vhd " + \
              dest + "/ethernet_controller/")

print    
print 'Changing permissions...'
os.system("chmod 755 " + dest + "/ethernet_controller/*.vhd")
os.system("chmod 755 " + dest + "/ethernet_controller/*.v")


print
print 'Modifying files...'
print

#replaced inferred fifos with coregen fifos, 
#..since inferred doesn't seem to work in ise/vivado
# 2 steps: uncomment coregen, and comment inferred
os.system("sed -i s/--//g " + dest + "/ethernet_controller/data_manager.vhd")
os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased/g " + dest + \
          "/ethernet_controller/data_manager.vhd")

#replaced inferred fifos with coregen fifos, 
#..since inferred doesn't seem to work in ise/vivado
# 2 steps: uncomment coregen, and comment inferred
if (args.simple):
    print "NOTE: simple Ethernet interface chosen"
    print "Modifying files for simple interface..."
    print 
    os.system("sed -i s/--\ simple\ --//g " + dest + \
              "/ethernet_controller/ethernet_interface.vhd")
    os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/" + \
              "--erased\ for\ simple\ interface/g " + dest + \
              "/ethernet_controller/ethernet_interface.vhd")


#replace PHY_SOLUTION
phy = "MII_100_1000" #default phy
if (args.phy):     #if option used, then use args.phy
    phy = args.phy

if (phy != "XILINX_7SERIES_RGMII" and
    phy != "MII_100_1000" and
    phy != "LOGIC_RGMII"):
    print "WARNING: Unrecognized -p PHY argument " + \
        "(may want to use -h for help): '" + \
        phy + "'?"

os.system("sed -i s/LOGIC_RGMII_handler/" + phy + "_handler/g " + dest + \
              "/ethernet_controller/ethernet_controller_wrapper.vhd")

os.system("mv " + dest + "/ethernet_controller/" + phy + \
              "_xmii_handler.vhd " + dest + \
              "/ethernet_controller/xmii_handler.vhd")
os.system("rm " + dest + "/ethernet_controller/*_xmii_handler.vhd")

print "Installed Chosen PHY Solution: " + phy
print

print
print 'Moving files...'
print

#moving to hdl/data_manager
os.system("mv " + dest + "/ethernet_controller/rx_ctl.vhd " + dest + \
              "/data_manager/")
os.system("mv " + dest + "/ethernet_controller/tx_seq_ctl.vhd " + dest + \
              "/data_manager/")
os.system("mv " + dest + "/ethernet_controller/ram_comm_dec.vhd " + dest + \
              "/data_manager/")
os.system("mv " + dest + "/ethernet_controller/params_package.vhd " + dest + \
              "/data_manager/")
os.system("mv " + dest + "/ethernet_controller/delay_counter.vhd " + dest + \
              "/data_manager/")
os.system("mv " + dest + "/ethernet_controller/data_manager.vhd " + dest + \
              "/data_manager/")
os.system("mv " + dest + \
              "/ethernet_controller/burst_controller_sm.vhd " + dest + \
              "/data_manager/")
os.system("mv " + dest + "/ethernet_controller/inferredFifo.vhd " + dest + \
              "/data_manager/");

#moving to hdl/
os.system("mv " + dest + \
              "/ethernet_controller/ethernet_interface.vhd " + dest + "/")
os.system("mv " + dest + \
              "/ethernet_controller/burst_traffic_controller.vhd " + dest + "/")

print
print 'Removing files for tidiness...'
print

os.system("rm -f " + dest + "/ethernet_controller/top_tmp.vhd")
os.system("rm -f " + dest + "/data_manager/inferredFifo.vhd")
    
print
print 'Integration complete.'
print


##### done
print
print "***********************\n"
print "Success!"
print
print
