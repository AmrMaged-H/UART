`include "CONFIG_MACROS.v"

module data_sampler (input wire CLK,
                     input wire RST,
                     input wire data_sample_en,
                     input wire RX_IN,

                     output wire sampled_bit);
    
    reg [2:0] Samples_Reg;

    always @(posedge CLK or negedge RST) begin
        if(!RST)
            Samples_Reg <= 3'd0;
        else if (data_sample_en)
            Samples_Reg <= {Samples_Reg, RX_IN };
    end

    assign sampled_bit = (Samples_Reg[0] & Samples_Reg[1]) || (Samples_Reg[0] & Samples_Reg[2]) || (Samples_Reg[1] & Samples_Reg[2]);

endmodule
