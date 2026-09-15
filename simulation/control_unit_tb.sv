module control_unit_tb;

    logic [3:0] opcode;

    logic [2:0] alu_sel;
    logic       reg_write;
    logic       mem_read;
    logic       mem_write;
    logic       jump;
    logic       branch_eq;
    logic       branch_ne;
    logic       halt;

    control_unit uut (
        .opcode(opcode),
        .alu_sel(alu_sel),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .jump(jump),
        .branch_eq(branch_eq),
        .branch_ne(branch_ne),
        .halt(halt)
    );

    initial begin
        opcode = 4'b0000; #10; // NOP
        opcode = 4'b0001; #10; // ADD
        opcode = 4'b0010; #10; // SUB
        opcode = 4'b0011; #10; // AND
        opcode = 4'b0100; #10; // OR
        opcode = 4'b0101; #10; // XOR
        opcode = 4'b0110; #10; // SHL
        opcode = 4'b0111; #10; // SHR
        opcode = 4'b1000; #10; // MOV
        opcode = 4'b1001; #10; // LDI
        opcode = 4'b1010; #10; // LOAD
        opcode = 4'b1011; #10; // STORE
        opcode = 4'b1100; #10; // JMP
        opcode = 4'b1101; #10; // BEQ
        opcode = 4'b1110; #10; // BNE
        opcode = 4'b1111; #10; // HALT
        $finish;
    end

endmodule
