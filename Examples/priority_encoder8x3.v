module priority_encoder8x3(d,y);
  input [7:0]d;
  output reg [2:0]y;
    
always @ (*) 
begin
  casez(d)
   8'b1???????: y=3'b111;
   8'b01??????: y=3'b110;
   8'b001?????: y=3'b101;
   8'b0001????: y=3'b100;
   8'b00001???: y=3'b011;
   8'b000001??: y=3'b010;
   8'b0000001?: y=3'b001;
   8'b00000001: y=3'b000;
   default: y=3'bxxx;
 endcase
end
endmodule

module priority_encoder8x3_tb;
  reg [7:0] d;
  wire [2:0] y;
  
  priority_encoder8x3 uut(d,y);
  
  initial 
  begin
  d=8'b0;
  #50 d=8'b01zzzzzz;
  #50 d=8'b01010101;
  #50 d=8'b00000000;
  #50 d=8'b11111111;
  #50 d=8'b00001100;
  #50 d=8'b01010101;
  #50 d=8'b10101010;
  #50 d=8'b00011111;
  #50 d=8'b00z10101;
  #50 d=8'b00001101;
  #50 d=8'b101;
  #50 d=8'b11;
  #50 d=8'b1;
end  
endmodule