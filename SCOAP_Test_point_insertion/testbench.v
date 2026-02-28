module comparator_tb( );

reg [3:0] A, B, C, D;
reg test_mode;

wire Y_base;
wire Y_tpi;
wire obs;

integer i;

comparator k1(A, B, C, D, Y_base);

comparator_tpi k2(
    A, B, C, D, test_mode, Y_tpi, obs
);

initial
begin

    $dumpfile("comparator_tb.vcd");
    $dumpvars(0, comparator_tb);

    test_mode = 0;

    for(i=0;i<100;i=i+1)
    begin
        A = $random;
        B = $random;
        C = $random;
        D = $random;

        #5;
    end

    test_mode = 1;

    for(i=0;i<100;i=i+1)
    begin
        A = $random;
        B = $random;
        C = $random;
        D = $random;

        #5;
    end

    $finish;
end

endmodule
