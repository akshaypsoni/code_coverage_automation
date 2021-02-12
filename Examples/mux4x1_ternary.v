module mux2x1_ternary(a,b,sel,y);
  input a,b,sel;
  output y;
  
  assign y=sel?b:a;
  
endmodule

module mux4x1_ternary(a,b,c,d,sel,y);
  input a,b,c,d;
  input [1:0]sel;
  output y;
  
  assign y=sel[1]?(sel[0]?d:c):(sel[0]?b:a);
  
endmodule

module mux4x1_ternary_tb;
  reg a,b,c,d;
  reg [1:0]sel;
  wire y;
  
  mux4x1_ternary dut4(a,b,c,d,sel,y);
  
  initial
  begin
    a=0;b=0;c=0;d=0;sel=0;
  end
  
  always #10  a=~a;
  always #20  b=~b;
  always #40  c=~c;
  always #80  d=~d;
  always #160 sel=sel+1;
  
endmodule


