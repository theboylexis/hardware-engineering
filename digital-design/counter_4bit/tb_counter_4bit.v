module tb_counter_4bit;

reg clk;
reg reset;
integer pass_count;
integer fail_count;
wire [3:0] count;

counter_4bit dut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    pass_count = 0;
    fail_count = 0;
    #7 reset = 0;
    #1;
    if (count !== 4'b0000) begin
        fail_count = fail_count + 1;
        $display("FAIL: counter did not reset");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: counter reset to 0000");
    end
end

initial begin
    #16;
        if (count !== 4'b0001) begin
        fail_count = fail_count + 1;
        $display("FAIL: counter did not increment to 0001");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: counter incremented to 0001");
    end
end

initial begin
    #26;
        if (count !== 4'b0010) begin
        fail_count = fail_count + 1;
        $display("FAIL: counter did not increment to 0010");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: counter incremented to 0010");
    end
end

initial begin
    #166;
        if (count !== 4'b0000) begin
        fail_count = fail_count + 1;
        $display("FAIL: counter did not wrap to 0000");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: counter wrapped to 0000");
    end
end

initial begin
    $monitor("Time=%0t | clk=%b | count=%b", $time, clk, count);
end

initial begin
    #170;
    $display("PASS=%0d FAIL=%0d", pass_count, fail_count);
    $finish;
end

endmodule