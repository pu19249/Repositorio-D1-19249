//tb para FFT

module testbench();
    reg clk;
    reg reset;
    reg en;
    wire Q;

    always
     #1 clk = ~clk;

    FFT a(clk, reset, en, Q);

    initial begin
        $display("\n");
        $display("Testbench para FF tipo T");
        $display("------------------------");
        $display("clk reset en | Q");
        $display("------------------------");
        $monitor("%b    %b    %b  |    %b", clk, reset, en, Q);
        clk = 0; reset = 1; en = 0;
        #1 reset = 0; en = 1;
        #1 reset = 0; en = 1;
        #1 reset = 0; en = 1;
        #1 reset = 0; en = 1;
    end

initial
    #10 $finish;

//GTK WAVE
initial begin
    $dumpfile("FFT_tb.vcd");
    $dumpvars(0, testbench);
end

endmodule