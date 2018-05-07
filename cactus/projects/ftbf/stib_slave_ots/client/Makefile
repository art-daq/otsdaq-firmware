ROOTOPTS = `root-config --cflags`
ROOTLIBS = `root-config --libs`
CPPOPTS  = -g
LIBS     = $(ROOTLIBS)

configure: configure.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o configure configure.cc stib.cc $(ROOTLIBS)
configure_int: configure_int.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o configure_int configure_int.cc stib.cc $(ROOTLIBS)
configure_new: configure_new.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o configure_new configure_new.cc stib.cc $(ROOTLIBS)
configure_purdue: configure_purdue.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o configure_purdue configure_purdue.cc stib.cc $(ROOTLIBS)
state: state.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o state state.cc stib.cc $(ROOTLIBS)
reset_bco: reset_bco.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o reset_bco reset_bco.cc stib.cc $(ROOTLIBS)
reset_vipic_ts: reset_vipic_ts.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o reset_vipic_ts reset_vipic_ts.cc stib.cc $(ROOTLIBS)

reset_bco_lorenzo: reset_bco_lorenzo.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o reset_bco_lorenzo reset_bco_lorenzo.cc stib.cc $(ROOTLIBS)

pulseheight : pulseheight.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o pulseheight pulseheight.cc stib.cc $(ROOTLIBS)
pedestal5 : pedestal5.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o pedestal5 pedestal5.cc stib.cc $(ROOTLIBS)
scrw: scrw.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o scrw scrw.cc stib.cc $(ROOTLIBS)
setdac: setdac.cc stib.cc stib.hh
	g++ -o setdac setdac.cc stib.cc
dthr : dthr.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o dthr dthr.cc stib.cc $(ROOTLIBS)
peek: peek.cc stib.cc stib.hh
	g++ -o peek peek.cc stib.cc
poke: poke.cc stib.cc stib.hh
	g++ -o poke poke.cc stib.cc
aqbco: aqbco.cc stib.cc stib.hh
	g++ -o aqbco aqbco.cc stib.cc
stripstream: stripstream.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o stripstream stripstream.cc stib.cc $(ROOTLIBS)
printstream: printstream.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o printstream printstream.cc stib.cc $(ROOTLIBS)
check_trigger: check_trigger.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o check_trigger check_trigger.cc stib.cc $(ROOTLIBS)
storestream: storestream.cc stib.cc stib.hh
	g++ -o storestream storestream.cc stib.cc
RWRegister: RWRegister.cc stib.cc stib.hh
	g++ $(ROOTOPTS) -o RWRegister RWRegister.cc stib.cc
pedestalLore : pedestalLore.cc stib.cc stib.hh
	g++ -Wall $(ROOTOPTS) -o pedestalLore pedestalLore.cc stib.cc $(ROOTLIBS)
startStream : startStream.cc stib.cc stib.hh
	g++ -Wall $(ROOTOPTS) -o startStream startStream.cc stib.cc $(ROOTLIBS)
pedestalAndThreshold : pedestalAndThreshold.cc stib.cc stib.hh
	g++ -Wall $(ROOTOPTS) -o pedestalAndThreshold pedestalAndThreshold.cc stib.cc $(ROOTLIBS)
