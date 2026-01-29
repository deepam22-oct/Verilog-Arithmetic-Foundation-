// Full adder usign data flow modeling 

module full_adder_df (
    input  a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

// Full adder usign data Behavioral modeling

module full_adder_beh (
    input  a, b, cin,
    output reg sum, cout
);
    always @(*) begin
        sum  = a ^ b ^ cin;
        cout = (a & b) | (b & cin) | (a & cin);
    end
endmodule


// Full adder using  aritmatic operator 

module full_adder_arith (
    input  a, b, cin,
    output sum, cout
);
    assign {cout, sum} = a + b + cin;
endmodule

