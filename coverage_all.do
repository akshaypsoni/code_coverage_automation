#TCL-TK script for code coverage automation of all modules present in the folder

#Get all filenames in present working directory (pwd)
set files [glob *.v]
#print all filenames
puts files


#Loop starts to find code coverage for the module one by one.
foreach filename $files { 
    set f [string trimright $filename ".v"]
    if [ file exists $f ] {
        file delete -force $f
    }
    set testbench $f
    append testbench "_tb"
    vlog -cover bcst $filename
    vsim -novopt -coverage $testbench
    add wave *
    run 100000
    coverage report -html
    file copy covhtmlreport $f
    quit -sim
}
