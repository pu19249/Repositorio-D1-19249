//JonathanPu carne19249
//Tabla04SOP

module Tabla04SOP();

//declaracion de cables
wire N1, N2, N3, N4;
wire out01;
wire A1, A2, A3, A4, A5, A6, A7;

//declaracion de entradas
reg inA, inB, inC, inD;

//declaracion de compuertas
not na(N1, inA);
not nb(N2, inB);
not nc(N3, inC);
not nd(N4, inD);
or oa(out01, A1, A2, A3, A4, A5, A6, A7);
and aa(A1, N1, N2, N3, N4);
and ab(A2, N1, N2, inC, N4);
and ac(A3, N1, N2, inC, inD);
and ad(A4, N1, inB, inC, N4);
and ae(A5, N1, inB, inC, inD);
and af(A6, inA, N2, N3, N4);
and ag(A7, inA, N2, inC, N4);

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
    $dumpfile("Tabla04SOP_tb.vcd");
    $dumpvars(0, Tabla04SOP);
  end
  
  endmodule
