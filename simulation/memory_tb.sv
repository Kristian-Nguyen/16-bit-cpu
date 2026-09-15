module memory_tb;

    logic clk;

    logic [15:0] instr_address;
    logic [15:0] instruction;

    logic        mem_read;
    logic        mem_write;
    logic [15:0] data_address;
    logic [15:0] write_data;
    logic [15:0] read_data;

    instruction_memory imem (
        .address(instr_address),
        .instruction(instruction)
    );

    data_memory dmem (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(data_address),
        .write_data(write_data),
        .read_data(read_data)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        instr_address = 0;
        mem_read = 0;
        mem_write = 0;
        data_address = 0;
        write_data = 0;

        #10;

        data_address = 16'd5;
        write_data = 16'd123;
        mem_write = 1;
        #10;

        mem_write = 0;
        mem_read = 1;
        #10;

        mem_read = 0;
        mem_write = 1;
        data_address = 16'd10;
        write_data = 16'd456;
        #10;

        mem_write = 0;
        mem_read = 1;
        #10;

        data_address = 16'd20;
        #10;

        $finish;
    end

endmodule
