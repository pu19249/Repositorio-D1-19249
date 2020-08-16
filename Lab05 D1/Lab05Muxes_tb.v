//Jonathan Pu c. 19249

module testbench();

//Tabla01 con mux 8x1
    reg p1, p2, p3;
    wire out1;
    //mi modulo Tabla01_8x1 recibe la salida primero, luego las entradas
    Tabla01_8x1 T1a(out1, p1, p2, p3);

    initial begin
        #1
        $display("\n");
        $display(" Tabla01 8x1 ");
        $display("A  B  C  |  Y");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p1, p2, p3, out1);
            //entradas comienzan todas en 0
            p1  = 0; p2 = 0; p3 = 0;
        #1 p1 = 0; p2 = 0; p3 = 1;
        #1 p1 = 0; p2 = 1; p3 = 0;
        #1 p1 = 0; p2 = 1; p3 = 1; 
        #1 p1 = 1; p2 = 0; p3 = 0; 
        #1 p1 = 1; p2 = 0; p3 = 1; 
        #1 p1 = 1; p2 = 1; p3 = 0;
        #1 p1 = 1; p2 = 1; p3 = 1;

    end

//Tabla01 con mux 4x1
    reg p4, p5, p6;
    wire out2;

    Tabla01_4x1 T1b(out2, p4, p5, p6);
    initial begin
        #9
        $display("\n");
        $display(" Tabla01 4x1 ");
        $display("A  B  C  |  Y");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p4, p5, p6, out2);
            //entradas comienzan todas en 0
            p4  = 0; p5 = 0; p6 = 0;
        #1 p4 = 0; p5 = 0; p6 = 1;
        #1 p4 = 0; p5 = 1; p6 = 0;
        #1 p4 = 0; p5 = 1; p6 = 1; 
        #1 p4 = 1; p5 = 0; p6 = 0; 
        #1 p4 = 1; p5 = 0; p6 = 1; 
        #1 p4 = 1; p5 = 1; p6 = 0;
        #1 p4 = 1; p5 = 1; p6 = 1;
    
    end 

//Tabla01 con mux 2x1
    reg p7, p8, p9;
    wire out3;

    Tabla01_2x1 T1c(out3, p7, p8, p9);
    initial begin
        #17
         $display("\n");
        $display(" Tabla01 2x1 ");
        $display("A  B  C  |  Y");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p7, p8, p9, out3);
            //entradas comienzan todas en 0
            p7  = 0; p8 = 0; p9 = 0;
        #1 p7 = 0; p8 = 0; p9 = 1;
        #1 p7 = 0; p8 = 1; p9 = 0;
        #1 p7 = 0; p8 = 1; p9 = 1; 
        #1 p7 = 1; p8 = 0; p9 = 0; 
        #1 p7 = 1; p8 = 0; p9 = 1; 
        #1 p7 = 1; p8 = 1; p9 = 0;
        #1 p7 = 1; p8 = 1; p9 = 1;
    
    end
    
//Tabla02 con mux 8x1
    reg p10, p11, p12;
    wire out4;

    Tabla02_8x1 T2a(out4, p10, p11, p12); //se tomaron las x's como 1, 1
    initial begin
        #25
        $display("\n");
        $display(" Tabla02 8x1 ");
        $display("A  B  C  |  Y");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p10, p11, p12, out4);
            //entradas comienzan todas en 0
            p10  = 0; p11 = 0; p12 = 0;
        #1 p10 = 0; p11 = 0; p12 = 1;
        #1 p10 = 0; p11 = 1; p12 = 0;
        #1 p10 = 0; p11 = 1; p12 = 1; 
        #1 p10 = 1; p11 = 0; p12 = 0; 
        #1 p10 = 1; p11 = 0; p12 = 1; 
        #1 p10 = 1; p11 = 1; p12 = 0;
        #1 p10 = 1; p11 = 1; p12 = 1;
    end
    
//Tabla02 con mux 4x1
    reg p13, p14, p15;
    wire out5;

    Tabla02_4x1 T2b(out5, p13, p14, p15); //se tomaron las x's como 0, 0
    initial begin
        #33
        $display("\n");
        $display(" Tabla02 4x1 ");
        $display("A  B  C  |  Y");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p13, p14, p15, out5);
            //entradas comienzan todas en 0
            p13  = 0; p14 = 0; p15 = 0;
        #1 p13 = 0; p14 = 0; p15 = 1;
        #1 p13 = 0; p14 = 1; p15 = 0;
        #1 p13 = 0; p14 = 1; p15 = 1; 
        #1 p13 = 1; p14 = 0; p15 = 0; 
        #1 p13 = 1; p14 = 0; p15 = 1; 
        #1 p13 = 1; p14 = 1; p15 = 0;
        #1 p13 = 1; p14 = 1; p15 = 1;
    end

//Tabla02 con mux 2x1
    reg p16, p17, p18;
    wire out6;

    Tabla02_2x1 T2c(out6, p16, p17, p18); //se tomaron las x's como 0, 0
    initial begin
        #41
        $display("\n");
        $display(" Tabla02 2x1 ");
        $display("A  B  C  |  Y");
        $display("---------|---");
        $monitor("%b  %b  %b  |  %b", p16, p17, p18, out6);
            //entradas comienzan todas en 0
            p16  = 0; p17 = 0; p18 = 0;
        #1 p16 = 0; p17 = 0; p18 = 1;
        #1 p16 = 0; p17 = 1; p18 = 0;
        #1 p16 = 0; p17 = 1; p18 = 1; 
        #1 p16 = 1; p17 = 0; p18 = 0; 
        #1 p16 = 1; p17 = 0; p18 = 1; 
        #1 p16 = 1; p17 = 1; p18 = 0;
        #1 p16 = 1; p17 = 1; p18 = 1;
    end

//Fin del codigo
    initial
        #49 $finish;

//GTK Wave
    initial begin
        $dumpfile("Lab05Muxes_tb.vcd"); //nombre del archivo
        $dumpvars(0, testbench); //Nombre de este modulo
    end

//fin del modulo para las 6 tablas  
endmodule