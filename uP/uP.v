/*Jonathan Emanuel Pu Aguilera
  Electronica Digital I
  Catedratico: Kurt Kellner
  Seccion 10
  uP nibbler 4*/

//Modulos del procesador
module RAM(input wire [11:0]address_ram,
           input wire cs,//chip select
           input wire we, //write enable
           output wire [3:0]data);

           /*Variables internas de la RAM*/
           reg [3:0]data_out;
           reg [3:0] mem[0:4095]; //RAM de 4kx4
           /*Control de buffer triestado
           output : cuando we = 0, oe = 1, cs = 1*/
           assign data = (cs && !we) ? data_out : 4'bzzzz;
            /*Escritura de memoria cuando we = 1 y cs = 1*/
           always @(address_ram or data or cs or we)
           begin: MEM_WRITE
                if (cs && we)
                    mem[address_ram] = data;
           end
           
        
            /*lectura de memoria cuando we = 0, cs = 1*/
           always @(address_ram or cs or we)
           begin: MEM_READ
                if (cs && !we)
                    data_out = mem[address_ram];
           end
           
endmodule

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

module rom_mem(
    input wire [11:0]address, //direccion
    output wire [7:0]data
    ); 

    reg[7:0] my_mem [0:4095]; //8 bits de ancho, 4096 depth memory
    
    initial begin
        $readmemh("memory.list", my_mem); //leer el archivo
    end
    assign data = my_mem[address]; //asignar a la salida la direccion
endmodule

module Bufftri(input wire [3:0]in,
               input wire en, 
               output wire [3:0]out);

    assign out = en ? in : 4'bz;
endmodule

//PHASE

module FFDSE(input wire clk, reset, D, output reg Q);
    always@(posedge clk or posedge reset) begin
        if(reset)
            Q <= 1'b0;
        else
            Q <= D; 
    end
endmodule

module FFT(input wire clk, reset, output wire Q);

    FFDSE a(clk, reset, ~Q, Q);
endmodule

module opcode(input wire [6:0]address1, 
              output reg [12:0]signals);
  
    always @(address1)
            casex(address1)
                7'bxxxxxx0: signals <= 13'b1000000001000;
                7'b00001x1: signals <= 13'b0100000001000;
                7'b00000x1: signals <= 13'b1000000001000;
                7'b00011x1: signals <= 13'b1000000001000;
                7'b00010x1: signals <= 13'b0100000001000;
                7'b0010xx1: signals <= 13'b0001001000010;
                7'b0011xx1: signals <= 13'b1001001100000;
                7'b0100xx1: signals <= 13'b0011010000010;
                7'b0101xx1: signals <= 13'b0011010000100;
                7'b0110xx1: signals <= 13'b1011010100000;
                7'b0111xx1: signals <= 13'b1000000111000;
                7'b1000x11: signals <= 13'b0100000001000;
                7'b1000x01: signals <= 13'b1000000001000;
                7'b1001x11: signals <= 13'b1000000001000;
                7'b1001x01: signals <= 13'b0100000001000;
                7'b1010xx1: signals <= 13'b0011011000010;
                7'b1011xx1: signals <= 13'b1011011100000;
                7'b1100xx1: signals <= 13'b0100000001000;
                7'b1101xx1: signals <= 13'b0000000001001;
                7'b1110xx1: signals <= 13'b0011100000010;
                7'b1111xx1: signals <= 13'b1011100100000;
                default:    signals <= 13'b1111111111111;
            endcase
                 
endmodule

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

//dos bits con salidas separadas para flags
module Flags(input wire clk, reset, En, D1, D0, output wire Q1, Q0);
    FFD a(clk, reset, En, D1, Q1);
    FFD b(clk, reset, En, D0, Q0);
endmodule

//cuatro bits
module FFD4(input wire clk, reset, En,
            input wire [3:0]D4,
            output wire [3:0]Q4);
    
    FFD2 a(clk, reset, En, D4[3:2], Q4[3:2]);
    FFD2 b(clk, reset, En, D4[1:0], Q4[1:0]);
endmodule

//8 bits con entrada de 8 y dos salidas de 4 FETCH
module FFD8(input wire clk, reset, En,
            input wire [7:0]D8,
            output wire [3:0]Q8a,
            output wire [3:0]Q8b);
    FFD4 a(clk, reset, En, D8[7:4], Q8a);
    FFD4 b(clk, reset, En, D8[3:0], Q8b);
endmodule

