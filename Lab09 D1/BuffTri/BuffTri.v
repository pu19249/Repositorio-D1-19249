//Jonathan Pu c. 19249
//Buff triestado de 4 bits

module Bufftri(input wire [3:0]in,
               input wire en, 
               output wire [3:0]out);

    assign out = en ? in : 4'bz;
endmodule