//tb para la RAM

module tb();
    reg [11:0]address_ram;
    reg cs;
    reg we;
    reg [3:0]data_going_in;
    wire [3:0]data;

    RAM ram(.address_ram(address_ram), .cs(cs), .we(we), .data(data));

    initial
    #200 $finish;

    assign data = we ? data_going_in : 4'bzzzz;

    initial
        begin
            #1
            $display("address_ram\t\tdata");
            $monitor("%b\t\t%b", address_ram, data);
            cs = 1;
            we = 0;
            $display("Lectura");
            #1 address_ram = 12'b000000000000;
            #1 address_ram = 12'b000000000001;
            #1 address_ram = 12'b000000000010;
            #1 $display("Escritura");
            #1 we = 1; address_ram = 12'b000000000000; data_going_in = 4'b0011;
            #1 address_ram = 12'b000000000001; data_going_in = 4'b1110;
            #1 address_ram = 12'b000000000010; data_going_in = 4'b0101;
            #1 $display("Lectura");
            #1 we = 0; address_ram = 12'b000000000000;
            #1 address_ram = 12'b000000000001;
            #1 address_ram = 12'b000000000010;
        end
endmodule