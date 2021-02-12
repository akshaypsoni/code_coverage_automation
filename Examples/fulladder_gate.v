module fulladder_gate(sum,cout,a,b,cin);
  input a,b,cin;
  output sum,cout;
  
  wire p,q,r;
  
  xor x1(sum,a,b,cin);
  and a1(p,a,b);
  and a2(q,b,cin);
  and a3(r,a,cin);
  or o1 (cout,p,q,r);
  
endmodule

module fulladder_gate_tb;
  reg a,b,cin;
  wire sum,cout;
  
  fulladder_gate uut(sum,cout,a,b,cin);
  
  initial begin
    a=0; b=0; cin=0;
  end
  
  always #200 a=~a;
  always #100 b=~b;
  always #50 cin=~cin;
  
endmodule