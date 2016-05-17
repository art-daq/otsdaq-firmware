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
parser.add_argument('-b','--board',default='kc705',
		help='Select a board by directory name within in the project\'s cactus library. ' + \
		'Default is picozed.')
parser.add_argument('-p','--phy',type=int,default=8,
		choices=[8,4],
		help='Number of rx or tx pins used by Ethernet PHY. Default is 8 ' +\
		'(e.g. use 8 for GMII, 4 for RGMII)') #, 1 for SGMII)')
parser.add_argument('-r','--reset',nargs='?',const='YES',
		help='Flag to add reset output pin to top level. If not present, the reset pin is commented.' + \
		' (e.g. It may be necessary to hold the PHY reset high)')
							
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

print  'PHY interface pin count selected as: ' + str(args.phy) #1, 4, 8
if (args.phy < 1):
	args.phy = 1
if (args.phy > 8):
	args.phy = 8
for i in range(0, args.phy):
	os.system("sed -i s/.\*PHY\_RXD"+str(i)+".\*\:\ in/\\\tPHY\_RXD"+str(i)+"\\\t\:\ in/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*IBUF\_PHY\_RXD"+str(i)+"/\\\tIBUF\_PHY\_RXD"+str(i)+"/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*PHY\_TXD"+str(i)+".\*\:\ out/\\\tPHY\_TXD"+str(i)+"\\\t\:\ out/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*OBUF\_PHY\_TXD"+str(i)+"/\\\tOBUF\_PHY\_TXD"+str(i)+"/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
for i in range(args.phy, 8):
	os.system("sed -i s/.\*PHY\_RXD"+str(i)+".\*\:\ in/--\\\tPHY\_RXD"+str(i)+"\\\t\:\ in/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*IBUF\_PHY\_RXD"+str(i)+"/--\\\tIBUF\_PHY\_RXD"+str(i)+"/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*PHY\_TXD"+str(i)+".\*\:\ out/--\\\tPHY\_TXD"+str(i)+"\\\t\:\ out/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*OBUF\_PHY\_TXD"+str(i)+"/--\\\tOBUF\_PHY\_TXD"+str(i)+"/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
 	
if(args.phy<8): #set unused rxd to 0
	os.system("sed -i s/.\*GMII\_RXD\_0\_sig.\*\<\=/\\\tGMII\_RXD\_0\_sig\(7\ downto\ "+str(args.phy)+"\)\ \<\=/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
else:
	os.system("sed -i s/.\*GMII\_RXD\_0\_sig.\*\<\=/--removed\ by\ script/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")

if(args.phy<8): #assume no separate ER pins
#	os.system("sed -i s/.\*PHY\_RXER.\*\:\ in/--\\\tPHY\_RXER\\\t\:\ in/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*PHY\_TXER.\*\:\ out/--\\\tPHY\_TXER\\\t\:\ out/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
#	os.system("sed -i s/.\*OBUF\_PHY\_RXER/--\\\tOBUF\_PHY\_RXER/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*OBUF\_PHY\_TXER/--\\\tOBUF\_PHY\_TXER/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
else:
#	os.system("sed -i s/.\*PHY\_RXER.\*\:\ in/\\\tPHY\_RXER\\\t\:\ in/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*PHY\_TXER.\*\:\ out/\\\tPHY\_TXER\\\t\:\ out/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
#	os.system("sed -i s/.\*OBUF\_PHY\_RXER/\\\tOBUF\_PHY\_RXER/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*OBUF\_PHY\_TXER/\\\tOBUF\_PHY\_TXER/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")

#handle reset arg flag
if (args.reset or args.board == "kc705"):	
	print  'PHY interface reset pin added.'
	os.system("sed -i s/.\*PHY\_RESET.\*\:\ out/\\\tPHY\_RESET\\\t\:\ out/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*OBUF\_PHY\_RESET/\\\tOBUF\_PHY\_RESET/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
else:
	print  'PHY interface reset pin removed.'
	os.system("sed -i s/.\*PHY\_RESET.\*\:\ out/--\\\tPHY\_RESET\\\t\:\ out/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")
	os.system("sed -i s/.\*OBUF\_PHY\_RESET/--\\\tOBUF\_PHY\_RESET/g " + scriptDir + "/../hdl/TOP_LEVEL.vhd")


print
print "***********************\n"
print 'Success!'
print
print

