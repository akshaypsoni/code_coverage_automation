module dff_procd(q,d,clr,pre,clk); 
  input    d,clr,pre,clk ;
  output reg q;
  
  always @ (posedge clk)    
    q<=d; 
       
  always @ (clr,pre)
  begin     
    if (clr==0)         
      assign q=0;      
    else if (pre==1)
      assign q=1;
    else        
     deassign q;
  end
                            
endmodule

module dff_procedural_tb;
  reg d,clr,pre,clk;
  wire q;
  
  dff_procd uut (q,d,clr,pre,clk);
  
  initial
  begin
    d=0;clr=0;pre=1;clk=0;
    #10
    clr=1;pre=0;
  end
  
  always #10 clk=~clk;
  always #20 d=~d;
  always #200 pre = ~pre;
  always #400 clr = ~clr;
  
  always @ (pre)
  begin
    if(pre)
    force uut.q = pre;
    else
    release uut.q;
end
  
endmodule


