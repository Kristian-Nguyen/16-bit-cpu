module instruction_memory (
    input  logic [15:0] address,
    output logic [15:0] instruction
);

    logic [15:0] memory [0:255];

    initial begin
        integer i;
        for (i = 0; i < 256; i = i + 1) begin
            memory[i] = 16'h0000;
        end
    end

    always_comb begin
        instruction = memory[address[7:0]];
    end

endmodule
