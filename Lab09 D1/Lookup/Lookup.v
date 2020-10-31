//Jonathan Pu c. 19249
//ROM como lookup table

module opcode(input wire [6:0]address1,
              output wire [12:0]data1);
    
    output reg [12:0]data2;
    assign out = data2;
    always @(address1)
        begin
            casex(address1)
                7'bxxxxxx0: data2 <= ;
                7'b00001x1:
                7'b00000x1:
                7'b00011x1:
                7'b00010x1:
                7'b0010xx1:
                7'b0011xx1:
                7'b0100xx1:
                7'b0101xx1:
                7'b0110xx1:
                7'b0111xx1:
                7'b1000x11:
                7'b1000x01:
                7'b1001x11:
                7'b1001x01:
                7'b1010xx1:
                7'b1011xx1:
                7'b1100xx1:
                7'b1101xx1:
                7'b1110xx1:
                7'b1111xx1:




            endcase
        end
               
endmodule
