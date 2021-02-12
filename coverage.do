#TCL-TK code for code coverage automation 

#Ask for verilog filename to user
puts "Enter a verilog filename"
#Read filename from user
gets stdin filename

#Ask for testbench name to user
#puts "Enter testbench name"
#Read testbench name from user
#gets stdin testbench

set f [string trimright $filename ".v"]

#Check file present in folder if present then delete the last file
if [ file exists $f ] {
    file delete -force $f
}

set testbench $f
append testbench "_tb"

#Print filename
puts $f
#Print testbench name
puts $testbench

#Compile the verilog code
vlog -cover bcst $filename

#Simulate the verilog code
vsim -novopt -coverage $testbench

#add all waves to sim window
add wave *
#run for particular time
run 100000

#Generate coverage report in HTML
coverage report -html

#Make new folder as module name and Copy coverage report to it 
file copy -force covhtmlreport $f

#Exit the simulation
quit -sim
