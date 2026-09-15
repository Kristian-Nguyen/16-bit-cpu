module register_file (
    input  logic        clk,
    input  logic        reset,

    // Two read addresses
    input  logic [2:0]  read_addr1,
    input  logic [2:0]  read_addr2,

    // One write address and data input
    input  logic [2:0]  write_addr,
    input  logic [15:0] write_data,

    // Enables writing
    input  logic        write_enable,

    // Two read outputs
    output logic [15:0] read_data1,
    output logic [15:0] read_data2
);

    // Creates 8 registers, each 16 bits wide
    logic [15:0] registers [0:7];

    integer i;

    // Writing happens on the rising edge of the clock
    always_ff @(posedge clk) begin

        // If reset is active, clear all registers
        if (reset) begin
            for (i = 0; i < 8; i = i + 1) begin
                registers[i] <= 16'b0;
            end
        end

        // Otherwise, write only if write_enable is on
        else if (write_enable) begin
            registers[write_addr] <= write_data;
        end

    end

    // Reading is combinational
    // The outputs immediately show the selected registers
    always_comb begin
        read_data1 = registers[read_addr1];
        read_data2 = registers[read_addr2];
    end

endmodule
