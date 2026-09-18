module tb_fsm_2state;

reg clk;
reg reset;
reg start;
reg done;
integer pass_count;
integer fail_count;
wire active;

fsm_2state dut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .done(done),
    .active(active)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    start = 0;
    done = 0;

    pass_count = 0;
    fail_count = 0;

    #7 reset = 0;
    #3 start = 1;
    #28 done = 1;
end

initial begin
    #6;
    if (active !== 1'b0) begin
        fail_count = fail_count + 1;
        $display("FAIL: FSM did not reset to IDLE");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: FSM reset to IDLE");
    end
end

initial begin
    #16;
    if (active !== 1'b1) begin
        fail_count = fail_count + 1;
        $display("FAIL: FSM did not transition to ACTIVE");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: FSM transitioned to ACTIVE");
    end
end

initial begin
    #46;
    if (active !== 1'b0) begin
        fail_count = fail_count + 1;
        $display("FAIL: FSM did not transition back to IDLE");
    end else begin
        pass_count = pass_count + 1;
        $display("PASS: FSM transitioned back to IDLE");
    end
end

initial begin
    $monitor("Time=%0t | clk=%b | reset=%b | start=%b | done=%b | active=%b",
             $time, clk, reset, start, done, active);
end

initial begin
    #50;
    $display("PASS=%0d FAIL=%0d", pass_count, fail_count);
    $finish;
end

endmodule