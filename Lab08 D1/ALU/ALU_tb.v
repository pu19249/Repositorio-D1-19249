//testbench ALU

module testbench();
    reg [3:0]A;
    reg [3:0]B;
    reg [2:0]S;
    wire [3:0]Y;

    ALU tb(A, B, S, Y);

        initial begin
        #1
        $display("\n");
        $display("Testbench ALU");
        $display("--------------------");
        $display("|  A |   B  |  S  || Y");
        $monitor(" %b | %b | %b || %b", A, B, S, Y);
        A = 4'b0010; B = 4'b0011; S = 3'b000;
        #1 A = 4'b1100; B = 4'b1011; S = 3'b001;
        #1 A = 4'b1010; B = 4'b0101; S = 3'b010;
        #1 A = 4'b1111; B = 4'b1111; S = 3'b011;
        #1 A = 4'b0001; B = 4'b0000; S = 3'b100;
        #1 A = 4'b0110; B = 4'b1001; S = 3'b101;
        #1 A = 4'b1110; B = 4'b0001; S = 3'b110;
        #1 A = 4'b1101; B = 4'b1011; S = 3'b111;
        end

    initial
    #15 $finish;

    //GTK wave
    initial begin
        $dumpfile("ALU_tb.vcd"); //nombre del documento
        $dumpvars(0, testbench); //modulo de testbench
    end

endmodule