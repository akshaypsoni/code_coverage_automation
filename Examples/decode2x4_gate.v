module decode2x4(y,a,b);
  input a,b;
  output [3:0]y;
  
  and(y[0],!a,!b);
  and(y[1],!a,b);
  and(y[2],a,!b);
  and(y[3],a,b);
  

endmodule

module decode2x4_gate_tb;
  reg a,b;
  wire [3:0]y;
  
  decode2x4 dut (y,a,b);
  initial
  begin
    a=0;b=0;
  end
  always #40 a=a+1;
  always #20 b=b+1;
  
endmodule
