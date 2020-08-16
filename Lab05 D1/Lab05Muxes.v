//Jonathan Pu c. 19249

//Modulo mux 2:1
module Mux_2x1(output wire Y, input wire D0, D1, S);
    
    assign Y = S ? D1 : D0; //Si S es 0, D0 se cumple, si S es falso D1 se cumple
endmodule

//Modulo mux 4:1
module Mux_4x1(output wire Y2, input wire D0, D1, D2, D3, S0, S1);
    //declarar los cables que van a conectar los muxes2x1 entre si
    wire Y0, Y1;
    //utilizar el modulo 2x1 para conectar los selectores
    Mux_2x1 c1(Y0, D0, D1, S0); //cable de subsalida Y0, entra selector S0 y D0, D1
    Mux_2x1 c2(Y1, D2, D3, S0); //cable de subsalida Y1, entra selector S0, D2, D3
    Mux_2x1 c3(Y2, Y0, Y1, S1); //cable de salida Y, entra selector S1, y entran las salidas de los anteriores

endmodule

//Modulo mux 8:1
module Mux_8x1(output wire Y5, input wire D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2);
    //declarar los subcables de los muxes4x1
    wire Y3, Y4;
    //utilizar dos modulos 4x1 primero
    Mux_4x1 c4(Y3, D0, D1, D2, D3, S0, S1);
    Mux_4x1 c5(Y4, D4, D5, D6, D7, S0, S1);
    //utilizar un modulo 2x1
    Mux_2x1 c6(Y5, Y3, Y4, S2);

endmodule

//Implementacion del ejercicio01 con muxes generados
//
//Tabla01 mux 8:1
module Tabla01_8x1(output wire Y6, input wire inA, inB, inC);
    //utilizar el modulo 8x1
    wire GND, V;
    assign GND = 0;
    assign V = 1;
    Mux_8x1 T1_8x1(Y6, GND, V, V, GND, V, GND, GND, V, inA, inB, inC);

endmodule

//Tabla01 mux 4:1
module Tabla01_4x1(output wire Y7, input wire inA, inB, inC);
    //declaracion de cables para las entradas de C
    wire N1;
    assign N1 = ~ inC;
    //utilizar el modulo 4x1
    Mux_4x1 T1_4x1 (Y7, inC, N1, N1, inC, inA, inB);

endmodule

//Tabla01 mux 2:1
module Tabla01_2x1(output wire Y8, input wire inA, inB, inC);
    wire compuerta1, compuerta2;
    assign compuerta1 = (inB) ^ (inC);
    assign compuerta2 = (inB) ~^ (inC);
    //utilizar el modulo 2x1
    Mux_2x1 T1_2x1(Y8, compuerta1, compuerta2, inA);

endmodule

//Tabla02 mux 8:1
module Tabla02_8x1(output wire Y9, input wire inA, inB, inC);
    //declarar tierra y voltaje
    wire GND, V;
    assign GND = 0;
    assign V = 1;
    //utilizar el modulo 8x1 (recibe primero la salida)
    Mux_8x1 T2_8x1(Y9, V, V, GND, GND, V, V, V, GND, inC, inB, inA);

endmodule

//Tabla02 mux 4:1
module Tabla02_4x1(output wire Y10, input wire inA, inB, inC);
    //declarar el cable negado C y tierra
    wire NC, GND;
    assign NC  = ~(inC);
    assign GND = 0;
    //utilizar el modulo 4x1
    Mux_4x1 T2_4x1(Y10, NC, GND, inC, NC, inB, inA);

endmodule

//Tabla02 mux 2:1
module Tabla02_2x1(output wire Y11, input wire inA, inB, inC);
    //necesito declarar dos compuertas
    wire compuerta1, compuerta2;
    assign compuerta1 = (inB) ~| (inC); //compuerta NOR
    assign compuerta2 = (inB) ^ (inC); //compuerta XOR
    //utilizar modulo 2x1
    Mux_2x1 T2_2x1(Y11, compuerta1, compuerta2, inA);

endmodule