`timescale 1ns/1ps

module xor4_tb;

  reg a, b, c, d;
  wire y;

  xor4 uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .y(y)
  );

  integer i;

  initial begin
    $display("Time | a b c d | y");
    $display("---------------------");

    for (i = 0; i < 16; i = i + 1) begin
      {a, b, c, d} = i[3:0];
      #10;
      $display("%4t | %b %b %b %b | %b", $time, a, b, c, d, y);
    end

    $display("Simulation complete.");
    $finish;
  end

  initial begin
    $dumpfile("xor4_tb.vcd");
    $dumpvars(0, xor4_tb);
  end

endmodule
