//Jonathan Pu c. 19249


//Ejercicio05 FF D con R asinc. y S sinc.

module FF_D (input [0:3]D, CLK,  set, reset, output [0:3]Q);

//reset asincrono
always @ (posedge CLK or posedge reset)
    if reset == 1'b 1 begin
        [0:3]Q <= 4'b 0000;
    end else begin [0:3]Q <= 4'b 0000;
        [0:3]Q <= [0:3]D;
    if reset == 0;
//set sincrono
    if set ==1'b begin
        Q<= 4'b 1111;
    else
        [0:3]Q <= [0:3]D;
    end

endmodule
