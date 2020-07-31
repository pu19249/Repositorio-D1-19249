//Tabla01POS
//JonathanPu carne 19249

module Tabla01POS();

//declaracion de cables
wire N01, N02, N03, N04; //cuatro compuertas NOT que tienen cuatro cables
wire A01, A02, A03, out01;//una compuerta final AND con tres entradas y una salida
wire O01, O02, O03; //tres compuertas OR

//declaracion de entradas
reg in0A, in0B, in0C;

//declaracion de compuertas

not N0A(N01, in0A); //primer compuerta NOT en la cual entra A
not N0B(N02, in0B); //segunda compuerta NOT en la cual entra B
not N0C(N03, in0C); //tercer compuerta NOT en la cual entra C
or O0A(O01,in0A, in0B, N03); //primer compuerta OR
or O0B(O02,in0A, N02, N03); //segunda compuerta OR
or O0C(O03, N01, N02, in0C); //tercer compuerta OR
and A0A(out01, O01, O02, O03); //ultima compuerta del circuito AND donde sale Y

initial begin
  $display("A B C| Y");
  $display("-------");
  $monitor("%b %b %b| %b", in0A, in0B, in0C, out01); //para poder ejecutar la tabla de verdad

//las entradas comienzan en cero
  in0A = 0; in0B = 0; in0C = 0; //nuestras posibles combinaciones son 000,001,010,011,100,101,110,111
  #1 in0C=1; //en un tiempo uno C cambia a uno, y los otros dos se mantienen
  #1 in0B =1; in0C = 0;
  #1 in0C=1;
  #1 in0A=1; in0B=0; in0C=0;
  #1 in0C=1;
  #1 in0B=1; in0C=0;
  #1 in0C=1;
  #1 $finish; //fin de las posibilidades
end

initial begin
  $dumpfile("Tabla01POS_tb.vcd"); //nombre del archivo
  $dumpvars(0,Tabla01POS); //nombre del documento
end

endmodule
