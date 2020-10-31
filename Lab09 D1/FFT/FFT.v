//Jonathan Pu c. 19249
//FF tipo T

module FFD(input wire clk, reset, En, D, output reg Q);

    always@(posedge clk or posedge reset) begin
        if(reset)
            Q <= 1'b0;
        else if (En)
            Q <= D;
    end
endmodule

module FFT(input wire clk, reset, En, output wire Q);

    FFD a(clk, reset, En, ~Q, Q);
endmodule