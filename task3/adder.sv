module adder #(
    parameter WIDTH = 9
)(
    input   logic               clk,
    input   logic               rst,
    input   logic [WIDTH-1:0]   a,
    input   logic [WIDTH-1:0]   b,
    output  logic [WIDTH-1:0]   c  
);

always_ff @ (posedge clk, posedge rst)
    if (rst)    c <= {WIDTH{1'b0}};
    else        c <= a + b;

endmodule
