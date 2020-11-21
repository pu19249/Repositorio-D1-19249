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

        always @(posedge clk, posedge reset) begin //si LA y load cambia tambien se ejecuta el always
            if (reset)
                cont = 12'b0; //comienza en cero el contador
            else if (loact)
                cont = load; //si el enable esta desactivado, el load pasa a la salida
            else if (enable && !loact)
                cont = cont + 1; //a lo que tenia la salida se le suma 1
        end
endmodule

module rom_mem(
    input [11:0]address, //direccion
    output [7:0]data
    ); 

    reg[7:0] my_mem [0:4095]; //8 bits de ancho, 4096 depth memory
    
    initial begin
        $readmemh("memory.list", my_mem); //leer el archivo
    end
    assign data = my_mem[address]; //asignar a la salida la direccion
endmodule

module Bufftri(input [3:0]in,
               input en, 
               output [3:0]out);

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

module tabla(input [6:0] address, output [12:0] signals);
    
    reg [12:0] signalsReg;
    
    always @ (address)
        casez(address)
            // any
            7'b????_??0: signalsReg <= 13'b1000_000_001000;
            // JC
            7'b0000_1?1: signalsReg <= 13'b0100_000_001000;
            7'b0000_0?1: signalsReg <= 13'b1000_000_001000;
            // JNC
            7'b0001_1?1: signalsReg <= 13'b1000_000_001000;
            7'b0001_0?1: signalsReg <= 13'b0100_000_001000;
            // CMPI
            7'b0010_??1: signalsReg <= 13'b0001_001_000010;
            // CMPM
            7'b0011_??1: signalsReg <= 13'b1001_001_100000;
            // LIT
            7'b0100_??1: signalsReg <= 13'b0011_010_000010;
            // IN
            7'b0101_??1: signalsReg <= 13'b0011_010_000100;
            // LD
            7'b0110_??1: signalsReg <= 13'b1011_010_100000;
            // ST
            7'b0111_??1: signalsReg <= 13'b1000_000_111000;
            // JZ
            7'b1000_?11: signalsReg <= 13'b0100_000_001000;
            7'b1000_?01: signalsReg <= 13'b1000_000_001000;
            // JNZ
            7'b1001_?11: signalsReg <= 13'b1000_000_001000;
            7'b1001_?01: signalsReg <= 13'b0100_000_001000;
            // ADDI
            7'b1010_??1: signalsReg <= 13'b0011_011_000010;
            // ADDM
            7'b1011_??1: signalsReg <= 13'b1011_011_100000;
            // JMP
            7'b1100_??1: signalsReg <= 13'b0100_000_001000;
            // OUT
            7'b1101_??1: signalsReg <= 13'b0000_000_001001;
            // NANDI
            7'b1110_??1: signalsReg <= 13'b0011_100_000010;
            // NANDM
            7'b1111_??1: signalsReg <= 13'b1011_100_100000;
            default: signalsReg <= 13'b1111111111111;
        endcase
        
    assign signals = signalsReg;
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

//accu
module FFaccu(input clk, reset, en,
              input [3:0]D,
              output reg [3:0]sal_alu);

        always@(posedge clk or reset)begin
            if (reset)
                sal_alu <= 4'b0;
            else if (en)
                sal_alu <= D;
        end
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

//NUEVO MODULO PARA EL FETCH
module fetch(input clk, reset, en, input wire [7:0]program_byte,
             output  reg [3:0]instr,
             output  reg [3:0]oprnd);
    //reg [3:0]instr;
    //reg [3:0]oprnd;
    always@(posedge clk or posedge reset) begin
        if (reset) begin
            instr <= 4'b0;
            oprnd <= 4'b0;
        end
        else begin
            instr <= program_byte[7:4];
            oprnd <= program_byte[3:0];
        end
    end
endmodule

module ALU(input [3:0] A, B,
           input [2:0] F,
           output Carry, Zero,
           output [3:0] S);
    
    reg [4:0] regS;
    
    always @ (A, B, F)
        case (F)
            3'b000: regS = A;
            3'b001: regS = A - B;
            3'b010: regS = B;
            3'b011: regS = A + B;
            3'b100: regS = {1'b0, ~(A & B)};
            default: regS = 5'b10101;
        endcase
    
    assign S = regS[3:0];
    assign Carry = regS[4];
    assign Zero = ~(regS[3] | regS[2] | regS[1] | regS[0]);
    
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


//ensamble de todos los modulos uP
module uP(input clock, reset,
          input [3:0]pushbuttons,
          output phase, c_flag, z_flag,
          output [3:0]instr,
          output [3:0]oprnd,
          output [3:0]data_bus,
          output [3:0]FF_out,
          output [3:0]accu, 
          output [7:0]program_byte,
          output [11:0]PC,
          output [11:0]address_RAM);
        
          //declaracion de cables para interconexiones
          wire clock, reset;
          wire [3:0]pushbuttons;
          wire phase, c_flag, z_flag;
          wire [3:0]instr;
          wire [3:0]oprnd;
          wire [3:0]data_bus;
          wire [3:0]FF_out;
          wire [3:0]accu;
          wire [7:0]program_byte;
          wire [11:0]PC;
          wire [11:0]address_RAM;

          assign address_RAM = {oprnd, program_byte};

          wire Carry, Zero;
          wire [3:0]sal_alu;
          wire [12:0]control_signals;
          wire [6:0]indecode;
          assign indecode = {instr, c_flag, z_flag, phase};

          //instanciacion de modulos
          cont12 progra_counter(clock, reset, control_signals[12], control_signals[11], address_RAM, PC); //PC
          rom_mem rom(PC, program_byte); //ROM
          FFD8 fetch(clock, reset, ~phase, program_byte, instr, oprnd); //FETCH
          FFT phasemodule(clock, reset, phase); //PHASE
          FFD2 flags(clock, reset, control_signals[9], {Zero, Carry}, {z_flag, c_flag}); //FLAGS
          tabla decode(indecode, control_signals); //DECODE
          Bufftri bufffetch(oprnd, control_signals[1], data_bus); //BUFFER FETCH
          ALU alu(accu, data_bus, control_signals[8:6], Carry, Zero, sal_alu); //ALU
          FFaccu accumulador(clock, reset, control_signals[10], sal_alu, accu); //ACCUMULATOR
          Bufftri buffalu(sal_alu, control_signals[3], data_bus); //BUFFER ALU
          FFD4 outputs(clock, reset, control_signals[0], data_bus, FF_out); //FF OUTPUTS
          Bufftri buffinputs(pushbuttons, control_signals[2], data_bus); //BUFFER INPUTS
          RAM ram(address_RAM, control_signals[5], control_signals[4], data_bus); //RAM

endmodule

