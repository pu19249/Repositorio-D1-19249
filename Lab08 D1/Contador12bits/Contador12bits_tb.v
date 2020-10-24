//Testbench para contador de 12 bits

module testbench();
    reg clk;
    reg reset;
    reg enable;
    reg loact;
    reg [11:0]load;
    wire [11:0]cont;

    always
        #1 clk = ~clk;
  
    cont12 contador1(clk, reset, enable, loact, load, cont);
    
        initial begin
        //llamar el modulo cont12
       
        $display("\n");
        $display("Testbench contador 12 bits");
        $display("--------------------------");
        $display(" clk  reset  enable  loact    load      |   count ");
        $monitor(" %b     %b      %b      %b     %b |   %b ", clk, reset, enable, loact, load, cont);
        clk = 0; reset = 1; enable = 0; loact = 0; load = 0; //se resetea el contador
        #1 reset = 0; enable = 1;
        #1 reset = 0; enable = 1; //varios tiempos para verificar que cuente varios bits
        #10 enable = 0; loact = 1; load = 12'b000111000111; //prueba del load
        #1 reset = 0; load = 12'b000111000111;
        #5 reset = 0; enable = 1; loact = 0; //prueba de seguir contando
        #5 reset = 0; enable = 1;
        #1 reset = 1; //volver a resetear la salida

    end

    initial
        #50 $finish;

    //GTK WAVE
    initial begin
        $dumpfile("Contador12bits_tb.vcd"); //nombre del documento
        $dumpvars(0, testbench); //modulo de testbench
    end

endmodule