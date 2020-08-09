// Jonathan Pu c. 19249

module testbench();
    reg p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14;
    //Juntando las tablas que tienen tres variables de entradas
    wire out1, out2, out3, out4;
    //Para las tablas que tienen cuatro variables de entrada
    wire out5, out6, out7, out8;

    //Las primeras dos tablas del ejercicio1
     Tabla1a T1a(p1, p2, p3, out1);
     Tabla1b T1b(p1, p2, p3, out2);

    initial begin
        #1
        $display("\n");
        $display(" Tabla 1.1 y 1.2  ");
        $display("A  B  C  |  Y1  Y2");
        $display("---------|--------");
        $monitor("%b  %b  %b  |  %b  %b", p1, p2, p3, out1, out2);
            //Entradas comienzan todas en 0
            p1 = 0; p2 = 0; p3 = 0;
        #1 p3 = 1;
        #1 p2 = 1; p3 = 0;
        #1 p3 = 1;
        #1 p1 = 1; p2 = 0; p3 = 0;
        #1 p3 = 1;
        #1 p2 = 1; p3 = 0;
        #1 p3 = 1;
    end

    //Tabla 3 y 4 del ejercicio01
    Tabla1c T1c(p4, p5, p6, p7, out3);
    Tabla1d T1d(p4, p5, p6, p7, out4);
             
    initial begin
    #9
    $display ("\n");
    $display(" Tabla 1.3 y 1.4  ");
    $display("A  B  C  D  |  Y1  Y2");
    $display("------------|--------");
    $monitor("%b  %b  %b  %b  |  %b  %b", p4, p5, p6, p7, out3, out4);
        //Todas las entradas comienzan en 0
        p4 = 0; p5 = 0; p6 = 0; p7 = 0;
    #1 p7 = 1;
    #1 p6 = 1; p7 = 0;
    #1 p7 = 1;
    #1 p5 = 1; p6 = 0; p7 = 0;
    #1 p7 = 1;
    #1 p6 = 1; p7 = 0;
    #1 p7 = 1;
    #1 p4 = 1; p5 = 0; p6 = 0; p7 = 0;
    #1 p7 = 1;
    #1 p6 = 1; p7 = 0;
    #1 p7 = 1;
    #1 p5 = 1; p6 = 0; p7 = 0;
    #1 p7 = 1;
    #1 p6 = 1; p7 = 0;
    #1 p7 = 1;

    end 

    //Tabla 2.2 y 2.4 (ejercicio02)
    Tabla2b T2b(p8, p9, p10, out5);
    Tabla2d T2d(p8, p9, p10, out6);

    initial begin
    #25
    $display("\n");
    $display(" Tabla 2.b y 2.d ");
    $display("A  B  C  |  Y1  Y2");
    $display("---------|--------");
    $monitor("%b  %b  %b  |  %b  %b", p8, p9, p10, out5, out6);
    //Entradas comienzan todas en 1
        p8 = 1; p9 = 1; p10 = 1;
    #1 p10 = 0;
    #1 p9 = 0; p10 = 1;
    #1 p10 = 0;
    #1 p8 = 0; p9 = 1; p10 = 1;
    #1 p10 = 0;
    #1 p9 = 0; p10 = 1;
    #1 p10 = 0;
        
    end

    //Tabla 2.1 y 2.3 (ejercicio02)
    Tabla2a T2a(p11, p12, p13, p14, out7);
    Tabla2c T2c(p11, p12, p13, p14, out8);

    initial begin
    #33
    $display("\n");
    $display(" Tabla 2.a y 2.c  ");
    $display("A  B  C  D  |  Y1  Y2");
    $display("------------|--------");
    $monitor("%b  %b  %b  %b  |  %b  %b", p11, p12, p13, p14, out7, out8);
        //Entradas comienzan todas en 1
        p11 = 1; p12 = 1; p13 = 1; p14 = 1;
    #1 p14 = 0;
    #1 p13 = 0; p14 = 1;
    #1 p14 = 0;
    #1 p12 = 0; p13 = 1; p14 = 1;
    #1 p14 = 0;
    #1 p13 = 0; p14 = 1;
    #1 p14 = 0;
    #1 p11 = 0; p12 = 1; p13 = 1; p14 = 1;
    #1 p14 = 0;
    #1 p13 = 0; p14 = 1;
    #1 p14 = 0;
    #1 p12 = 0; p13 = 1; p14 = 1;
    #1 p14 = 0;
    #1 p13 = 0; p14 = 1;
    #1 p14 = 0;

    end

    //Fin de codigo
    initial
        #50 $finish;

    //GTK Wave
    initial begin
        $dumpfile("Lab04Ejercicio01_02_tb.vcd");
        $dumpvars(0, testbench);

    end


endmodule //Fin de modulo de testbench para todas las tablas