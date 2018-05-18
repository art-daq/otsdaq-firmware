VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex4"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL DCK
        SIGNAL D1_IN
        SIGNAL D0_IN
        SIGNAL DOUT(1)
        SIGNAL DOUT(0)
        SIGNAL DOUT(2)
        SIGNAL DOUT(3)
        SIGNAL DOUT(4)
        SIGNAL DOUT(6)
        SIGNAL DOUT(8)
        SIGNAL DOUT(10)
        SIGNAL DOUT(5)
        SIGNAL DOUT(11)
        SIGNAL DOUT(7)
        SIGNAL DOUT(9)
        SIGNAL DOUT(11:0)
        SIGNAL D0
        SIGNAL D1
        PORT Input DCK
        PORT Input D1_IN
        PORT Input D0_IN
        PORT Output DOUT(11:0)
        PORT Output D0
        PORT Output D1
        BEGIN BLOCKDEF fd
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -320 320 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF fd_1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            RECTANGLE N 64 -320 320 -64 
            LINE N 64 -112 80 -128 
            LINE N 80 -128 64 -144 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCK XLXI_38 fd
            PIN C DCK
            PIN D DOUT(2)
            PIN Q DOUT(0)
        END BLOCK
        BEGIN BLOCK XLXI_62 fd_1
            PIN C DCK
            PIN D DOUT(3)
            PIN Q DOUT(1)
        END BLOCK
        BEGIN BLOCK XLXI_61 fd_1
            PIN C DCK
            PIN D DOUT(5)
            PIN Q DOUT(3)
        END BLOCK
        BEGIN BLOCK XLXI_60 fd_1
            PIN C DCK
            PIN D DOUT(7)
            PIN Q DOUT(5)
        END BLOCK
        BEGIN BLOCK XLXI_59 fd_1
            PIN C DCK
            PIN D DOUT(9)
            PIN Q DOUT(7)
        END BLOCK
        BEGIN BLOCK XLXI_56 fd_1
            PIN C DCK
            PIN D DOUT(11)
            PIN Q DOUT(9)
        END BLOCK
        BEGIN BLOCK XLXI_55 fd_1
            PIN C DCK
            PIN D D1_IN
            PIN Q DOUT(11)
        END BLOCK
        BEGIN BLOCK XLXI_36 fd
            PIN C DCK
            PIN D DOUT(4)
            PIN Q DOUT(2)
        END BLOCK
        BEGIN BLOCK XLXI_34 fd
            PIN C DCK
            PIN D DOUT(6)
            PIN Q DOUT(4)
        END BLOCK
        BEGIN BLOCK XLXI_32 fd
            PIN C DCK
            PIN D DOUT(8)
            PIN Q DOUT(6)
        END BLOCK
        BEGIN BLOCK XLXI_30 fd
            PIN C DCK
            PIN D DOUT(10)
            PIN Q DOUT(8)
        END BLOCK
        BEGIN BLOCK XLXI_28 fd
            PIN C DCK
            PIN D D0_IN
            PIN Q DOUT(10)
        END BLOCK
        BEGIN BLOCK XLXI_254 buf
            PIN I DOUT(1)
            PIN O D1
        END BLOCK
        BEGIN BLOCK XLXI_255 buf
            PIN I DOUT(0)
            PIN O D0
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 7040 5440
        BEGIN BRANCH DCK
            WIRE 544 2192 848 2192
        END BRANCH
        BEGIN BRANCH D1_IN
            WIRE 896 1408 912 1408
            WIRE 912 1408 928 1408
            WIRE 928 1408 1312 1408
            WIRE 1312 1408 1376 1408
        END BRANCH
        BEGIN BRANCH D0_IN
            WIRE 832 1760 848 1760
            WIRE 848 1760 1376 1760
        END BRANCH
        BEGIN BRANCH DOUT(1)
            WIRE 4224 1408 4288 1408
            WIRE 4288 1408 4336 1408
            BEGIN DISPLAY 4288 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(0)
            WIRE 4224 1760 4304 1760
            WIRE 4304 1760 4320 1760
            BEGIN DISPLAY 4304 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_38 3840 2016 R0
        INSTANCE XLXI_62 3840 1664 R0
        INSTANCE XLXI_61 3344 1664 R0
        INSTANCE XLXI_60 2864 1664 R0
        INSTANCE XLXI_59 2384 1664 R0
        INSTANCE XLXI_56 1872 1664 R0
        INSTANCE XLXI_55 1376 1664 R0
        INSTANCE XLXI_36 3344 2016 R0
        INSTANCE XLXI_34 2864 2016 R0
        INSTANCE XLXI_32 2384 2016 R0
        INSTANCE XLXI_30 1872 2016 R0
        INSTANCE XLXI_28 1376 2016 R0
        BEGIN BRANCH DCK
            WIRE 3248 1536 3280 1536
            WIRE 3280 1536 3344 1536
            BEGIN DISPLAY 3280 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DCK
            WIRE 3728 1536 3760 1536
            WIRE 3760 1536 3840 1536
            BEGIN DISPLAY 3760 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DCK
            WIRE 3744 1888 3776 1888
            WIRE 3776 1888 3840 1888
            BEGIN DISPLAY 3776 1888 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DCK
            WIRE 3248 1888 3280 1888
            WIRE 3280 1888 3344 1888
            BEGIN DISPLAY 3280 1888 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(2)
            WIRE 3728 1760 3744 1760
            WIRE 3744 1760 3840 1760
            BEGIN DISPLAY 3744 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(3)
            WIRE 3728 1408 3776 1408
            WIRE 3776 1408 3840 1408
            BEGIN DISPLAY 3776 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DCK
            WIRE 2768 1888 2800 1888
            WIRE 2800 1888 2864 1888
            BEGIN DISPLAY 2800 1888 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DCK
            WIRE 1280 1888 1312 1888
            WIRE 1312 1888 1376 1888
            BEGIN DISPLAY 1312 1888 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DCK
            WIRE 1776 1888 1808 1888
            WIRE 1808 1888 1872 1888
            BEGIN DISPLAY 1808 1888 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DCK
            WIRE 2288 1888 2320 1888
            WIRE 2320 1888 2384 1888
            BEGIN DISPLAY 2320 1888 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DCK
            WIRE 2768 1536 2800 1536
            WIRE 2800 1536 2864 1536
            BEGIN DISPLAY 2800 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DCK
            WIRE 2288 1536 2320 1536
            WIRE 2320 1536 2384 1536
            BEGIN DISPLAY 2320 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DCK
            WIRE 1776 1536 1808 1536
            WIRE 1808 1536 1872 1536
            BEGIN DISPLAY 1808 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DCK
            WIRE 1280 1536 1312 1536
            WIRE 1312 1536 1376 1536
            BEGIN DISPLAY 1312 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(4)
            WIRE 3248 1760 3264 1760
            WIRE 3264 1760 3344 1760
            BEGIN DISPLAY 3264 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(6)
            WIRE 2768 1760 2816 1760
            WIRE 2816 1760 2864 1760
            BEGIN DISPLAY 2816 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(8)
            WIRE 2256 1760 2288 1760
            WIRE 2288 1760 2384 1760
            BEGIN DISPLAY 2288 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(10)
            WIRE 1760 1760 1808 1760
            WIRE 1808 1760 1872 1760
            BEGIN DISPLAY 1808 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(5)
            WIRE 3248 1408 3280 1408
            WIRE 3280 1408 3344 1408
            BEGIN DISPLAY 3280 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(11)
            WIRE 1760 1408 1808 1408
            WIRE 1808 1408 1872 1408
            BEGIN DISPLAY 1808 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(7)
            WIRE 2768 1408 2800 1408
            WIRE 2800 1408 2864 1408
            BEGIN DISPLAY 2800 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(9)
            WIRE 2256 1408 2320 1408
            WIRE 2320 1408 2384 1408
            BEGIN DISPLAY 2320 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DOUT(11:0)
            WIRE 3968 2224 4448 2224
        END BRANCH
        IOMARKER 544 2192 DCK R180 28
        IOMARKER 4448 2224 DOUT(11:0) R0 28
        INSTANCE XLXI_254 4336 1440 R0
        INSTANCE XLXI_255 4320 1792 R0
        BEGIN BRANCH D0
            WIRE 4544 1760 4688 1760
        END BRANCH
        BEGIN BRANCH D1
            WIRE 4560 1408 4640 1408
        END BRANCH
        IOMARKER 4640 1408 D1 R0 28
        IOMARKER 4688 1760 D0 R0 28
        IOMARKER 896 1408 D1_IN R180 28
        IOMARKER 832 1760 D0_IN R180 28
    END SHEET
END SCHEMATIC
