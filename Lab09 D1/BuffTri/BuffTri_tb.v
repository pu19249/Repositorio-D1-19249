//tb para buffer triestado

module testbench();
    reg [3:0]in;
    reg en;
    wire [3:0]out;

    Bufftri a(in, en, out);

    initial begin
        $display("\n");
        $display("Tb buffer triestado");
        $display("----------");
        $display("in en | out");
        $monitor("%b %b | %b", in, en, out);
        #1 in = 4'b0001; en = 1;
        #1 in = 4'b0010; en = 0;
        #1 in = 4'b0101; en = 1;
        #1 in = 4'b1111; en = 1;
        #1 in = 4'b1111; en = 0;
    end

    initial
        #8 $finish;

//GTKWAVE
    initial begin
        $dumpfile("BuffTri_tb.vcd"); //nombre del documento
        $dumpvars(0, testbench); //nombre del modulo
    end

endmodule