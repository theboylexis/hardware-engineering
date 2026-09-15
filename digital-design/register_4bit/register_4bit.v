module register_4bit (
    input wire clk,
    input wire [3:0] D,
    output reg [3:0] Q
);

always @(posedge clk) begin
    Q <= D;
end

endmodule