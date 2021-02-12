module dff(q,d,rst,clk);
  input d,rst,clk;
  output reg q;
  
  always@(posedge clk,posedge rst)
  begin
    if(rst)
      q=0;
    else
      q=d;
  end 
endmodule

module dff_tb;
  reg d,rst,clk;
  wire q;
  
  dff uut(q,d,rst,clk);
  initial begin
    d=1; rst=0; clk=0;
    #180 rst=1;
    #20 rst=0;
    #410 rst=1;
    #30 rst=0;
  end
  
  always #250 d=~d;
  always #50 clk=~clk;
  
endmodule
