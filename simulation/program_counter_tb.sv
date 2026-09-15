module program_counter_tb;

    logic        clk;
    logic        reset;
    logic        load_pc;
    logic [15:0] new_pc;
    logic [15:0] pc;

    program_counter uut (
        .clk(clk),
        .reset(reset),
        .load_pc(load_pc),
        .new_pc(new_pc),
        .pc(pc)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset   = 1;
        load_pc = 0;
        new_pc  = 16'h0000;

        #10;
        reset = 0;

        // Normal increment: 0000 -> 0001 -> 0002 -> 0003
        #30;

        // Jump to 0010
        load_pc = 1;
        new_pc  = 16'h0010;
        #10;

        load_pc = 0;

        // Continue incrementing: 0010 -> 0011 -> 0012
        #20;

        // Reset to 0000
        reset = 1;
        #10;
        reset = 0;

        // Increment again
        #20;

        $finish;
    end

endmodule
