module sigdelay # (
    parameter   WIDTH = 9
)(
    input   logic               clk,
    input   logic               rst,
    input   logic               en,
    input   logic               rd,
    input   logic               wr,
    input   logic [WIDTH-1:0]   offset,
    input   logic [WIDTH-1:0]   mic_signal,
    output  logic [WIDTH-1:0]   delayed_signal 
);

    wire    [WIDTH-1:0]         rd_addr;
    wire    [WIDTH-1:0]         wr_addr;

counter myCounter (
    .clk    (clk),
    .rst    (rst),
    .en     (en),
    .count  (rd_addr)
);

adder myAdder (
    .clk    (clk),
    .rst    (rst),
    .a      (wr_addr),
    .b      (offset),
    .c      (rd_addr)
);

ram2ports myRam (
    .clk        (clk),
    .wr_en      (wr),
    .rd_en      (rd),
    .wr_addr    (wr_addr),
    .rd_addr    (rd_addr),
    .din        (mic_signal),
    .dout       (delayed_signal)
);

endmodule
