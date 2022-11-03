module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    // interface signals
    input   logic               rst,        // reset
    input   logic               clk,        // clk
    input   logic               en,         // enable
    input   logic [D_WIDTH-1:0] incr,       // count increment
    output  logic [D_WIDTH-1:0] dout1,      // data out 1
    output  logic [D_WIDTH-1:0] dout2       // data out 2
);

    wire    [A_WIDTH-1:0]       address1;    // interconnect wire
    wire    [A_WIDTH-1:0]       address2;

counter myCounter (
    .clk    (clk),
    .rst    (rst),
    .en     (en),
    .count  (address1)
);

adder myAdder (
    .clk    (clk),
    .rst    (rst),
    .a      (address1),
    .b      (incr),
    .c      (address2)
);

rom2ports sineRom (
    .clk    (clk),
    .addr1  (address1),
    .addr2  (address2),
    .dout1  (dout1),
    .dout2  (dout2)    
);

endmodule
