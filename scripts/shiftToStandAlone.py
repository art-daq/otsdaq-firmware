#!/usr/bin/env python
#____________________________________________________________
#
#  shiftToStandAlone.py
#
#____________________________________________________________
#

import argparse
import os #for isdir abspath dirname system

print
print "***********************\n"
print "Look for 'Success!' at end of print out.\n" + \
	"Setting up and Installing...\n"
print


parser = argparse.ArgumentParser(description='Setup Firmware Component')

parser.add_argument('-s','--source',help='Source file')
parser.add_argument('-d','--dest',default='shiftToStandAloneOut.txt',
	help='Destination file')
	
args = parser.parse_args()

print
print 'Arguments parsed...'
print args
print
print

print 'copying source to dest'
os.system("cp " + args.source + " " + args.dest)
print 'if vivado, changing add_files to import_files'
os.system("sed -i s/add\_files/import_files/g " + args.dest)
print 'if ise, changing xfile add to xfile add -copy'
os.system("sed -i /xfile\ add/\ s/\$/\ \-copy/g " + args.dest)

	
print
print "***********************\n"
print 'Success!'
print
print

