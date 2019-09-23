module cpu (output reg [15:0] A, T, ins, output reg [11:0] PC, output reg clk);

  reg [15:0] ins_mem [0:4096];
  wire [15:0] aluout;
  wire [11:0] controll;
  wire C, Z;
  wire [15:0] data;

  initial begin
    clk = 0;
    $readmemb("C:/Users/Mortaza/Desktop/untitled2/src/ins.txt", ins_mem);
    PC = 12'b0;
    ins = ins_mem[0];
    forever begin
      #10  clk = ~clk;
    end
  end

  controller c(clk, ins[15:12], C, Z, C, controll);
  data_memory dm(clk, ins[11:0], A[11:0], A, T, controll, data);
  alu al(clk, controll[7:5], A, data, C, C, Z, aluout);

  always @ (posedge clk) begin

    if (controll[3] == 0 && controll[2] == 1) begin
      A = aluout;
    end

    if (controll[3] == 1 && controll[2] == 1) begin
      A = data;
    end

    if (controll[4] == 1) begin
      T = A;
    end

    case (controll[1:0])
      2'b00: PC = PC + 1;
      2'b01: PC = data;
      2'b10: PC = ins[11:0];
    endcase

    ins = ins_mem[PC];

    if (^ins === 1'bx) begin
        $stop(2);
    end

  end

endmodule
