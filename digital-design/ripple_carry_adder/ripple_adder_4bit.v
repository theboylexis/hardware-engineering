module ripple_adder_4bit (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
wire C1, C2, C3;

full_adder FA0 (
    .A(A[0]),
    .B(B[0]),
    .Cin(Cin),
    .Sum(Sum[0]),
    .Cout(C1)
);

full_adder FA1 (
    .A(A[1]),
    .B(B[1]),
    .Cin(C1),
    .Sum(Sum[1]),
    .Cout(C2)
);

full_adder FA2 (
    .A(A[2]),
    .B(B[2]),
    .Cin(C2),
    .Sum(Sum[2]),
    .Cout(C3)
);

full_adder FA3 (
    .A(A[3]),
    .B(B[3]),
    .Cin(C3),
    .Sum(Sum[3]),
    .Cout(Cout)
);
endmodule