module ALU(
    input wire [3:0]A, //entrada A
    input wire [3:0]B, //entrada b
    input wire [2:0]S, //selector
    output reg [3:0]Y,
    output reg Carry,
    output reg Zero //salida de ALU
                    );

    reg [4:0]Q; //registro interno de 5 bits para verificar el carry
    always@(A, B, S) //verificar cambios en A, B o S
        begin
            case(S)
                3'b000: begin
                            Q = 5'b00000; //resetear el valor del registro
                            Q = A; //bits de A pasan a Q
                            Carry = 1'b0; //no va a haber carry
                            Zero = (Q == 5'b00000) ?1 :0; //no hay operaciones
                            Y = Q[3:0]; //solo quiero cuatro bits en la sal. Alu
                        end    //deja pasar A
                3'b010: begin
                            Q = 5'b00000; //resetear el valor del registro
                            Q = B;
                            Carry = 1'b0;
                            Zero = (Q == 5'b00000) ? 1:0;
                            Y = Q[3:0];
                        end //deja pasar B
                3'b100: begin
                            Q = 5'b00000;
                            Q = ~(A & B);
                            Carry = 1'b0;
                            Zero = (Q == 5'b00000) ? 1:0;
                            Y = Q[3:0];
                        end //nand
                3'b001: begin //compare
                            Q = 5'b00000;
                            Q = A - B;
                            Y = Q[3:0];
                            Carry = Q[4]; //el bit mas sig. se asigna al reg del carry
                            Zero = (Q == 5'b00000) ? 1:0; //si el reg Q es 0, flag zero = 1
                        end
                3'b011: begin
                        Q = 5'b00000;
                        Q = A + B; //add
                        Y = Q[3:0];
                        Carry = Q[4];
                        Zero = (Q == 5'b00000) ? 1:0;
                        end
            endcase
        end
endmodule

//ensamble de todos los modulos
module uP(input wire clock, reset,
          input wire [3:0]pushbuttons,
          output wire phase, c_flag, z_flag,
          output wire [3:0]instr,
          output wire [3:0]oprnd,
          output wire [3:0]data_bus,
          output wire [3:0]FF_out,
          output wire [3:0]accu, 
          output wire [7:0]program_byte,
          output wire [11:0]PC,
          output wire [11:0]address_RAM);

          //control signals
          wire [12:0]control_signals; //salida del decode
          
          wire incPC, loadPC, loadA, loadFlags, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut;
          wire [2:0]S;

          assign incPC = control_signals[12]; 
          assign loadPC = control_signals[11];
          assign loadA = control_signals[10];
          assign loadFlags = control_signals[9];
          assign S = control_signals[8:6];
          assign csRAM = control_signals[5];
          assign weRAM = control_signals[4];
          assign oeALU = control_signals[3];
          assign oeIN = control_signals[2]; 
          assign oeOprnd = control_signals[1]; 
          assign loadOut = control_signals[0];
          
          //otros cables 
          wire Carry, Zero;
          wire [6:0]indecode;
          wire [3:0]sal_alu;
          assign address_RAM = {oprnd, program_byte}; //concatenacion de cables para la ram
          assign indecode = {phase, c_flag, z_flag, instr}; //concatenacion de entradas del decode

          //instanciacion de modulos
          cont12 A(.clk(clock), .reset(reset), .enable(incPC), .loact(loadPC), .load(address_RAM), .cont(PC)); //PC
          rom_mem B(.address(PC), .data(program_byte)); //ROM
          FFD8 C(.clk(clock), .reset(reset), .En(~phase), .D8(program_byte), .Q8a(instr), .Q8b(oprnd)); //FETCH
          Flags D(.clk(clock), .reset(reset), .En(loadFlags), .D1(Carry), .D0(Zero), .Q1(c_flag), .Q0(z_flag));//FLAGS
          FFT E(.clk(clock), .reset(reset), .Q(phase)); //PHASE
          Bufftri F(.in(oprnd), .en(oeOprnd), .out(data_bus)); //Buff de data bus
          Bufftri G(.in(sal_alu), .en(oeALU), .out(data_bus)); //Buff de alu
          Bufftri H(.in(pushbuttons), .en(oeIN), .out(data_bus)); //Buffer inputs
          FFD4 I(.clk(clock), .reset(reset), .En(loadOut), .D4(data_bus), .Q4(FF_out)); //OUTPUTS
          RAM J(.address_ram(address_RAM), .cs(csRAM), .we(weRAM), .data(data_bus)); //RAM
          opcode K(.address1(indecode), .signals(control_signals)); //DECODE
          ALU L(.A(data_bus), .B(accu), .S(S), .Y(sal_alu), .Carry(Carry), .Zero(Zero));//ALU
          FFD4 M(.clk(clock), .reset(reset), .En(loadA), .D4(sal_alu), .Q4(accu)); //ACCUMULATOR

endmodule