module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    // interface signals
    input   logic               rst,        // reset
    input   logic               clk,        // clk
    input   logic               en,         // enable
    input   logic [D_WIDTH-1:0] incr,       // count increment
    output  logic [D_WIDTH-1:0] dout        // data out
);

    wire    [A_WIDTH-1:0]       address;    // interconnect wire

counter myCounter (
    .clk    (clk),
    .rst    (rst),
    .en     (en),
    .incr   (incr),
    .count  (address)
);

rom sineRom (
    .clk    (clk),
    .addr   (address),
    .dout   (dout)
);

endmodule
