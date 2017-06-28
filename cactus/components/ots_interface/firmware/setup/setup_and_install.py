#!/usr/bin/env python
#____________________________________________________________
#
#  setup_and_install.py -h
#  for "ots_interface" component
#
#  python script to setup and install otsdaq cactus feature
#
#  created: November 2015 
#  by: rrivera at fnal dot gov
#  edited by Ethan (2017)
#____________________________________________________________
#

import argparse # https://docs.python.org/3/library/argparse.html
import os 		# for isdir abspath dirname

print			# new line

parser = argparse.ArgumentParser(description='Setup and Install for Off-the-Shelf DAQ')

parser.add_argument('-d','--dest',help='Destination path')

parser.add_argument('-p','--phy',default='MII_100_1000',
		choices=['XILINX_7SERIES_RGMII',	
                 'MII_100_1000','LOGIC_RGMII'],
				 help='Select PHY solution. Default is ' +\
                        'MII_100_1000')
						
parser.add_argument('-f','--fifo',default='XILINX_COREGEN',
		choices=['XILINX_7_INFERRED','XILINX_COREGEN'],
				 help='Select FIFO solution. Default choice is XILINX_COREGEN.')	
				 
parser.add_argument('-s','--simple',nargs='?',const='YES',
                    help='Select simplified interface. This removes ' +\
                    'some inputs/outputs from the interface that are less commonly used.')
					
parser.add_argument('-i','--ip',type=int,default=2,
		choices=range(1,254),
                    help='IP address low-byte default for 192.168.133.##', metavar='')

parser.add_argument('--flash',nargs='?',const='YES',help='Include SPI FLASH implementation')
#, action = "store_true")


					
#parser.add_argument('-t','--port',type=int,default=2001,
#		choices=range(0,65535),					
#                    help='UDP 16-bit port for the interface', metavar='')

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

# if ((not os.path.isdir(src + "/ActiveHDL_proj")) or 
#     (not os.path.isdir(src + "/ActiveHDL_proj/ethernet_controller")) ):
#     print "Error!\n Check usage. "
#     parser.print_help()
#     print
#     print "****************"
#     print "Error: Invalid source location " + \
#              "(make sure '../dev/ActiveHDL_proj' and " + \
#              "'../dev/ActiveHDL_proj/ethernet_controller' " + \
#              "are directories relative to the script path: '" + scriptDir + "')\n\n"
#     raise SystemExit

if not os.path.isdir(src + "/"):
    print "Error!\n Check usage. "
    parser.print_help()
    print
    print "****************"
    print "Error: Invalid source location " + \
             "(make sure '../dev/" + \
             "is a directorie relative to the script path: '" + scriptDir + "')\n\n"
    raise SystemExit


dest = scriptDir + "/../hdl" #default destination path
if (args.dest): #if option used, then use args.dest
    dest = args.dest

print 'Destination directory is:'
print  dest
print
print

'''
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
''' 



print
print  'Clearing destination files...'


os.system("rm -f " + dest + "/*.v")
os.system("rm -f " + dest + "/*.vhd")

print
print  'Copying files...'
os.system("cp " + src + "/*.v " + dest + "/")
os.system("cp " + src + "/*.vhd " + dest + "/")

 
if args.flash:
    os.system("cp " + src + "/flash.dep " + dest + "/../cfg/flash.dep")
else:
    os.system("cp " + src + "/no_flash.dep " + dest + "/../cfg/flash.dep")


print    
print 'Changing permissions...'
os.system("chmod 755 " + dest + "/*.vhd")
os.system("chmod 755 " + dest + "/*.v")


print
print 'Modifying files...'
print

#replaced inferred fifos with coregen fifos, 
#..since inferred doesn't seem to work in ise/vivado
# 2 steps: uncomment coregen, and comment inferred
os.system("sed -i s/--//g " + dest + "/data_manager.vhd")
os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased/g " + dest + \
          "/data_manager.vhd")

#modify for simple inerface
# 2 steps: uncomment and comemnt 
if (args.simple):
    print "NOTE: simple Ethernet interface chosen"
    print "Modifying files for simple interface..."
    print 
    os.system("sed -i s/--\ simple\ --//g " + dest + \
              "/ots_interface.vhd")
    os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/" + \
              "--erased\ for\ simple\ interface/g " + dest + \
              "/ots_interface.vhd")

if args.flash:
    os.system("sed -i s/--Implementation//g " + dest + "/ram_interface.vhd")
    os.system("sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased\ for\ implementation/g " + dest + "/ram_interface.vhd")
else:
   os.system("sed -i s/.\*--FLASH//g " + dest + "/ots_interface.vhd")

#replace FIFO SOLUTION
fifo = args.fifo

if (fifo != "XILINX_COREGEN" and
		fifo != "XILINX_7_INFERRED"):
    print "WARNING: Unrecognized -f FIFO argument " + \
        "(may want to use -h for help): '" + \
		fifo + "'?"

#uncomment dependecy coregen
os.system("sed -i s/.*\?toolset/\?toolset/g " + dest + \
            "/../cfg/ots_interface.dep")
