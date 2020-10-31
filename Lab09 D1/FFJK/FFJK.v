//Jonathan Pu c. 19249
//FF JK

module FFD(input wire clk, reset, En, D, output reg Q);

    always@(posedge clk or posedge reset) begin
        if(reset)
            Q <= 1'b0;
        else if (En)
            Q <= D;
    end
endmodule

module FFJK(input wire clk, reset, En, J, K, output wire Q);
    wire nK, nQ, a1, a2, D;
    not(nK, K);
    not(nQ, Q);
    and(a1, nK, Q);
    and(a2, J, nQ);
    or(D, a1, a2);    
    FFD a(clk, reset, En, D, Q);
endmodule