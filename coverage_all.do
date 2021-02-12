set files [glob *.v]
puts files

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
