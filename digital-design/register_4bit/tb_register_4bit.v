module tb_register_4bit;

integer pass_count;
integer fail_count;

reg [3:0] D;
reg clk;
wire [3:0] Q;

register_4bit dut (
    .D(D),
    .clk(clk),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin
    $monitor("Time=%0t D=%b clk=%b Q=%b", $time, D, clk, Q);

    clk = 0;
    D = 4'b0000;

    pass_count = 0;
    fail_count = 0;

    #10;
    D = 4'b1011;

    #10;
    if (Q == 4'b1011) begin
        pass_count = pass_count + 1;
        $display("PASS: Q = %b", Q);
    end else begin
        fail_count = fail_count + 1;
        $display("FAIL: Expected 1011, Got %b", Q);
    end

    #10;
    D = 4'b0110;

    #10;
    if (Q == 4'b0110) begin
        pass_count = pass_count + 1;
        $display("PASS: Q = %b", Q);
    end else begin
        fail_count = fail_count + 1;
        $display("FAIL: Expected 0110, Got %b", Q);
    end

    $display("PASS=%0d FAIL=%0d", pass_count, fail_count);
    $finish;
end

endmodule