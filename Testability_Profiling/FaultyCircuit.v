module dft_fault(
    input  [15:0] in,
    input  test_mode,
    input  cp_force_1,
    input  fault_enable,     
    output out,
    output obs_point
);

    wire [7:0] layer1;
    wire [3:0] layer2;
    wire [1:0] layer3;

    assign layer1 = {
        in[15]&in[14], in[13]&in[12], in[11]&in[10], in[9]&in[8],
        in[7]&in[6],   in[5]&in[4],   in[3]&in[2],   in[1]&in[0]
    };

    assign obs_point = layer1[7];

    assign layer2 = {
        layer1[7]&layer1[6],
        layer1[5]&layer1[4],
        layer1[3]&layer1[2],
        layer1[1]&layer1[0]
    };

    wire layer2_3_controlled;
    assign layer2_3_controlled =
        (test_mode && cp_force_1) ? 1'b1 : layer2[3];

    assign layer3[1] = layer2_3_controlled & layer2[2];
    assign layer3[0] = layer2[1] & layer2[0];

    wire layer3_0_faulty;
    assign layer3_0_faulty =
        (fault_enable) ? 1'b0 : layer3[0];

    assign out = layer3[1] & layer3_0_faulty;

endmodule
