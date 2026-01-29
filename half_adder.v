// half adder using data flow modeling 

module half_adder_df (
    input  a, b,
    output sum, carry
);
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule


// half adder using behevioral modeling 

module half_adder_behavioral (
    input  a,
    input  b,
    output reg sum,
    output reg carry
);

always @(*) begin
    sum   = a ^ b;
    carry = a & b;
end

endmodule

// half adder using gate level modeling 

module half_adder_structural (
    input  a,
    input  b,
    output sum,
    output carry
);

xor (sum, a, b);
and (carry, a, b);

endmodule


