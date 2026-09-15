module control_unit (
    input  logic [3:0] opcode,

    output logic [2:0] alu_sel,
    output logic       reg_write,
    output logic       mem_read,
    output logic       mem_write,
    output logic       jump,
    output logic       branch_eq,
    output logic       branch_ne,
    output logic       halt
);

    always_comb begin

        alu_sel   = 3'b000;
        reg_write = 1'b0;
        mem_read  = 1'b0;
        mem_write = 1'b0;
        jump      = 1'b0;
        branch_eq = 1'b0;
        branch_ne = 1'b0;
        halt      = 1'b0;

        case (opcode)
            4'b0000: begin end                    // NOP
            4'b0001: begin alu_sel = 3'b000; reg_write = 1'b1; end // ADD
            4'b0010: begin alu_sel = 3'b001; reg_write = 1'b1; end // SUB
            4'b0011: begin alu_sel = 3'b010; reg_write = 1'b1; end // AND
            4'b0100: begin alu_sel = 3'b011; reg_write = 1'b1; end // OR
            4'b0101: begin alu_sel = 3'b100; reg_write = 1'b1; end // XOR
            4'b0110: begin alu_sel = 3'b101; reg_write = 1'b1; end // SHL
            4'b0111: begin alu_sel = 3'b110; reg_write = 1'b1; end // SHR
            4'b1000: begin reg_write = 1'b1; end   // MOV
            4'b1001: begin reg_write = 1'b1; end   // LDI
            4'b1010: begin mem_read = 1'b1; reg_write = 1'b1; end // LOAD
            4'b1011: begin mem_write = 1'b1; end   // STORE
            4'b1100: begin jump = 1'b1; end        // JMP
            4'b1101: begin branch_eq = 1'b1; end   // BEQ
            4'b1110: begin branch_ne = 1'b1; end   // BNE
            4'b1111: begin halt = 1'b1; end        // HALT
        endcase
    end

endmodule
