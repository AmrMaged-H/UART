`include "CONFIG_MACROS.v"

module parity_calc (input wire [`WIDTH-1:0] P_DATA,
                    input wire parity_type,
                    input wire Data_Valid,
                    input wire CLK,

                    output reg par_bit);

    
    always @(posedge CLK) begin
        if (parity_type && Data_Valid) // Even Parity
            par_bit <= ^P_DATA;
        else if (!parity_type && Data_Valid) // Odd Parity
            par_bit <= ~(^P_DATA);
    end
        
endmodule
