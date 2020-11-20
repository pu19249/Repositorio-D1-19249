//Jonathan Pu c. 19249
//Implementacion RAM asincrona
module RAM(input wire [11:0]address_ram,
           input wire cs,//chip select
           input wire we, //write enable
           output wire [3:0]data);

           /*Variables internas de la RAM*/
           reg [3:0]data_out;
           reg [3:0] mem[0:4095]; //RAM de 4kx4
           /*Control de buffer triestado
           output : cuando we = 0, oe = 1, cs = 1*/
           assign data = (cs && !we) ? data_out : 4'bzzzz;
            /*Escritura de memoria cuando we = 1 y cs = 1*/
           always @(address_ram or data or cs or we)
           begin: MEM_WRITE
                if (cs && we)
                    mem[address_ram] = data;
           end
           
        
            /*lectura de memoria cuando we = 0, cs = 1*/
           always @(address_ram or cs or we)
           begin: MEM_READ
                if (cs && !we)
                    data_out = mem[address_ram];
           end
           
endmodule