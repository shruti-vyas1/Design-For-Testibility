module comparator_tpi(
    input [3:0] A, B, C, D,
    input test_mode,
    output Y,
    output obs_point
);

wire match1, match2;

wire match1_ctrl;

assign match1 = (A == B);
assign match2 = (C == D);

assign match1_ctrl = test_mode ? 1'b1 : match1;

assign obs_point = match1;

assign Y = match1_ctrl & match2;

endmodule
