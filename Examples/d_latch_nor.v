module d_latch1(q,d,en);
  input d,en;
  output q;
  wire p,s,r;
  
  nor n1(s,d,!en);
  nor n2(r,!d,!en);
  nor n3(q,s,p);
  nor n4(p,r,q);

endmodule

module d_latch_nor_tb;
  reg d,en;
  wire q;
  
  d_latch1 uut(q,d,en);
  
  initial
  begin
    d=1'b0; en=1'b1;
  end
  
  always #50 d=~d;
  always #400 en=~en;
  
endmodule