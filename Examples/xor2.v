//Verilog code for xor gate using Switch level modelling

module xor2(a,b,c);
  input a,b;
  output c;
  wire d1,d2,w0,w1,w2,w3;
  
  supply0 gnd;
  supply1 vcc;
  
  pmos p0(d1,vcc,a);
  nmos n0(d1,gnd,a);
  pmos p1(d2,vcc,b);
  nmos n1(d2,gnd,b);
  
  pmos p2(w0,vcc,a);
  pmos p3(w0,vcc,d2);
  pmos p4(w3,w0,b);
  pmos p5(w3,w0,d1);
  
  nmos n2(w3,w1,a);
  nmos n3(w1,gnd,d2);
  nmos n4(w3,w2,d1);
  nmos n5(w2,gnd,b);
  
  pmos p6(c,vcc,w3);
  nmos n6(c,gnd,w3);
  
endmodule

module xor2_tb;
  reg a,b;
  wire c;
  
  xor2 uut(a,b,c);
  
  initial
  begin
    a=0;b=0;
  end
  
  always begin #100 a=~a; end
  always begin #50 b=~b; end
  
endmodule
