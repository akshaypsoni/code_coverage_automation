module decode4x16(a,y);
  input [3:0] a;
  output [15:0] y;
  
  assign y = 16'b1<<a;
  
endmodule
  
module decode4x16_tb;
reg [3:0] a;
wire [15:0] y;
  
decode4x16 uut (a,y);

initial a=4'b0;

always #50 a=a+1;

endmodule