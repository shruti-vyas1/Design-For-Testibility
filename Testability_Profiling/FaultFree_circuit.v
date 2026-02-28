module dft(
    input  [15:0] in,
    output out
);

    wire [7:0] layer1;
    wire [3:0] layer2;
    wire [1:0] layer3;

    assign layer1 = {
        in[15]&in[14], in[13]&in[12], in[11]&in[10], in[9]&in[8],
        in[7]&in[6],   in[5]&in[4],   in[3]&in[2],   in[1]&in[0]
    };

    assign layer2 = {
        layer1[7]&layer1[6],
        layer1[5]&layer1[4],
        layer1[3]&layer1[2],
        layer1[1]&layer1[0]
    };

    assign layer3 = {
        layer2[3]&layer2[2],
        layer2[1]&layer2[0]
    };

    assign out = layer3[1] & layer3[0];

endmodule
