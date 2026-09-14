module tb_full_adder;
reg A, B, Cin;
wire Sum, Cout;

full_adder dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    $monitor("A=%b B=%b Cin=%b Sum=%b Cout=%b", A, B, Cin, Sum, Cout);

    A = 0;
    B = 0;
    Cin = 0;
    #10;

    A = 0;
    B = 0;
    Cin = 1;
    #10;

    A = 0;
    B = 1;
    Cin = 0;
    #10;

    A = 0;
    B = 1;
    Cin = 1;
    #10;

    A = 1;
    B = 0;
    Cin = 0;
    #10;

    A = 1;
    B = 0;
    Cin = 1;
    #10;

    A = 1;
    B = 1;
    Cin = 0;
    #10;

    A = 1;
    B = 1;
    Cin = 1;
    #10;
end

endmodule

//This is the testbench for the full adder module
//module tb_full_adder is the testbench module that tests the functionality of the full adder circuit
//reg A, B, Cin are the input signals that are fed into the full adder circuit and are controlled by the testbench
//wire Sum, Cout are the output signals that are produced by the full adder circuit and are monitored by the testbench
//full_adder dut is the instance of the full adder module that is being tested
//dut stands for "device under test" and is a common naming convention for the module being tested
//initial begin is the block of code that is executed at the start of the simulation
// $monitor is a system task that prints the values of the signals to the console whenever they change
// #10 is a delay of 10 time units before the next set of inputs is applied to the full adder circuit
//%b is a format specifier that prints the value of the signal in binary format
//end indicates the end of the initial block
//endmodule indicates the end of the testbench module definition