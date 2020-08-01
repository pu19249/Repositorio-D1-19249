//JonathanPu carne19249
//Tabla03POS

module Tabla03POS();

//declaracion de cables
wire N1, N2, N3, N4;
wire out01;
wire O1, O2, O3, O4, O5, O6, O7, O8, O9;

//declaracion de entradas
reg inA, inB, inC, inD;

//declaracion de compuertas
not na(N1, inA);
not nb(N2, inB);
not nc(N3, inC);
not nd(N4, inD);
or oa(O1, inA, N2, inC, inD);
or ob(O2, inA, N2, inC, N4);
or oc(O3, inA, N2, N3, inD);
or od(O4, inA, N2, N3, N4);
or oe(O5, N1, inB, inC, N4);
or of(O6, N1, inB, N3, N4);
or og(O7, N1, N2, inC, inD);
or oh(O8, N1, N2, inC, N4);
or oi(O9, N1, N2, N3, N4);
and a1(out01, O1, O2, O3, O4, O5, O6, O7, O8, O9);

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
    $dumpfile("Tabla03POS_tb.vcd");
    $dumpvars(0, Tabla03POS);
  end
  
  endmodule
