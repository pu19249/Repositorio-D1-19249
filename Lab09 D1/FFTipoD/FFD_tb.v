//tb para FFDs
//FFD un bit
module testbencha();

    reg clk;
    reg reset;
    reg en;
    reg D;
    reg [1:0]D2;
    reg [3:0]D4;
    wire Q;
    wire [1:0]Q2;
    wire [3:0]Q4;

    always
        #1 clk = ~clk;
    
    FFD a(clk, reset, en, D, Q);
    FFD2 b(clk, reset, en, D2[1:0], Q2[1:0]);
    FFD4 c(clk, reset, en, D4[3:0], Q4[3:0]);


        initial begin
            $display("\n");
            $display("Testbench FF tipo D");
            $display("-----------------------------");
            $display("clk  reset  en  D  D2[1]  D2[0]  D4[3]  D4[2]  D4[1]  D4[0]|  Q  Q2[1]  Q2[0]  Q4[3]  Q4[2]  Q4[1]  Q4[0]");
            $display("-----------------------------");
            $monitor(" %b  %b  %b  %b  %b  %b  %b  %b  %b  %b  |  %b  %b  %b  %b  %b  %b  %b", clk, reset, en, D, D2[1], D2[0], D4[3], D4[2], D4[1], D4[0], Q, Q2[1], Q2[0], Q4[3], Q4[2], Q4[1], Q4[0]);
            clk = 0; reset = 1; en = 0; D = 0; D2[1] = 0; D2[0] = 0; D4[3] = 0; D4[2] = 0; D4[1] = 0; D4[0] = 0; 
            #1 reset = 1; en = 1; D = 0; D2[1] = 0; D2[0] = 0; D4[3] = 0; D4[2] = 0; D4[1] = 0; D4[0] = 0; 
            #5 reset = 0; en = 1; D = 1; D2[1] = 1; D2[0] = 1; D4[3] = 1; D4[2] = 0; D4[1] = 1; D4[0] = 1; 
            #2 en = 0; D = 0; D2[1] = 0; D2[0] = 1; D4[3] = 0; D4[2] = 0; D4[1] = 1; D4[0] = 1; 
            #5 en = 1; D = 1; D2[1] = 1; D2[0] = 1; D4[3] = 1; D4[2] = 0; D4[1] = 1; D4[0] = 1; 
            #10 reset = 1; 
        end

    initial
        #30 $finish;
    
    //GTK WAVE
    initial begin
        $dumpfile("FFD_tb.vcd"); //nombre del documento
        $dumpvars(0, testbencha); //nombre del modulo
    end
 
endmodule
