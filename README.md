# code_coverage_automation
TCL-TK script / do script to find code coverage for all modules in folder 

Note: Tested on Questa Sim Software

1. module name and testbench name should be as follows:
   
   for example, 
    module name => fulladder
    
    testbench name => fullader_tb (Suffix "_tb")

2. Copy do script in the same folder of design and testbench folder.

3. Open Questa Sim Software, go to destination folder and Run the script as follows:
    do coverage.do 
    do coverage_all.do

4. Now,Script automatically run every module and find code coverage for that. 

5. At last, Coverage report generated and stored in new folder.
