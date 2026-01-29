// 4-bit ripple carry adder 

module full_adder (
    input  a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


module ripple_carry (
   input [3:0] a , b ,
   input cin ,
   output [3:0]sum ,
   output carry );

wire[2:0]c ;
full_adder fa1(a[0],b[0],cin,sum[0],c[0]);
full_adder fa2(a[1],b[1],c[0],sum[1],c[1]);
full_adder fa3(a[2],b[2],c[1],sum[2],c[2]);
full_adder fa4(a[3],b[3],c[2],sum[3],carry);

endmodule 


// N-bit ripple carry adder using for loop 

module ripple_carry_adder #(
    parameter N = 4
)(
    input  [N-1:0] a, b,
    input          cin,
    output [N-1:0] sum,
    output         cout
);
    wire [N:0] c;
    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : RCA
            full_adder fa (
                .a   (a[i]),
                .b   (b[i]),
                .cin (c[i]),
                .sum (sum[i]),
                .cout(c[i+1])
            );
        end
    endgenerate

    assign cout = c[N];
endmodule
