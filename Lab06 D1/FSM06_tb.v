//Jonathan Pu c. 19249

module testbench();
    //Para la primera FSM
    reg clk, reset, A, B;
    wire Y;

    always
        #5 clk = ~clk;
    FSM1 E01(clk, A, B, reset, Y);

    initial begin
        $display("\n");
        $display("clk reset A B | Y");
        $display("----------------------");
        $monitor("%b %b %b %b | %b", clk, reset, A, B, Y);
            //entradas comienzan en 0
            clk = 0; reset = 0; A = 0; B = 0;
        #1 reset = 1;
        #1 reset = 0;
        #10 A = 1; B = 0;
        #10 A = 0; B = 1;
        #10 A = 1; B = 1;
    end

    reg P;
    wire Y0, Y1, Y2;

    FSM2 E03(clk, P, reset, Y0, Y1, Y2);

    initial begin
        $display("\n");
        $display("clk reset P | Y0 Y1 Y2");
        $display("----------------------");
        $monitor("%b %b %b | %b %b %b", clk, reset, P, Y0, Y1, Y2);
            //entradas comienzan en 0
            clk = 0; reset = 0; P = 0; 
        #1 reset = 1;
        #1 reset = 0;
        #10 P = 1;
        #10 P = 0;
    end

    initial
        #48 $finish;

    //GTK Wave
    initial begin
        $dumpfile("FSM06_tb.vcd"); //nombre del archivo
        $dumpvars(0, testbench); //nombre del modulo
    end 

endmodule
