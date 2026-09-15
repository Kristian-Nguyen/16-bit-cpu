module program_counter (
    input  logic        clk,
    input  logic        reset,

    // When load_pc = 1, jump to new_pc
    input  logic        load_pc,
    input  logic [15:0] new_pc,

    // Current program counter value
    output logic [15:0] pc
);

    always_ff @(posedge clk) begin

        // Highest priority: reset CPU back to address 0
        if (reset) begin
            pc <= 16'h0000;
        end

        // If a jump/branch is requested,
        // load the new address
        else if (load_pc) begin
            pc <= new_pc;
        end

        // Otherwise, move to the next instruction
        else begin
            pc <= pc + 16'd1;
        end

    end

endmodule
