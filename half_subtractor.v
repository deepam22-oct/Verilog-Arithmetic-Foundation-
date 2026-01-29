// Half subtractor using data flow modeling 
module half_subtractor_df (
    input  a, b,
    output diff, borrow
);
    assign diff   = a ^ b;
    assign borrow = (~a) & b;
endmodule

// half adder using behavioral modelign 
module half_subtractor_beh (
    input  a, b,
    output reg diff, borrow
);
    always @(*) begin
        diff   = a ^ b;
        borrow = (~a) & b;
    end
endmodule
