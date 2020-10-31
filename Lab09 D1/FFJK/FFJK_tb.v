//tb para FF JK

module testbench();
    reg clk;
    reg reset;
    reg En;
    reg J;
    reg K;
    wire Q;

    always
        #1 clk = ~clk;

    FFJK tb(clk, reset, En, J, K, Q);

    initial begin
        $display("\n");
        $display("FF tipo JK");
        $display("----------");
        $display("clk reset En J K | Q");
        $monitor("%b %b %b %b %b | %b", clk, reset, En, J, K, Q);
        clk = 0; reset = 1; En = 0; J = 0; K = 0;
        #2 reset = 0; En = 1; J = 0; K = 0;
        #2 J = 0; K = 0;
        #2 J = 1; K = 0;
        #2 J = 0; K = 1;
        #2 J = 1; K = 1;
        #2 J = 1; K = 1;
    end

    initial
        #14 $finish;

    //GTKWAVE
    initial begin
        $dumpfile("FFJK_tb.vcd"); //nombre del documento
        $dumpvars(0, testbench); //nombre del modulo
    end

endmodule