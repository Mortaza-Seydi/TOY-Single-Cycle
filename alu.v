module alu (input clk, input [2:0] aluop, input [15:0] in1, in2, input Cin, output reg C, Z, output reg [15:0] aluout);

  reg [16:0] exin1, exin2, exout;
  integer i;

  always @ ( clk ) begin

    if (aluop == 3'b000 || aluop == 3'b010) begin
        exin1[16] = 0;     exin2[16]=0;
        exin1[15:0] = in1; exin2[15:0] = in2;

        exout = exin1 + exin2;

        aluout = exout[15:0];
        C = exout[16];
    end

    if (aluop == 3'b001 || aluop == 3'b011) begin
        exin1[16] = 0;     exin2[16]=0;
        exin1[15:0] = in1; exin2[15:0] = in2;

        exout = exin1 - exin2;

        aluout = exout[15:0];
        C = exout[16];
    end

    if (aluop == 3'b110) begin //xor
      aluout = in1 ^ in2;
    end

    if (aluop == 3'b111) begin //ror
      for (i = 0; i < 15; i = i+1) begin
        aluout[i] = in1[i+1];
      end
      aluout[15] = Cin;
      C = in1[0];
    end

    if (aluop == 3'b101) begin //or
      aluout = in1 | in2;
    end

    if (aluop == 3'b100) begin //and
      aluout = in1 & in2;
    end

    if (aluout == 16'b0) begin
      Z = 1;
    end

    if (aluout != 16'b0) begin
      Z = 0;
    end

  end
endmodule
