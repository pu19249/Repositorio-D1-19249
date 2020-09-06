//Jonathan Pu c.19249

module testbench();
    reg clk, D, set, reset;
    wire Q;

FF_D F1(clk, set, reset, D, Q);

always
    #2 clk = ~clk;

initial begin
    $display("clk set reset D | Q");
    $display("-------------------");
    $monitor("%b %b %b %b | %b", clk, set, reset, D, Q);
    clk = 0; set = 0; reset = 0;

end
endmodule