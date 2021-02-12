module alu(a,b,sel,c,borrow,carry,equal,less,more);
  input [7:0]a,b;
  input [2:0]sel;
  output reg [7:0]c;
  output reg borrow,carry,equal,less,more;
  reg [8:0]temp;

  initial begin 
    borrow=1'b0;
    carry=1'b0;
    equal=1'b0;
    less=1'b0;
    more=1'b0;
  end
    
  always@(*)
  begin
    case(sel)
    3'b000: begin 
                temp=a+b; 
                c=temp[7:0];
                borrow=0;
                carry=temp[8];
                equal=1'b0;
                less=1'b0;
                more=1'b0;
            end
              
    3'b001: begin 
                temp=a-b; 
                c=temp[7:0];
                borrow=temp[8];
                carry=0;
                equal=1'b0;
                less=1'b0;
                more=1'b0;
            end 
            
    3'b010: begin 
                c=a^b; 
                borrow=0;
                carry=0;
                equal=1'b0;
                less=1'b0;
                more=1'b0;
            end 
             
    3'b011: begin 
                c=a&b; 
                borrow=0;
                carry=0;
                equal=1'b0;
                less=1'b0;
                more=1'b0;
            end
    
    3'b100: begin 
                c=~(a|b); 
                borrow=0;
                carry=0;
                equal=1'b0;
                less=1'b0;
                more=1'b0;
            end 
             
    3'b101: begin 
                c=~(a&b); 
                borrow=0;
                carry=0;
                equal=1'b0;
                less=1'b0;
                more=1'b0;
            end
            
    3'b110: begin
              c=8'b0;
              borrow=0;
              carry=0;
              if(a>b)
                begin
                  equal=1'b0;
                  less=1'b0;
                   more=1'b1;
                end
              else if(b>a)
                begin
                  equal=1'b0;
                  less=1'b1;
                  more=1'b0;
                end
              else
                begin
                  equal=1'b1;
                  less=1'b0;
                  more=1'b0;
                end
             end
    endcase  
  end
      
endmodule


module alu_8bit_tb;
  parameter T=80;
  reg [7:0]a,b;
  reg [2:0]sel;
  wire [7:0]c;
  wire borrow,carry,equal,less,more;
  
  alu uut(a,b,sel,c,borrow,carry,equal,less,more);
  
  initial begin
    a=0; b=0; sel=0;
    #T a=8'hff; b=8'h00;
    #T a=8'hff; b=8'hff;
    #T a=8'h00; b=8'hff;
    #T a=8'h00; b=8'h00;
  end
  
  always #10 sel=sel+1;
  
endmodule
  
  
  
