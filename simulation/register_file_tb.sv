module register_file_tb;

    logic        clk;
    logic        reset;

    logic [2:0]  read_addr1;
    logic [2:0]  read_addr2;

    logic [2:0]  write_addr;
    logic [15:0] write_data;
    logic        write_enable;

    logic [15:0] read_data1;
    logic [15:0] read_data2;

    // Unit under test
    register_file uut (
        .clk(clk),
        .reset(reset),
        .read_addr1(read_addr1),
        .read_addr2(read_addr2),
        .write_addr(write_addr),
        .write_data(write_data),
        .write_enable(write_enable),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Clock generator: flips every 5 ns, full period = 10 ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset        = 1;
        write_enable = 0;
        read_addr1   = 0;
        read_addr2   = 0;
        write_addr   = 0;
        write_data   = 0;

        // Reset all registers
        #10;
        reset = 0;

        // Write 25 into R1
        write_addr   = 3'd1;
        write_data   = 16'd25;
        write_enable = 1;
        #10;

        // Write 50 into R2
        write_addr = 3'd2;
        write_data = 16'd50;
        #10;

        // Read R1 and R2
        write_enable = 0;
        read_addr1 = 3'd1;
        read_addr2 = 3'd2;
        #10;

        // Overwrite R1 with 100
        write_addr   = 3'd1;
        write_data   = 16'd100;
        write_enable = 1;
        #10;

        write_enable = 0;
        read_addr1 = 3'd1;
        #10;

        // Attempt write to R3 while disabled; R3 should remain 0
        write_addr   = 3'd3;
        write_data   = 16'd200;
        write_enable = 0;
        #10;

        read_addr1 = 3'd3;
        #10;

        // Reset and verify R1/R2 return to zero
        reset = 1;
        #10;
        reset = 0;
        read_addr1 = 3'd1;
        read_addr2 = 3'd2;
        #10;

        $finish;
    end

endmodule
