module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A&B) | (A&Cin) | (B&Cin);
endmodule

//This is the hardware design
//module is the hardware block that describes the functionality of the full adder circuit
//inputs are A, B, and Cin which are the signals that are fed into the full adder circuit
//outputs are Sum and Cout which are the signals that are produced by the full adder circuit
//assign sum means that the value of Sum is assigned to the result of the expression A ^ B ^ Cin
//assign cout means that the value of Cout is assigned to the result of the expression (A&B) | (A&Cin) | (B&Cin)
//endmodule indicates the end of the module definition
