//JonathanPu carne 19249
//Tabla01 SOP

module Tabla01SOP();

//declaracion de cables
wire N1, N2, N3; //tres compuertas NOT, un cable para cada uno
wire O1, O2, O3; //tres compuertas OR
wire A1, A2, A3, out1; //and principal del circuito con la salida de la tabla

//declaracion de mis entradas
reg inA, inB, inC;

//declaracion de variables
not Na(N1, inA);
not Nb(N2, inB);
not Nc(N3, inC);
and Aa(out1, O1, O2, O3);
or Oa(O1, inA, inB, N3);
or Ob(O2, inA, N2, N3);
or Oc(O3, N1, N2, inC);

initial begin
  $display("A  B  C|  Y");
  $display("-----------");
  $monitor("%b  %b  %b|  %b", inA, inB, inC, out1);

  //las entradas comienzan en cero
  inA=0; inB=0; inC=0; //nuestras posibilidades son 000,001,010,011,100,101,110,111
  #1 inC=1;
  #1 inB=1; inC=0;
  #1 inC=1;
  #1 inA=1; inB=0; inC=0;
  #1 inC=1;
  #1 inB=1; inC=0;
  #1 inC=1;

end


initial begin
  $dumpfile("Tabla01SOP_tb.vcd");
  $dumpvars(0, Tabla01SOP);

end

endmodule
