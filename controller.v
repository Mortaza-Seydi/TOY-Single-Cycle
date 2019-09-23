module controller (input clk, input [3:0] op, input C,Z, output reg Cout, reg [11:0] controll);

  always @ (  clk ) begin

    controll = 12'b0;

    if (op == 4'b1011 || op == 4'b1010) begin
      controll[0] = C | ~Z;
    end

    if (op == 4'b0000) begin
      controll[1] = 1;
    end

    if (op == 4'b0001 || op == 4'b0010 || op == 4'b0011 || op == 4'b0100 || op == 4'b0110 || op == 4'b1000 || op == 4'b1001 || op == 4'b1100 || op == 4'b1110) begin
      controll[2] = 1;
    end

    if (op == 4'b1001 || op == 4'b1100 || op == 4'b1110) begin
      controll[3] = 1;
    end

    if (op == 4'b0101) begin
      controll[4] = 1;
    end

    if (op == 4'b0011 || op == 4'b0100 || op == 4'b0110) begin
      controll[5] = 1;
    end

    if (op == 4'b0010 || op == 4'b0100) begin
      controll[6] = 1;
    end

    if (op == 4'b0010 || op == 4'b0100 || op == 4'b0110 || op == 4'b1000) begin
      controll[7] = 1;
    end

    if (op == 4'b1101 || op == 4'b1111) begin
      controll[8] = 1;
    end

    if (op == 4'b0001 || op == 4'b0010 || op == 4'b0011 || op == 4'b0110 || op == 4'b1000 || op == 4'b1001 || op == 4'b1010 || op == 4'b1011 || op == 4'b1100 || op == 4'b1110) begin
      controll[9] = 1;
    end

    if (op == 4'b1100 || op == 4'b1101) begin
      controll[10] = 1;
    end

    if (op == 4'b1100) begin
      controll[11] = 1;
    end

    if (op == 4'b1001) begin
        Cout = 0;
    end

  end
endmodule
