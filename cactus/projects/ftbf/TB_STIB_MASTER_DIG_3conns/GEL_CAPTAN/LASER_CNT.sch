VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex4"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL LASER_TEST(15:0)
        SIGNAL XLXN_416
        SIGNAL XLXN_453
        SIGNAL XLXN_461
        SIGNAL XLXN_463
        SIGNAL LASER_FREQUENCY(15:0)
        SIGNAL LASER_TEST(6)
        SIGNAL CLOCK_LASER
        PORT Output LASER_FREQUENCY(15:0)
        PORT Input CLOCK_LASER
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF cb16ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 384 -192 320 -192 
            RECTANGLE N 320 -268 384 -244 
            LINE N 384 -256 320 -256 
            LINE N 0 -192 64 -192 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 384 -128 320 -128 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_343 vcc
            PIN P XLXN_416
        END BLOCK
        BEGIN BLOCK XLXI_356 cb16ce
            PIN C CLOCK_LASER
            PIN CE XLXN_416
            PIN CLR XLXN_453
            PIN CEO
            PIN Q(15:0) LASER_TEST(15:0)
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_357 gnd
            PIN G XLXN_453
        END BLOCK
        BEGIN BLOCK XLXI_360 vcc
            PIN P XLXN_461
        END BLOCK
        BEGIN BLOCK XLXI_361 cb16ce
            PIN C LASER_TEST(6)
            PIN CE XLXN_461
            PIN CLR XLXN_463
            PIN CEO
            PIN Q(15:0) LASER_FREQUENCY(15:0)
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_362 gnd
            PIN G XLXN_463
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH LASER_TEST(15:0)
            WIRE 1824 624 1984 624
            BEGIN DISPLAY 1984 624 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_416
            WIRE 1296 688 1440 688
        END BRANCH
        INSTANCE XLXI_343 1232 688 R0
        INSTANCE XLXI_356 1440 880 R0
        BEGIN BRANCH XLXN_453
            WIRE 1440 848 1440 880
        END BRANCH
        INSTANCE XLXI_357 1376 1008 R0
        BEGIN BRANCH XLXN_461
            WIRE 1296 1104 1440 1104
        END BRANCH
        INSTANCE XLXI_360 1232 1104 R0
        INSTANCE XLXI_361 1440 1296 R0
        BEGIN BRANCH XLXN_463
            WIRE 1440 1264 1440 1296
        END BRANCH
        INSTANCE XLXI_362 1376 1424 R0
        BEGIN BRANCH LASER_FREQUENCY(15:0)
            WIRE 1824 1040 1984 1040
        END BRANCH
        BEGIN BRANCH LASER_TEST(6)
            WIRE 1216 1168 1440 1168
            BEGIN DISPLAY 1216 1168 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 1216 752 CLOCK_LASER R180 28
        BEGIN BRANCH CLOCK_LASER
            WIRE 1216 752 1440 752
        END BRANCH
        IOMARKER 1984 1040 LASER_FREQUENCY(15:0) R0 28
    END SHEET
END SCHEMATIC