if (fifo == "XILINX_7_INFERRED"):	
	os.system("cp " + src + "/data_manager_xilinx_fifo.vhd " + \
			dest + \
			"/data_manager.vhd")
	os.system("cp " + src + \
	              "/fifo.vhd " + \
	               dest + "/")
	os.system("sed -i s/.*\?toolset/\#\?toolset/g " + dest + \
			   "/../cfg/ots_interface.dep")

print "Installed Chosen FIFO Solution: " + fifo
print

#replace PHY SOLUTION
phy = "MII_100_1000" #default phy
if (args.phy):     #if option used, then use args.phy
    phy = args.phy
	
#if (phy != "XILINX_7SERIES_MII" or 
#	phy != "XILINX_7SERIES_RGMII"): #insert jamieson fifo
#	os.system("cp " + src + "/data_manager_xilinx_fifo.vhd " + \
#			dest + \
#			"/ethernet_controller/data_manager.vhd")
#	os.system("cp " + src + \
#	              "/fifo.vhd " + \
#	               dest + "/ethernet_controller/")
#	os.system("sed -i s/.*\?toolset/\#\?toolset/g " + dest + \
#			   "/../cfg/ots_interface.dep")

if (phy == "XILINX_7SERIES_MII"):
	phy = "MII_100_1000" #for xmii handler choice
	
if (phy != "XILINX_7SERIES_RGMII" and
    phy != "MII_100_1000" and
    phy != "LOGIC_RGMII"):
    print "WARNING: Unrecognized -p PHY argument " + \
        "(may want to use -h for help): '" + \
        phy + "'?"

os.system("sed -i s/LOGIC_RGMII_handler/" + phy + "_handler/g " + dest + \
              "/ethernet_controller_wrapper.vhd")

os.system("mv " + dest + "/" + phy + \
              "_xmii_handler.vhd " + dest + \
              "/xmii_handler.vhd")
os.system("rm " + dest + "/*_xmii_handler.vhd")

print "Installed Chosen PHY Solution: " + phy
print


#set default IP address
ip = 2;
if(args.ip > 0 and args.ip < 255):
    ip = args.ip
os.system("sed -i s/ETH_CONTROLLER_DEFAULT_ADDR.*\;/" + \
              "ETH_CONTROLLER_DEFAULT_ADDR\:\ std_logic_vector\(7\ downto\ 0\)\ \:\=\ " + \
              "std_logic_vector\(to_unsigned\("+str(ip)+",8\)\)\;/g " + dest + \
              "/params_package.vhd")

print "Set Default IP Address: " + str(ip)
print

#NOTE: port currently not in use!
#set default PORT address
#port = 2001;
#if(args.port > -1 and args.port < 65536):
#    port = args.port
#os.system("sed -i s/ETH_CONTROLLER_DEFAULT_PORT.*\;/" + \
#              "ETH_CONTROLLER_DEFAULT_PORT\:\ std_logic_vector\(15\ downto\ 0\)\ \:\=\ " + \
#              "std_logic_vector\(to_unsigned\("+str(port)+",16\)\)\;/g " + dest + \
#              "/ethernet_controller/params_package.vhd")
#
#print "Set Default Port: " + str(port)
#print

print "Increase reset size for real life situations to 100 clocks"
print

os.system("sed -i s/cnt.*\<.*then/cnt\ \<\ 100\ then/g " + dest + \
		"/reset_mgr.vhd")

print
print 'Moving files...'
print

# #moving to hdl/data_manager
# os.system("mv " + dest + "/ethernet_controller/rx_ctl.vhd " + dest + \
#               "/data_manager/")
# os.system("mv " + dest + "/ethernet_controller/tx_seq_ctl.vhd " + dest + \
#               "/data_manager/")
# os.system("mv " + dest + "/ethernet_controller/ram_comm_dec.vhd " + dest + \
#               "/data_manager/")
# os.system("mv " + dest + "/ethernet_controller/data_manager.vhd " + dest + \
#               "/data_manager/")
# os.system("mv " + dest + \
#               "/ethernet_controller/burst_controller_sm.vhd " + dest + \
#               "/data_manager/")
# os.system("mv " + dest + "/ethernet_controller/inferredFifo.vhd " + dest + \
#               "/data_manager/");

# #moving to hdl/
# os.system("mv " + dest + "/ethernet_controller/params_package.vhd " + dest + \
#               "/")
# os.system("mv " + dest + \
#               "/ethernet_controller/ethernet_interface.vhd " + dest + "/")
# os.system("mv " + dest + \
#               "/ethernet_controller/burst_traffic_controller.vhd " + dest + "/")
# os.system("mv " + dest + \
# 		"/ethernet_controller/reset_mgr.vhd " + dest + "/")

		




print
print 'Removing files for tidiness...'
print

os.system("rm -f " + dest + "/top_tmp.vhd")
os.system("rm -f " + dest + "/inferredFifo.vhd")
os.system("rm -f " + dest + "/ram_chip_simulator.vhd")
os.system("rm -f " + dest + "/ram_memory_test.vhd")
os.system("rm -f " + dest + "/ram_tester*")
os.system("rm -f " + dest + "/data_manager_xilinx_fifo.vhd")


if not args.flash:
    os.system("rm -f " + dest + "/ram_interface.vhd")
    os.system("rm -f " + dest + "/ram_controller.vhd")
    
    
print
print 'Integration complete.'
print


##### done
print
print "***********************\n"
print "Success!"
print
print
