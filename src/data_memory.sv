module data_memory (
    input  logic        clk,
    input  logic        mem_read,
    input  logic        mem_write,
    input  logic [15:0] address,
    input  logic [15:0] write_data,
    output logic [15:0] read_data
);

    logic [15:0] memory [0:255];

    integer i;

    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            memory[i] = 16'h0000;
        end
    end

    always_ff @(posedge clk) begin
        if (mem_write) begin
            memory[address[7:0]] <= write_data;
        end
    end

    always_comb begin
        if (mem_read) begin
            read_data = memory[address[7:0]];
        end
        else begin
            read_data = 16'h0000;
        end
    end

endmodule
