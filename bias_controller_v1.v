/*
*   BIAS CONTROL SIGNAL GENERATOR
*   A circuit designed to load and output the bias=control signals through the PMOD ports of the FPGA device
*
*
*/

module bias_controller_v1(
    input frequency, 
    output [5:0] i1_ctl,
    output [5:0] i2_ctl,
    output [5:0] v1_ctl,
    output [5:0] v2_ctl
);

/*
Findings:

For frequencies over 512MHz, i1_ctl will be 6'b111111

*/



endmodule