module counter #(
    parameter WIDTH = 9
)(
    // interface signals
    input   logic               clk,    // clock
    input   logic               rst,    // reset
    input   logic               en,     // counter enable
    output  logic [WIDTH-1:0]   count   // counter output
);

always_ff @(posedge clk, posedge rst)
    if (rst)    count <= {WIDTH{1'b0}};
    else        count <= count + {{WIDTH{1'b0}}, en};

endmodule
