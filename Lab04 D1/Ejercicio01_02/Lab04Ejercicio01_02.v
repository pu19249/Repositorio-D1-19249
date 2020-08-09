// Ejercicio04 Lab04 Jonathan Pu c. 19249

/* Ejercicio01 Tabla 1 Con gate modelling
Ecuacion a implementar Y = B'C'+ AC + A'C' */

module Tabla1a(input wire inA, inB, inC, output wire Y); 

    wire NA, NB, NC, A1, A2, A3;
    not (NA, inA);
    not (NB, inB);
    not (NC, inC);
    and (A1, NB, NC);
    and (A2, inA, inC);
    and (A3, NA, NC);
    or (Y, A1, A2, A3);

endmodule

/*Ejercicio01 Tabla 2 con Operadores logicos
Funcion a implementar Y = B'*/

module Tabla1b(input wire inA, inB, inC, output wire Y);
    
    assign Y = (~inB);

endmodule 

/*Ejercicio01 Tabla 3 con gate modelling
Funcion a implementar Y = A'B'C'D' + A'B'C*D + A'*B*C'*D 
 + A'*B*C*D' + A*B*C'*D' + A*B*C*D + A*B'*C'*D + A*B'*C*D'*/

module Tabla1c(input wire inA, inB, inC, inD, output wire Y);
    wire NA, NB, NC, ND, A1, A2, A3, A4, A5, A6, A7, A8;
    not (NA, inA);
    not (NB, inB);
    not (NC, inC);
    not (ND, inD);
    and (A1, NA, NB, NC, ND);
    and (A2, NA, NB, inC, inD);
    and (A3, NA, inB, NC, inD);
    and (A4, NA, inB, inC, ND);
    and (A5, inA, inB, NC, ND);
    and (A6, inA, inB, inC, inD);
    and (A7, inA, NB, NC, inD);
    and (A8, inA, NB, inC, ND);
    or (Y, A1, A2, A3, A4, A5, A6, A7, A8);

endmodule

/*Ejercicio01 Tabla 4 con operadores logicos
Ecuacion a implementar Y = A*B + A*C + B'*D'*/

module Tabla1d(input wire inA, inB, inC, inD, output wire Y);
    assign Y = (inA & inB) | (inA & inC) | (~inB & ~inD);

endmodule

/* Ejercicio02 Tabla 1 con gate modelling 
Ecuacion a implementar Y = B'*C'*D' + A*C' + A*B' + A*D' */

module Tabla2a(input wire inA, inB, inC, inD, output wire Y);

    wire NB, NC, ND, A1, A2, A3, A4;

    not (NB, inB);
    not (NC, inC);
    not (ND, inD);
    and (A1, NB, NC, ND);
    and (A2, inA, NC);
    and (A3, inA, NB);
    and (A4, inA, ND);
    or (Y, A1, A2, A3, A4);

endmodule

/* Ejercicio02 Tabla 2 con operadores 
Ecuacion a implementar Y = B' + C */

module Tabla2b(input wire inA, inB, inC, output wire Y);

    assign Y = (~inB) | (inC);

endmodule

/* Ejercicio02 Tabla 3 con gate modelling
Ecuacion a implementar Y = C'*D + B + A*D */

module Tabla2c(input wire inA, inB, inC, inD, output wire Y);

    wire NC, A1, A2;

    not (NC, inC);
    and (A1, NC, inD);
    and (A2, inA, inD);
    or (Y, A1, A2, inB);

endmodule

/* Ejercicio02 Tabla 4 con operadores
Ecuacion a implementar Y = A'*C' + B */

module Tabla2d(input wire inA, inB, inC, output wire Y);

    assign Y = (~inA & ~inC) | (inB);

endmodule