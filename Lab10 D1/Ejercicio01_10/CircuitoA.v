//Jonathan Pu c. 19249
//FF tipo D
//un bit
module FFD(input wire clk, reset, En, D, output reg Q);

    always@(posedge clk or posedge reset) begin
        if(reset)
            Q <= 1'b0;
        else if (En)
            Q <= D;
    end
endmodule

//dos bits
module FFD2(input wire clk, reset, En,
            input wire [1:0]D2,
            output wire [1:0]Q2);

    FFD a(clk, reset, En, D2[1], Q2[1]);
    FFD b(clk, reset, En, D2[0], Q2[0]);
endmodule

//cuatro bits
module FFD4(input wire clk, reset, En,
            input wire [3:0]D4,
            output wire [3:0]Q4);
    
    FFD2 a(clk, reset, En, D4[3:2], Q4[3:2]);
    FFD2 b(clk, reset, En, D4[1:0], Q4[1:0]);
endmodule

//8 bits con entrada de 8 y dos salidas de 4
module FFD8(input wire clk, reset, En,
            input wire [7:0]D8,
            output wire [3:0]Q8a,
            output wire [3:0]Q8b);
    FFD4 a(clk, reset, En, D8[7:4], Q8a);
    FFD4 b(clk, reset, En, D8[3:0], Q8b);
endmodule

//Jonathan Pu c. 19249
//Contador de 12 bits con enable y load

module cont12(
    input wire clk,
    input wire reset,
    input wire enable,
    input wire loact, //bit que activa la carga
    input wire [11:0]load, //carga de 12bits
    output reg [11:0]cont //salida de 12bits
    );

        always @(posedge clk or posedge reset or loact or load) begin //si LA y load cambia tambien se ejecuta el always
            if (reset)
                cont <= 12'b000000000000; //comienza en cero el contador
            else if (loact)
                cont <= load; //si el enable esta desactivado, el load pasa a la salida
            else if (enable)
                cont <= cont + 1; //a lo que tenia la salida se le suma 1
        end

endmodule

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

module CircuitoA(input wire clk,
                reset,
                en_PC,
                en_Fetch,
                loact,
                input wire [11:0]load,
                output wire [3:0]instr,
                output wire [3:0]oprnd,
                output wire [7:0]program_byte /*sale de program ROM
                                              y entra a Fetch*/);
                                                      
    wire [11:0]cont;

cont12 a(clk, reset, en_PC, loact, load, cont);
rom_mem b(cont, program_byte);
FFD8 c(clk, reset, en_Fetch, program_byte, instr, oprnd);

endmodule