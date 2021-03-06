module fulladder_4bit(sum,cout,a,b,cin);
  input [3:0]a,b;
  input cin;
  output [3:0]sum;
  output cout;
  
  wire p,q,r;
  
  fulladder f1(sum[0],p,a[0],b[0],cin);
  fulladder f2(sum[1],q,a[1],b[1],p);
  fulladder f3(sum[2],r,a[2],b[2],q);
  fulladder f4(sum[3],cout,a[3],b[3],r);
  
endmodule

module fulladder_4bit_tb;
  reg [3:0]a,b;
  reg cin;
  wire [3:0]sum;
  wire cout;
  
  fulladder_4bit dut (sum,cout,a,b,cin);
  
  initial
  begin
    a=4'b0; b=4'b0; cin=1'b0;
  end
    
  always #200 a=a+1;
  always #100 b=b+1;
  always #50 cin=~cin;
  
endmodule
