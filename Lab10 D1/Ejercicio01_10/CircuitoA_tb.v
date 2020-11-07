//tb circuito A

module tb();

    reg clk;
    reg reset;
    reg en_PC;
    reg en_Fetch;
    reg loact;
    reg [11:0]load;
    wire [3:0]instr;
    wire [3:0]oprnd;
    wire [7:0]program_byte;

    always
    #1 clk = ~clk;

    CircuitoA a(clk, reset, en_PC, en_Fetch, loact, load, instr, oprnd, program_byte);

    initial begin
        #1
        $display("\n");
        $display("-------------------------Testbench Circuito A--------------------------------------------");
        $display(" clk | rst | en_PC | en_Fetch | loact |    load        ||  instr | oprnd  |  program_byte ");
        $display("-----------------------------------------------------------------------------------------");
        $monitor(" %b   | %b   |   %b   |    %b     |  %b    | %b   || %b   | %b   |  %b ", clk, reset, en_PC, en_Fetch, loact, load, instr, oprnd, program_byte);
        clk = 0; reset = 1; en_PC = 0; en_Fetch = 0; loact = 0; load = 12'b000000000000;
        #2 reset = 0; en_PC = 1; en_Fetch = 1; loact = 0; //deberia desplegar el valor que hay en address 1
        #2 reset = 0; en_PC = 1; en_Fetch = 1; loact = 0; //no hay nada en esa localidad
        #2 reset = 0; en_PC = 1; en_Fetch = 1; loact = 1; load = 12'b000000010000; //deberia desplegar la pos. 12
        #2 reset = 0; en_PC = 1; en_Fetch = 1; loact = 0;
        #2 reset = 0; en_PC = 1; en_Fetch = 1; loact = 1; load = 12'b000100000000;
    end

    initial 
    #15 $finish;

    //GTK WAVE
    initial begin
        $dumpfile("CircuitoA_tb.vcd");
        $dumpvars(0, tb);
    end

endmodule