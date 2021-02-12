module nor3(a,b,c,d);
  input a,b,c;
  output d;
  wire w0,w1;
  
  supply0 gnd;
  supply1 vcc;
  
  pmos p1(w0,vcc,a);
  pmos p2(w1,w0,b);
  pmos p3(d,w1,c);
  nmos n1(d,gnd,a);
  nmos n2(d,gnd,b);
  nmos n3(d,gnd,c);
  
endmodule

module nor3_tb;
  reg a,b,c;
  wire d;
  
  nor3 uut(a,b,c,d);
  
  initial
  begin
    a=0;b=0;c=0;
  end
  
  always begin #200 a=~a; end
  always begin #100 b=~b; end
  always begin #50 c=~c; end
  
endmodule

