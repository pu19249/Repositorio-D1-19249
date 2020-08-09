// Jonathan Pu c. 19249

module testbench05();
    //gate modelling

    reg p1, p2, p3;
    wire out1, out2, out3;

    //SOP 
    SOP S1(p1, p2, p3, out1);
     
    initial begin
        #1
        $display("\n");
        $display("Tabla SOP1 GM");
        $display("A  M  P  |  L");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p1, p2, p3, out1);
           //Entradas comienzan en 0
           p1 = 0; p2 = 0; p3 =0;
       #1 p3 = 1;
       #1 p2 = 1; p3 = 0;
       #1 p3 = 1;
       #1 p1 = 1; p2 = 0; p3 = 0;
       #1 p3 = 1;
       #1 p2 = 1; p3 =0; 
       #1 p3 = 1;

    end

    //POS
    POS P1(p1, p2, p3, out2);

    initial begin
        #9
        $display("\n");
        $display("Tabla POS1 GM");
        $display("A  M  P  |  L");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p1, p2, p3, out2);
             //Entradas comienzan en 0
           p1 = 0; p2 = 0; p3 =0;
       #1 p3 = 1;
       #1 p2 = 1; p3 = 0;
       #1 p3 = 1;
       #1 p1 = 1; p2 = 0; p3 = 0;
       #1 p3 = 1;
       #1 p2 = 1; p3 =0; 
       #1 p3 = 1;

    end

    //Simplificada
    SIMP SO1(p1, p2, p3, out3);
    
    initial begin
         #17
        $display("\n");
        $display("Tabla SIMP 1 ");
        $display("A  M  P  |  L");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p1, p2, p3, out3);
             //Entradas comienzan en 0
           p1 = 0; p2 = 0; p3 =0;
       #1 p3 = 1;
       #1 p2 = 1; p3 = 0;
       #1 p3 = 1;
       #1 p1 = 1; p2 = 0; p3 = 0;
       #1 p3 = 1;
       #1 p2 = 1; p3 =0; 
       #1 p3 = 1;

    end

    //behavioral modelling
    reg p4, p5, p6;
    wire out4, out5, out6;

    //SOP1

    SOP1 S2(p4, p5, p6, out4);

    initial begin
        #25
        $display("\n");
        $display("Tabla SOP2 BM");
        $display("A  M  P  |  L");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p4, p5, p6, out4);
             //Entradas comienzan en 0
           p4 = 0; p5 = 0; p6 =0;
       #1 p6 = 1;
       #1 p5 = 1; p6 = 0;
       #1 p6 = 1;
       #1 p4 = 1; p5 = 0; p6 = 0;
       #1 p6 = 1;
       #1 p5 = 1; p6 =0; 
       #1 p6 = 1;

    end

    //POS1

    POS1 P2(p4, p5, p6, out5);
    initial begin
        #33
        $display("\n");
        $display("Tabla POS2 BM");
        $display("A  M  P  |  L");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p4, p5, p6, out5);
             //Entradas comienzan en 0
           p4 = 0; p5 = 0; p6 =0;
       #1 p6 = 1;
       #1 p5 = 1; p6 = 0;
       #1 p6 = 1;
       #1 p4 = 1; p5 = 0; p6 = 0;
       #1 p6 = 1;
       #1 p5 = 1; p6 =0; 
       #1 p6 = 1;

    end

    //SIMP1

    SIMP1 SO2(p4, p5, p6, out6);
    initial begin
        #41
        $display("\n");
        $display("Tabla SIMP 2 ");
        $display("A  M  P  |  L");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p4, p5, p6, out6);
             //Entradas comienzan en 0
           p4 = 0; p5 = 0; p6 =0;
       #1 p6 = 1;
       #1 p5 = 1; p6 = 0;
       #1 p6 = 1;
       #1 p4 = 1; p5 = 0; p6 = 0;
       #1 p6 = 1;
       #1 p5 = 1; p6 =0; 
       #1 p6 = 1;

    end
//Fin de codigo
    initial
    #49 $finish;

//GTK Wave
    initial begin
        $dumpfile("Lab05Ejercicio05_tb.vcd");
        $dumpvars(0, testbench05);

    end

endmodule
//Fin de modulo de testbench para todas las formas del ejercicio05