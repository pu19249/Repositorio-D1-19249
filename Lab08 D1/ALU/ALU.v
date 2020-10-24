//Jonathan Pu c.19249
//implementacion de ALU

module ALU(
    input wire [3:0]A, //entrada A
    input wire [3:0]B, //entrada b
    input wire [2:0]S, //selector
    output reg [3:0]Y //salida de ALU
                    );

    always@(A, B, S) //verificar cambios en A, B o S
        begin
            case(S)
                3'b000: Y = A & B; //A AND B
                3'b001: Y = A | B; //A OR B
                3'b010: Y = A + B; //A + B
                3'b011: Y = 4'b0000; //not used
                3'b100: Y = A & ~B;//A AND B'
                3'b101: Y = A | ~B;//A OR B'
                3'b110: Y = A - B;//A - B
                3'b111: Y = (A < B) ? 1:0;//SLT
                default: Y = 4'b0000; //todo seteado en 0
            endcase
        end
endmodule
