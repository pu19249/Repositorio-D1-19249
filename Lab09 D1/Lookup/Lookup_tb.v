//tb para lookup table

module testbench();
    reg [6:0]address1;
    
    wire [12:0]data1;

    opcode a(address1, data1);

    initial begin
        $display("\n");
        $display("Testbench instrucciones");
        $display("--------------------");
        $display("    Address1         |      Data1    ");
        $monitor("    %b    |    %b    ",address1, data1);
        address1 = 7'bxxxxxx0;
        #1 address1 = 7'b00001x1;
        #1 address1 = 7'b00000x1;
        #1 address1 = 7'b00011x1;
        #1 address1 = 7'b00010x1;
        #1 address1 = 7'b0010xx1;
        #1 address1 = 7'b0011xx1;
        #1 address1 = 7'b0100xx1;
        #1 address1 = 7'b0101xx1;
        #1 address1 = 7'b0110xx1;
        #1 address1 = 7'b0111xx1;
        #1 address1 = 7'b1000x11;
        #1 address1 = 7'b1000x01;
        #1 address1 = 7'b1001x11;
        #1 address1 = 7'b1001x01;
        #1 address1 = 7'b1010xx1;
        #1 address1 = 7'b1011xx1;
        #1 address1 = 7'b1100xx1;
        #1 address1 = 7'b1101xx1;
        #1 address1 = 7'b1110xx1;
        #1 address1 = 7'b1111xx1;
        //prueba para los dont care
        #1 address1 = 7'b0000000;
        #1 address1 = 7'b0101010;
        #1 address1 = 7'b1111110;
        #1 address1 = 7'b1000000;
        #1 address1 = 7'b0110010;
    end

    initial
        #35 $finish;

    //GTK WAVE
    initial begin
        $dumpfile("Lookup_tb.vcd"); //nombre del documento
        $dumpvars(0, testbench);
    end

endmodule
    