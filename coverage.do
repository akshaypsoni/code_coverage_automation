puts "Enter a filename"
gets stdin filename
puts "Enter testbench name"
gets stdin testbench
set f [string trimright $filename ".v"]

if [ file exists $f ] {
    file delete -force $f
}
    
#set testbench $f
#append testbench "_tb"
puts $f
puts $testbench

vlog -cover bcst $filename
vsim -novopt -coverage $testbench
add wave *
run 100000
coverage report -html
file copy -force covhtmlreport $f
quit -sim
