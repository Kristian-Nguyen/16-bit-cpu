module alu16_tb;

    logic [15:0] a;
    logic [15:0] b;
    logic [2:0]  alu_sel;

    logic [15:0] result;
    logic        z;
    logic        n;
    logic        c;
    logic        v;

    alu16 uut (
        .a(a),
        .b(b),
        .alu_sel(alu_sel),
        .result(result),
        .z(z),
        .n(n),
        .c(c),
        .v(v)
    );

    initial begin

        // TEST 1: ADD - 5 + 3 = 8
        a = 16'd5;
        b = 16'd3;
        alu_sel = 3'b000;
        #10;

        // TEST 2: SUB - 10 - 4 = 6
        a = 16'd10;
        b = 16'd4;
        alu_sel = 3'b001;
        #10;

        // TEST 3: AND - 1010 AND 1100 = 1000
        a = 16'b0000_0000_0000_1010;
        b = 16'b0000_0000_0000_1100;
        alu_sel = 3'b010;
        #10;

        // TEST 4: OR - 1010 OR 1100 = 1110
        alu_sel = 3'b011;
        #10;

        // TEST 5: XOR - 1010 XOR 1100 = 0110
        alu_sel = 3'b100;
        #10;

        // TEST 6: SHIFT LEFT - 5 << 1 = 10
        a = 16'd5;
        alu_sel = 3'b101;
        #10;

        // TEST 7: SHIFT RIGHT - 10 >> 1 = 5
        a = 16'd10;
        alu_sel = 3'b110;
        #10;

        // TEST 8: ZERO FLAG - 5 - 5 = 0
        a = 16'd5;
        b = 16'd5;
        alu_sel = 3'b001;
        #10;

        // TEST 9: CARRY - 65535 + 1 wraps to 0
        a = 16'hFFFF;
        b = 16'd1;
        alu_sel = 3'b000;
        #10;

        // TEST 10: SIGNED OVERFLOW - 32767 + 1
        a = 16'h7FFF;
        b = 16'd1;
        alu_sel = 3'b000;
        #10;

        $finish;

    end

endmodule
