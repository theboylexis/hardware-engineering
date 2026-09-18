module tb_shift_register_4bit;

reg clk;
reg reset;
reg serial_in;
wire [3:0] Q;
integer pass_count;
integer fail_count;

shift_register_4bit dut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    serial_in = 0;
    reset = 1;

    pass_count = 0;
    fail_count = 0;

    #7 reset = 0;
    #3 serial_in = 1;
    #38 serial_in = 0;
end

initial begin
    #6;
    if (Q !== 4'b0000) begin
        fail_count = fail_count + 1;
        $display("FAIL: shift register did not reset to 0000");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: shift register reset to 0000");
    end
end

initial begin
    #16;
    if (Q !== 4'b1000) begin
        fail_count = fail_count + 1;
        $display("FAIL: shift register did not shift to 1000");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: shift register shifted to 1000");
    end
end

initial begin
    #26;
    if (Q !== 4'b1100) begin
        fail_count = fail_count + 1;
        $display("FAIL: shift register did not shift to 1100");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: shift register shifted to 1100");
    end
end

initial begin
    #56;
    if (Q !== 4'b0111) begin
        fail_count = fail_count + 1;
        $display("FAIL: shift register did not shift to 0111");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: shift register shifted to 0111");
    end
end

initial begin
    #66;
    if (Q !== 4'b0011) begin
        fail_count = fail_count + 1;
        $display("FAIL: shift register did not shift to 0011");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: shift register shifted to 0011");
    end
end

initial begin
    $monitor("Time=%0t | clk=%b | reset=%b | serial_in=%b | Q=%b",
             $time, clk, reset, serial_in, Q);
end

initial begin
    #70;
    $display("PASS=%0d FAIL=%0d", pass_count, fail_count);
    $finish;
end

endmodule
