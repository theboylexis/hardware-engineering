module fsm_2state (
    input clk,
    input reset,
    input start,
    input done,
    output reg active
);

localparam IDLE = 1'b0;
localparam ACTIVE = 1'b1;

reg state;
reg next_state;

always @(*) begin
    case (state)

        IDLE: begin
            if (start)
                next_state = ACTIVE;
            else
                next_state = IDLE;
        end

        ACTIVE: begin
            if (done)
                next_state = IDLE;
            else
                next_state = ACTIVE;
        end

        default: begin
            next_state = IDLE;
        end

    endcase
end

always @(posedge clk) begin
    if (reset)
        state <= IDLE;
    else
        state <= next_state;
end

always @(*) begin
    if (state == ACTIVE)
        active = 1'b1;
    else
        active = 1'b0;
end

endmodule