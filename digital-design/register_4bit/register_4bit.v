module register_4bit (
    input wire clk,
    input wire [3:0] D,
    input enable,
    input reset,
    output reg [3:0] Q
);

always @(posedge clk) begin
    if (reset) begin
        Q <= 4'b0000;
    end else if (enable) begin
        Q <= D;
    end
end

endmodule