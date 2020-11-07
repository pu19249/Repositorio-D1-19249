//Jonathan Pu c. 19249
//Buff triestado de 4 bits

module Bufftri(input wire [3:0]in,
               input wire en, 
               output wire [3:0]out);

    assign out = en ? in : 4'bz;
endmodule

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


//Jonathan Pu c.19249
//implementacion de ALU

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


module CircuitoB(input wire [3:0]oprnd,
                 input wire enB1,
                 clk, reset, enB2, en_accu,
                 input wire [2:0]S,
                 output wire Carry,
                 output wire zero, 
                 output wire[3:0]out1);

    wire [3:0]B;
    wire [3:0]salAlu;
    wire [3:0]salAccu;

    Bufftri a(oprnd, enB1, B);
    FFD4 b(clk, reset, en_accu, salAlu, salAccu);
    Bufftri c(salAlu, enB2, out1);
    ALU d(salAccu, B, S, salAlu, Carry, zero);

endmodule