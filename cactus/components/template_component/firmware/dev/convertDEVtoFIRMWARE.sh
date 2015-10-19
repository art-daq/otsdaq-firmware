##
## Last modified MONTH DAY, YEAR by NAME <EMAIL>
##
## Usage:
##
##
##        ./<script path>/convert....sh <dest path>
##
##  you can run from any directory..  
## 
##  e.g:  ./convertDEVtoFIRMWARE.sh ../
##
##

#!/bin/tcsh

echo '\n'

if ("x$1" == "x") then

    echo 'Usage: ./convertActiveHDLtoEthInterface.sh <eth_interface/ path> <optional PHY_SOLUTION type string>'
    echo 'PHY_SOLUTION := '
    echo '\t XILINX_7SERIES_RGMII'
    echo '\t LOGIC_RGMII'
    echo '\t MII_100_1000'
    echo '\t(default if blank is MII_100_1000)'

else if (!(-d $1/gec) || !(-d $1/data_manager)) then

    echo "Error: Invalid path (gec and data_manager should be dirs at the specified path '$1')"
 
else 

    echo 'Integrating algorithm...\n\n'
    

    set scriptdir=`/usr/bin/dirname $0`       # may be relative path
    set scriptdir=`cd $scriptdir && pwd`    # ensure absolute path
    echo 'Script directory found as:'
    echo $scriptdir

      
# examples for sed:
#    sed -i s/use\ s1calol2algo\.algorithm_constants.all\;/--/g $scriptdir/../S1CaloL2Algo/compile/Algorithm.vhd
#    sed -i s/library\ s1calol2algo\;/--/g $scriptdir/../S1CaloL2Algo/compile/Algorithm.vhd

    echo 'Copying files...'
    cp $scriptdir/ActiveHDL_proj/ethernet_controller/src/*.vhd $1/gec/
    cp $scriptdir/ActiveHDL_proj/ethernet_controller/src/*.v $1/gec/
    cp $scriptdir/ActiveHDL_proj/ethernet_controller/compile/*.vhd $1/gec/
    
    echo 'Changing permissions...'
    chmod 755 $1/gec/*.vhd
    chmod 755 $1/gec/*.v
    
    echo 'Modifying files...'
    #replace crazy library lines that always creep up in the GEC.vhd
    sed -i s/\\\\//g $1/gec/GEC.vhd

    #replaced inferred fifos with coregen fifos, since inferred doesn't seem to work in ise/vivado
    # 2 steps: uncomment coregen, and comment inferred
    sed -i s/--//g $1/gec/data_manager.vhd
    sed -i s/.\*SCRIPT\ COMMENT\ OUT/--erased/g $1/gec/data_manager.vhd


    #replace PHY_SOLUTION and default to ONLY_GMII
    if(("$2" == "XILINX_7SERIES_RGMII") || ("$2" == "LOGIC_RGMII")) then
	sed -i s/LOGIC_RGMII_handler/$2_handler/g $1/gec/GEC.vhd
	echo "Chosen PHY Solution: $2"
    else   
	sed -i s/LOGIC_RGMII_handler/MII_100_1000_handler/g $1/gec/GEC.vhd
	echo 'Chose default PHY Solution: MII_100_1000'
    endif




    echo 'Moving files...'
    mv $1/gec/GEC_RX_CTL.vhd $1/data_manager/
    mv $1/gec/GEC_TX_SEQ_CTL.vhd $1/data_manager/
    mv $1/gec/RAM_COMM_DEC.vhd $1/data_manager/
    mv $1/gec/params_package.vhd $1/data_manager/
    mv $1/gec/delay_counter.vhd $1/data_manager/
    mv $1/gec/data_manager.vhd $1/data_manager/
    mv $1/gec/burst_controller_sm.vhd $1/data_manager/
    mv $1/gec/inferredFifo.vhd $1/data_manager/

    mv $1/gec/ethernet_interface.vhd $1/
    mv $1/gec/burst_traffic_controller.vhd $1/


    



    echo '\n\nIntegration complete.'	

endif

echo '\n'

  
