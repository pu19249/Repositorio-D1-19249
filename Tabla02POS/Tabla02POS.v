//JonathanPu carne19249
//Tabla02POS

module Tabla02POS();

//declaracion de cables
wire out01;
wire O01, O02, O03, O04, O05;
wire N01, N02, N03;

//declaracion de entradas
reg inA, inB, inC;

//declaracion de compuertas
and Aa(out01, O01, O02, O03, O04, O05);
not Na(N01, inA);
not Nb(N02, inB);
not Nc(N03, inC);
or Oa(O01, inA, inB, inC);
or Ob(O02, inA, N02, inC);
or Oc(O03, inA, N02, N03);
or Od(O04, N01, inB, inC);
or Oe(O05, N01, inB, N03);

initial begin
  $display("A  B  C|  Y");
  $display("-----------");
  $monitor ("%b  %b  %b|  %b", inA, inB, inC, out01);

  //mis entradas cmoienzan en cero
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
    $dumpfile("Tabla02POS_tb.vcd");
    $dumpvars(0, Tabla02POS);
  end

  endmodule
