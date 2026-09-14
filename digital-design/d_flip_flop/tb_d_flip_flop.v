module tb_d_flip_flop;

reg D;
reg clk;
wire Q;

d_flip_flop dut (
    .D(D),
    .clk(clk),
    .Q(Q)
);

always #5 clk = ~clk;
integer pass_count;
integer fail_count;

task check_result;
    input expected_q;

    begin
        if (Q == expected_q) begin
            $display("PASS: Expected Q=%b, Got Q=%b", expected_q, Q);
            pass_count = pass_count + 1;
        end
        else begin
            $display("FAIL: Expected Q=%b, Got Q=%b", expected_q, Q);
            fail_count = fail_count + 1;
        end
    end
endtask

initial begin
    clk = 0;
    D = 0;
    pass_count = 0;
    fail_count = 0;
    $monitor("Time=%0t D=%b clk=%b Q=%b", $time, D, clk, Q);
    #10;
    check_result(0);
    D = 1;
    #10;
    check_result(1);
    D = 0;
    #10;
    check_result(0);
    $display("PASS=%0d FAIL=%0d", pass_count, fail_count);
    $finish;
end

endmodule