//JOnathan Pu c. 19249
//Contador de 12 bits con enable y load

module cont12(
    input wire clk,
    input wire reset,
    input wire enable,
    input wire loact, //bit que activa la carga
    input wire [11:0]load, //carga de 12bits
    output reg [11:0]cont //salida de 12bits
    );

        always @(posedge clk or posedge reset or loact or load) begin //si LA y load cambia tambien se ejecuta el always
            if (reset)
                cont <= 12'b000000000000; //comienza en cero el contador
            else if (loact)
                cont <= load; //si el enable esta desactivado, el load pasa a la salida
            else if (enable)
                cont <= cont + 1; //a lo que tenia la salida se le suma 1
        end

endmodule