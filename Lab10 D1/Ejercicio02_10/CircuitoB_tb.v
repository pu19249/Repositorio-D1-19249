//tb para circuito B
//prueba de alu nueva

/*module tbalu();
    reg [3:0]A;
    reg [3:0]B;
    reg [2:0]S;
    wire [3:0]Y;
    wire Carry;
    wire Zero;

    ALU a(A, B, S, Y, Carry, Zero);

    initial begin
        #1
        $display("\n");
        $display(" TESTBENCH ALU PROCESADOR");
        $display("-------------------------");
        $display(" A     B     S ||   Y   Carry  Zero");
        $monitor(" %b %b %b || %b    %b    %b", A, B, S, Y, Carry, Zero);
        A = 4'b0000; B = 4'b0000; S = 3'b000;
        #1 A = 4'b1000; B = 4'b1000; S = 3'b011;
        #1 A = 4'b0010; S = 3'b000;
        #1 A = 4'b0011; B = 4'b0011; S = 3'b001; 
        #1 B = 4'b0101; S = 3'b010;
        #1 A = 4'b0011; B = 4'b1101; S = 3'b100;
    end

    initial
    #8 $finish;

    //GTK WAVE
    initial begin
        $dumpfile("CircuitoB_tb.vcd");
        $dumpvars(0, tbalu);
    end

endmodule*/

module tbB();
    reg [3:0]oprnd;
    reg enB1;
    reg clk;
    reg reset;
    reg enB2;
    reg en_accu;
    reg [2:0]S;
    wire Carry;
    wire zero;
    wire [3:0]out1;

    always
        #1 clk = ~clk;

    CircuitoB b(oprnd, enB1, clk, reset, enB2, en_accu, S, Carry, zero, out1);

    initial begin
        #1
        $display("\n");
        $display("Testbench para el codigo del circuito B");
        $display(" clk | reset | enB1   | oprnd | enB2 | en_accu |    S     ||  Carry | zero | out1  ");
        $monitor(" %b   |   %b   |   %b    |   %b  |   %b |   %b    |    %b   || %b      |  %b   |   %b ", clk, reset, enB1, oprnd, enB2, en_accu, S, Carry, zero, out1);
        clk = 0; reset = 1; enB1 = 0; oprnd = 4'b0000; enB2 = 0; en_accu = 0; S = 3'b000;
        #2 reset = 0; enB1 = 1; oprnd = 4'b0011; enB2 = 1; en_accu = 0; S = 3'b010;
        #2 reset = 0; enB1 = 1; oprnd = 4'b0101; enB2 = 1; en_accu = 1; S = 3'b011;
        #2 reset = 0; enB1 = 1; oprnd = 4'b0111; enB2 = 1; en_accu = 0; S = 3'b000;
        #2 reset = 0; enB1 = 1; oprnd = 4'b1111; enB2 = 0; en_accu = 0; S = 3'b011;
    end

    initial
     #12 $finish;

     //GTK WAVE
     initial begin
         $dumpfile("CircuitoB_tb.vcd");
         $dumpvars(0, tbB);
     end

endmodule