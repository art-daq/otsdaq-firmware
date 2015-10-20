mkdir -p output

# echo "----- Bad product -----"
# ./dep_tree.py -p bad $(pwd)/../../ projects/examples/mp7_690es
# echo "----- To StdOut -----"
# ./dep_tree.py -p x $(pwd)/../../ projects/examples/mp7_690es
# echo "----- Xtclsh -----"
# ./dep_tree.py -p x $(pwd)/../../ -o output/ise.tcl projects/examples/mp7_690es -v
# echo "----- Vivado -----"
# ./dep_tree.py -p v $(pwd)/../../ -o output/vivado.tcl projects/examples/mp7_690es -v
# echo "----- Components -----"
# ./dep_tree.py -p c $(pwd)/../../ -o output/components.txt projects/examples/mp7_690es
# echo "----- Source List -----"
# ./dep_tree.py -p f2 $(pwd)/../../ -o output/addresstables.xml projects/examples/mp7_690es
# echo "----- Address Table List -----"
# ./dep_tree.py -p a $(pwd)/../../ -o output/addresstables.txt projects/examples/mp7_690es
# echo "----- Address Table Generator -----"
# ./dep_tree.py -p b $(pwd)/../../ -o output/addresstablegenerator.txt projects/examples/mp7_690es
echo "----- Modelsim Script -----"
./dep_tree.py -p s $(pwd)/../../ -o output/modelsim.tcl projects/examples/mp7_sim


