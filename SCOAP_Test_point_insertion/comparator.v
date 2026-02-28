module comparator(
    input [3:0] A, B, C, D,
    output Y);

wire match1, match2;


assign match1 = (A == B);
assign match2 = (C == D);

assign Y = match1 & match2;

endmodule


