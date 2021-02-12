module pipo_nonblocking(rst,L,clk,value,L_R, out);
  
  input rst,L,L_R,clk;
  input [7:0]value;
  output [7:0]out;
  
  reg [7:0] x;
  assign out = x;
  
  always@(posedge clk)
  begin
    if(rst==1)
      begin
         x <= 0;
      end
    else if(L==1)
      begin
        x <= value;
      end
    else if(L_R == 1)
      begin
        x<={x[6:0],x[7]};
      end
    else
    begin 
        x<={x[0],x[7:1]};
      end
    end
    
  endmodule
  
  
  
  module pipo_tb;
    reg clk,rst,L,L_R;
    reg [7:0]value;
    wire [7:0]out;
    event pipo_load;
    event pipo_rst;
    
    pipo_nonblocking uut(rst,L,clk,value,L_R, out);
    
    initial
  begin
    value=8'hf0;
    clk=0;
    L_R=1;
    #10 ->pipo_rst;
    #50 ->pipo_load;
    #100 value=8'h0f;
    #200 ->pipo_rst;
    #100 ->pipo_load;
    #100 value=8'hf0;
    #200 ->pipo_rst;
    #100 ->pipo_load;
  end
  
  always #20 clk=~clk;
  always #500 L_R=~L_R;
  
  always@(pipo_rst)
  begin
    rst=1;
    #40 rst=0;
  end
  
  always@(pipo_load)
  begin
    L=1;
    #60 L=0;
  end
  
endmodule
    