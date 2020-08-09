// Ejercicio05 Lab05 Jonathan Pu c. 19249

// Gate modelling
//SOP L = A*M'*P' + A*M*P' + A*M*P

module SOP(input wire inA, inM, inP, output wire L);

    wire NM, NP, A1, A2, A3;
    not (NM, inM);
    not (NP, inP);
    and (A1, inA, NM, NP);
    and (A2, inA, inM, NP);
    and (A3, inA, inM, inP);
    or (L, A1, A2, A3);

endmodule

//POS L = (A + M + P)*(A + M + P')*(A + M' + P)*(A + M' + P')*(A' + M + P')

module POS(input wire inA, inM, inP, output wire L);

    wire NA, NM, NP, o1, o2, o3, o4, o5;
    not (NA, inA);
    not (NM, inM);
    not (NP, inP);
    or (o1, inA, inM, inP);
    or (o2, inA, inM, NP);
    or (o3, inA, NM, inP);
    or (o4, inA, NM, NP);
    or (o5, NA, inM, NP);
    and (L, o1, o2, o3, o4, o5);

endmodule

//Simplificada L = A*M + A*P'

module SIMP(input wire inA, inM, inP, output wire L);

    wire NP, A1, A2;
    not (NP, inP);
    and (A1, inA, inM);
    and (A2, inA, NP);
    or (L, A1, A2);

endmodule

//Behavioral modelling
//SOP L = A*M'*P' + A*M*P' + A*M*P
    module SOP1(input wire inA, inM, inP, output wire L);

        assign L = (inA & ~inM & ~inP) | (inA & inM & ~inP) 
        | (inA & inM & inP);
    
    endmodule
    
//POS L = (A + M + P)*(A + M + P')*(A + M' + P)*(A + M' + P')*(A' + M + P')
    module POS1(input wire inA, inM, inP, output wire L);

        assign L = (inA | inM | inP) & (inA | inM | ~inP) 
        & (inA | ~inM | inP) & (inA | ~inM | ~inP) & (~inA | inM | ~inP);

    endmodule

//Simplificada L = A*M + A*P'
    module SIMP1(input wire inA, inM, inP, output wire L);
        assign L = (inA & inM) | (inA & ~inP);

    endmodule