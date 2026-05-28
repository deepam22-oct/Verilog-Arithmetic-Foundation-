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


// ---------------- 8 - BIT CLA USING 2 4 BIT CLA -------------------

module cla_8bit_block (
    input  [7:0] a,
    input  [7:0] b,
    input  cin,

    output [7:0] sum,
    output cout,
    output g_out,
    output p_out
);

    wire c4;
    wire g0, p0;
    wire g1, p1;

    cla_4bit cla1 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(c4),
        .g_out(g0),
        .p_out(p0)
    );

    // Upper 4-bit CLA
    cla_4bit cla2 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c4),
        .sum(sum[7:4]),
        .cout(),
        .g_out(g1),
        .p_out(p1)
    );

    
    assign cout  = g1 | (p1 & g0) | (p1 & p0 & cin);
    assign g_out = g1 | (p1 & g0);
    assign p_out = p1 & p0;

endmodule

// ------------ 16-BIT CLA USING 2 8-BIT CLA -----------------------

module cla_16bit_block (
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout,
    output g_out,
    output p_out
);
 
    wire c8;
    wire g0, p0;
    wire g1, p1;
    
    cla_8bit_block cla0 (
        .a(a[7:0]),
        .b(b[7:0]),
        .cin(cin),
        .sum(sum[7:0]),
        .cout(c8),
        .g_out(g0),
        .p_out(p0)
    );
    
    cla_8bit_block cla1 (
        .a(a[15:8]),
        .b(b[15:8]),
        .cin(c8),
        .sum(sum[15:8]),
        .cout(),
        .g_out(g1),
        .p_out(p1)
    );
    
    assign cout = g1 | (p1 & g0) | (p1 & p0 & cin);
    assign g_out = g1 | (p1 & g0);
    assign p_out = p1 & p0;
 
endmodule
 
