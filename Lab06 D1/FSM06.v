//Jonathan Pu c. 19249

//Primero se modula el ff_D con asynchronus reset
module ff_D1(input wire D, clk, reset, output reg Q);
    always @ (posedge clk or posedge reset)
    begin
        if (reset == 1'b1) begin;
            Q <= 1'b1;
        end
        else begin
            Q <= D;
        end
    end
endmodule

// Ejercicio01 
module FSM1(
    input wire clk, inA, inB, reset, output wire out1);
  
    wire D0, D1; //son los cables que van a entrar como D a mis ff_D
    wire Q0, Q1; //son los que salen de mis ff_D

    assign D0 = (D1 & inB) | (D0 & inB);
    assign D1 = (~D0 & ~D1 & inA);

    //llamo los dos ff_D que necesito
    ff_D1 a1(D0, clk, reset, Q0);
    ff_D1 a2(D1, clk, reset, Q1);

    //ahora ya utilizo estos nuevos cables
    assign Y = Q0 & inB;

endmodule

//Ejercicio03
module FSM2 (
    input wire clk, P, reset, output Y0, Y1, Y2);

    //declaro los cables que van a salir de mis ff_D
    wire Q0, Q1, Q2;
    //los cables que entran a mis ff_D
    wire D0, D1, D2;

    //ecuaciones de los estados futuros
    assign D0 = (~D0 & D1 & D2 & P) | (~D0 & ~D1 & ~D2 & ~P) 
    | (D0 & D2 & ~P) | (D0 & ~D1 & P) | (D0 & D1 & ~D2);

    assign D1 = (D1 & D2 & ~P) | (~D1 & D2 & P) | (~D1 & ~D2 & ~P) | (D1 & ~D2 & P);

    assign D2 = ~D2;

    //tres ff_D
    ff_D1 b1(D2, clk, reset, Q2);
    ff_D1 b2(D1, clk, reset, Q1);
    ff_D1 b3(D0, clk, reset, Q0);

    //ecuacion de las salidas
    assign Y0 = Q0;
    assign Y1 = (~Q0 & Q1) | (Q0 & ~Q1);
    assign Y2 = (Q1 & ~Q2) | (~Q1 & Q2);

endmodule


