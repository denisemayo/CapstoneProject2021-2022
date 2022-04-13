// controls 2 tri-color LEDs, 1 to designate valid vs invalid signals
// 1's are on, 0's are off 

module LED_control(
    input valid, 
    input whitespace_true, 
    output [2:0] colour
);

// R17 - bit 0
// G17 - bit 1
// B17 - bit 2

assign colour[0] = valid & ~whitespace_true;
assign colour[1] = ~valid;
assign colour[2] = 1'b0;

endmodule