module tb_ripple_carry_adder_4bit;
reg [3:0] A, B;
reg Cin;
reg [4:0] expected;
wire [3:0] Sum;
wire Cout;
integer tests;
integer failures;
integer i;
integer j;
integer k;

ripple_adder_4bit dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

//reusable check task-reusable procedure inside the testbench that checks the output of the ripple carry adder 4-bit circuit against the expected values
task check;
    input [3:0] expected_sum;
    input expected_cout;
    begin
        if (Sum !== expected_sum || Cout !== expected_cout) begin
            $display("FAIL: A=%b B=%b Cin=%b => Sum=%b Cout=%b (expected Sum=%b Cout=%b)", A, B, Cin, Sum, Cout, expected_sum, expected_cout);
            failures = failures + 1;
        end else begin
            $display("PASS: A=%b B=%b Cin=%b => Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
        end
    end
endtask

initial begin
    tests = 0;
    failures = 0;

    for(i = 0; i < 16; i = i + 1) begin
        for(j = 0; j < 16; j = j + 1) begin
            for(k = 0; k < 2; k = k + 1) begin
                A = i; B = j; Cin = k; #10;
                tests = tests + 1;
                expected = A + B + Cin;
                check(expected[3:0], expected[4]);
            end
        end
    end

    $display("\n%d tests run, %d failures", tests, failures);
    if (failures == 0)
        $display("All tests passed");
    else
        $display("Some tests failed");
end

endmodule

//This is the testbench for the ripple carry adder 4-bit module
//module tb_ripple_carry_adder_4bit is the testbench module that tests the functionality of the ripple carry adder 4-bit circuit
//inputs are A, B, and Cin which are the signals that are fed into the ripple carry adder 4-bit circuit
//outputs are Sum and Cout which are the signals that are produced by the ripple carry adder 4-bit circuit
//reg [3:0] A, B are the input signals that are fed into the ripple carry adder 4-bit circuit and are controlled by the testbench
//reg Cin is the input signal that is fed into the ripple carry adder 4-bit circuit and is controlled by the testbench
//wire [3:0] Sum is the output signal that is produced by the ripple carry adder 4-bit circuit
//wire Cout is the output signal that is produced by the ripple carry adder 4-bit circuit
//initial block is used to initialize the input signals and monitor the output signals
//4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0101, 4'b1010, and 4'b1111 are the binary values that are assigned to the input signals A and B