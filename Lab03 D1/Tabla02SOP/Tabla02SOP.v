//JonathanPu carne 19249
//Tabla02SOP

module Tabla02SOP();

//declaracion de cables
wire O01, O02, O03, out01; //or principal con tres entradas y una salida
wire N01, N02, N03; //tres not, uno para cada entrada
wire A01, A02, A03; //tres and

//declaracon de entradas
reg inA, inB, inC;

//declarcacion de compuertas
not Na(N01, inA);
not Nb(N02, inB);
not Nc(N03, inC);
and Aa(A01, N01, N02, inC);
and Ab(A02, inA, inB, N03);
and Ac(A03, inA, inB, inC);
or Oout(out01, A01, A02, A03);

initial begin
  $display("A  B  C|  Y");
  $display("-----------");
  $monitor("%b  %b  %b|  %b", inA, inB, inC, out01);

  //las entradas comeinzan en cero
  inA=0; inB=0; inC=0; //nuestras posibilidades son 000,001,010,011,0100,101,110,111
  #1 inC=1;
  #1 inB=1; inC=0;
  #1 inC=1;
  #1 inA=1; inB=0; inC=0;
  #1 inC=1;
  #1 inB=1; inC=0;
  #1 inC=1;
  #1 $finish;

end

initial begin
  $dumpfile("Tabla02SOP_tb.vcd");
  $dumpvars(0, Tabla02SOP);
end

endmodule
