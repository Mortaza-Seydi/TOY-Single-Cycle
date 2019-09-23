module data_memory (input clk, input [11:0] address1, address2, input [15:0] data1, data2,
                    input [11:0] controll, output reg [15:0] memout);

  reg [15:0] data_mem [0:4096];

  always @ (  clk ) begin

    $readmemb("C:/Users/Mortaza/Desktop/untitled2/src/mem.txt", data_mem);

    if (controll[8] == 1) begin

      case (controll[11:10])
        2'b00: data_mem[address1] = data1; // mem[ins[11:0]] = T
        2'b10: data_mem[address1] = data1; // mem[ins[11:0]] = A
        2'b01: data_mem[address2] = data2; // mem[A[11:0]] = T
        2'b11: data_mem[address2] = data2; // mem[A[11:0]] = A
      endcase

      $writememb("C:/Users/Mortaza/Desktop/untitled2/src/mem.txt", data_mem);

    end

    if (controll[9] == 1) begin

      case (controll[10])
        0: memout = data_mem[address1];
        1: memout = data_mem[address2];
      endcase

    end

  end
endmodule
