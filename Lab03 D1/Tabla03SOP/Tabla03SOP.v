//JonathanPu carne19249
//Tabla03SOP

module Tabla03SOP();

//declaracion de cables
wire out01; //la salida del or principal
wire A01, A02, A03, A04, A05, A06, A07;
wire N01, N02, N03, N04;

//declaracion de entradas
reg inA, inB, inC, inD;

//declaracion de compuertas
not Na(N01, inA);
not Nb(N02, inB);
not Nc(N03, inC);
not Nd(N04, inD);
or Oa(out01, A01, A02, A03, A04, A05, A06, A07);
and Aa(A01, N01, N02, N03, N04);
and Ab(A02, N01, N02, N03, inD);
and Ac(A03, N01, N02, inC, N04);
and Ad(A04, N01, N02, inC, inD);
and Ae(A05, inA, N02, N03, N04);
and Af(A06, inA, N02, inC, N04);
and Ag(A07, inA, inB, inC, N04);

initial begin
  $display("A  B  C  D|  Y");
  $display("--------------");
  $monitor("%b  %b  %b  %b|  %b", inA, inB, inC, inD, out01);

  //mis entradas comienzan en cero
  //mis posibilidades son 0000,0001,0010,0011,0100,0101,0110,0111,1000,
  //1001,1010,1011,1100,1101,1110,1111
  inA=0; inB=0; inC=0; inD=0;
  #1 inD=1;
  #1 inC=1; inD=0;
  #1 inD=1;
  #1 inB=1; inC=0; inD=0;
  #1 inD=1;
  #1 inC=1; inD=0;
  #1 inD=1;
  #1 inA=1; inB=0; inC=0; inD=0;
  #1 inD=1;
  #1 inB=0; inC=1; inD=0;
  #1 inB=0; inD=1;
  #1 inB=1; inC=0; inD=0;
  #1 inD=1;
  #1 inC=1; inD=0;
  #1 inD=1;
  #1 $finish;

end

initial begin
  $dumpfile("Tabla03SOP_tb.vcd");
  $dumpvars(0, Tabla03SOP);
end

endmodule
