`timescale 1ns/1ps

module xor_gate_tb;

  reg  a, b, c, d;
  wire y;

  xor_gate uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .y(y)
  );

  integer i;

  initial begin
    $display("Time | a b c d | y");
    $display("-----|---------|--");

    for (i = 0; i < 16; i = i + 1) begin
      {a, b, c, d} = i[3:0];
      #10;
      $display("%4t | %b %b %b %b | %b", $time, a, b, c, d, y);
    end

    {a, b, c, d} = 4'b0000; #10;
    if (y !== 1'b0) $error("FAIL: 0^0^0^0 should be 0, got %b", y);

    {a, b, c, d} = 4'b0001; #10;
    if (y !== 1'b1) $error("FAIL: 0^0^0^1 should be 1, got %b", y);

    {a, b, c, d} = 4'b1111; #10;
    if (y !== 1'b0) $error("FAIL: 1^1^1^1 should be 0, got %b", y);

    {a, b, c, d} = 4'b1010; #10;
    if (y !== 1'b0) $error("FAIL: 1^0^1^0 should be 0, got %b", y);

    $display("Simulation complete.");
    $finish;
  end

  initial begin
    $dumpfile("xor_gate_tb.vcd");
    $dumpvars(0, xor_gate_tb);
  end

endmodule
