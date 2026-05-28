module cla_4bit (
  input [3:0]a , b ,
  input cin ,
  output [3:0]sum ,
  output g_out , p_out,
  output cout 
);
  wire [3:0]p,g,c ;
  
  assign c[0] = cin ;
  
  assign p[0] = a[0] ^ b[0] ;
  assign g[0] = a[0] & b[0] ;
  
  assign p[1] = a[1] ^ b[1] ;
  assign g[1] = a[1] & b[1] ;
  
  assign p[2] = a[2] ^ b[2] ;
  assign g[2] = a[2] & b[2] ;
  
  assign p[3] = a[3] ^ b[3] ;
  assign g[3] = a[3] & b[3] ;
  
  assign c[1] = g[0] | (p[0] & c[0]) ;
  assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]) ;
  assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]) ;
  assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | ( p[3] & p[2] & p[1] & g[0]) | ( p[3] & p[2] & p[1] & p[0] & c[0]) ;
  
  assign sum[0] = p[0] ^ c[0] ;
  assign sum[1] = p[1] ^ c[1] ;
  assign sum[2] = p[2] ^ c[2] ; 
  assign sum[3] = p[3] ^ c[3] ; 

  assign g_out = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | ( p[3] & p[2] & p[1] & g[0]) ;
  assign p_out = p[0] & p[1] & p[2] & p[3] ;
  
endmodule
