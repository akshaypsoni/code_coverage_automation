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

if [ file exists $f ] {
    file delete -force $f
}
    
set testbench $f
append testbench "_tb"
puts $f
puts $testbench

vlog -cover bcst $filename
vsim -novopt -coverage $testbench
add wave *
run 100000
coverage report -html
file copy -force covhtmlreport $f
quit -sim
