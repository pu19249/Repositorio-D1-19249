//Jonathan Pu c. 19249
//Memoria ROM 4kx8
module rom_mem(
    input wire [11:0]address, //direccion
    output wire [7:0]data
    ); 

    reg[7:0] my_mem [0:4095]; //8 bits de ancho, 4096 depth memory
    
    initial begin
        $readmemh("memory.list.txt", my_mem); //leer el archivo
    end
    assign data = my_mem[address]; //asignar a la salida la direccion
endmodule