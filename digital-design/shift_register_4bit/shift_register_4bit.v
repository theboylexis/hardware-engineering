module shift_register_4bit (
    input clk,
    input reset,
    input serial_in,
    output reg [3:0] Q
);

always @(posedge clk) begin
    if (reset) begin
        Q <= 4'b0000;
    end else begin
        Q <= {serial_in, Q[3:1]};
    end
end

endmodule