//testbench ROM

module testbench();
    reg [11:0]address;
    wire [7:0]data;

    rom_mem memtb(address, data);
        
        initial begin
        $display("\n");
        $display("Testbench memory rom");
        $display("--------------------");
        $display("    Address         |      Data    ");
        $monitor("    %b    |    %b    ", address, data); //leer los datos del archivo
        address = 12'b000000000000; //0
        #1 address = 12'b000000000001; //1
        #1 address = 12'b000000010000; //10
        #1 address = 12'b000000010001; //11
        #1 address = 12'b000000010010; //12
        #1 address = 12'b000000010011; //13
        #1 address = 12'b000000010100; //14
        #1 address = 12'b000100000000; //100
        #1 address = 12'b000100000001; //101
        #1 address = 12'b000100000010; //102
        #1 address = 12'b000100000011; //103
        #1 address = 12'b000100000100; //104
    
        end

        initial
        #25 $finish;

        //GTK wave
        initial begin
            $dumpfile("ROM4kx8_tb.vcd"); //nombre del documento
            $dumpvars(0, testbench); //modulo de testbench
        end

endmodule