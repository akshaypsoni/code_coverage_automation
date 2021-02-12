module d_flipflop(q,qn,d,clk,pre,clr);
  input d,clk,pre,clr;
  output q,qn;
  wire clkn,dn,p,m,r,s,t,u;
  
  not(clkn,clk);
  not(dn,d);
  nand(p,d,clkn,clr);
  nand(m,pre,clkn,dn);
  nand(r,pre,p,s);
  nand(s,m,r,clr);
  nand(t,r,clk);
  nand(u,s,clk);
  nand(q,pre,t,qn);
  nand(qn,clr,u,q);
  
  endmodule
  
module d_flipflop_tb;
  reg d,clk,pre,clr;
  wire q,qn;
  
  d_flipflop uut(q,qn,d,clk,pre,clr);
  
  initial
  begin
    clk=0; clr=0; pre=1; d=0;
    #20 clr=1;
    #50 clr=0;
    #20 clr=1;
    #100 pre=0;
    #30 pre=1;
  end

  always #50 clk=~clk;
  always #200 d=~d;

endmodule 
