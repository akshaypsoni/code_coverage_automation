module nand3(a,b,c,d);
  input a,b,c;
  output d;
  wire w0,w1;
  
  supply0 gnd;
  supply1 vcc;
  
  pmos p1(d,vcc,a);
  pmos p2(d,vcc,b);
  pmos p3(d,vcc,c);
  nmos n1(d,w0,a);
  nmos n2(w0,w1,b);
  nmos n3(w1,gnd,c);
  
endmodule

module nand3_tb;
  reg a,b,c;
  wire d;
  
  nand3 uut(a,b,c,d);
  
  initial
  begin
    a=0;b=0;c=0;
  end
  
  always begin #200 a=~a; end
  always begin #100 b=~b; end
  always begin #50 c=~c; end
  
endmodule