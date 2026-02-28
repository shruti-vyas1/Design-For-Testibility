module dft_TB();

    reg  [15:0] in;
    reg  test_mode;
    reg  cp_force_1;
    reg  fault_enable;

    wire out_base;
    wire out_tpi;
    wire obs;

    // Baseline Circuit
    dft k1(in, out_base);

    // Fault + TPI Circuit
    dft_fault k2(in, test_mode, cp_force_1, fault_enable, out_tpi, obs);

    integer i;
    integer base_hits = 0;
    integer tpi_hits  = 0;

    initial begin

        // Phase 1: Baseline Random Testability

        test_mode = 0;
        cp_force_1 = 0;
        fault_enable = 0;

        for (i = 0; i < 10000; i = i + 1) begin
            in = $random;
            #1;
            if (out_base)
                base_hits = base_hits + 1;
        end

        $display("Baseline Output Hits (out=1): %0d", base_hits);


        // Phase 2: Fault Injection (No CP)

        fault_enable = 1;
        tpi_hits = 0;

        for (i = 0; i < 10000; i = i + 1) begin
            in = $random;
            #1;
            if (out_tpi)
                tpi_hits = tpi_hits + 1;
        end

        $display("Fault Enabled Output Hits (No CP): %0d", tpi_hits);


        // Phase 3: With Control Point Enabled

        test_mode = 1;
        cp_force_1 = 1;
        tpi_hits = 0;

        for (i = 0; i < 10000; i = i + 1) begin
            in = $random;
            #1;
            if (out_tpi)
                tpi_hits = tpi_hits + 1;
        end

        $display("Fault Enabled Output Hits (With CP): %0d", tpi_hits);

        $finish;

    end

endmodule
