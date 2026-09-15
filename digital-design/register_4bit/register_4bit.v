module register_4bit (
    input wire clk,
    input wire [3:0] D,
    input enable,
    output reg [3:0] Q
);

always @(posedge clk) begin
    if (enable) begin
        Q <= D;
    end
end

endmodule