module alu16 (
    input  logic [15:0] a,
    input  logic [15:0] b,
    input  logic [2:0]  alu_sel,

    output logic [15:0] result,
    output logic        z,
    output logic        n,
    output logic        c,
    output logic        v
);

    logic [16:0] temp;

    always_comb begin

        result = 16'b0;
        c      = 1'b0;
        v      = 1'b0;
        temp   = 17'b0;

        case (alu_sel)

            // ADD
            3'b000: begin
                temp   = {1'b0, a} + {1'b0, b};
                result = temp[15:0];
                c      = temp[16];

                v = (~(a[15] ^ b[15])) &
                    (result[15] ^ a[15]);
            end

            // SUB
            3'b001: begin
                result = a - b;
                c = (a >= b);

                v = (a[15] ^ b[15]) &
                    (result[15] ^ a[15]);
            end

            // AND
            3'b010: begin
                result = a & b;
            end

            // OR
            3'b011: begin
                result = a | b;
            end

            // XOR
            3'b100: begin
                result = a ^ b;
            end

            // SHIFT LEFT
            3'b101: begin
                result = a << 1;
                c = a[15];
            end

            // SHIFT RIGHT
            3'b110: begin
                result = a >> 1;
                c = a[0];
            end

            // UNUSED
            3'b111: begin
                result = 16'b0;
            end

        endcase

        z = (result == 16'b0);
        n = result[15];

    end

endmodule
