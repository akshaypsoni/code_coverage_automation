module mux2x1_gate(a,b,sel,y);
  input a,b,sel;
  output y;
  wire p,q;
  
  and(p,a,!sel);
  and(q,b,sel);
  or(y,p,q);
  
endmodule


module mux4x1_gate(a,b,c,d,sel1,sel2,y);
  input a,b,c,d,sel1,sel2;
  output y;
  wire p,q;
  
  mux2x1_gate dut1(a,b,sel1,p);
  mux2x1_gate dut2(c,d,sel1,q);
  mux2x1_gate dut3(p,q,sel2,y);
  
endmodule

module mux4x1_gate_tb;
  reg a,b,c,d;
  reg sel1,sel2;
  
  mux4x1_gate dut4(a,b,c,d,sel1,sel2,y);
  
  initial
  begin
    a=0;b=0;c=0;d=0;sel1=0;sel2=0;
  end
  
  always #10  a=~a;
  always #20  b=~b;
  always #40  c=~c;
  always #80  d=~d;
  always #160 sel1=~sel1;
  always #320 sel2=~sel2;
  
endmodule
  
 

