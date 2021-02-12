//Verilog code for D-latch using switch level

module d_latch(q,d,en);
  input d,en;
  output q;
  wire p,s,r;
  
  nand n1(s,d,en);
  nand n2(r,!d,en);
  nand n3(q,s,p);
  nand n4(p,r,q);

endmodule

module d_latch_nand_tb;
  reg d,en;
  wire q;
  
  d_latch uut(q,d,en);
  
  initial
  begin
    d=1'b0; en=1'b1;
  end
  
  always #50 d=~d;
  always #400 en=~en;
  
endmodule
