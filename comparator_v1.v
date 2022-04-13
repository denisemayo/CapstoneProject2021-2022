//
// Digital magnatude comparator v1
// Modelling with AND OR gates (positive logic)
// Zeros are false, 1's are true 
//

module comparator_v1 (
    input [5:0] in_val1, // result from internally generated comparison signal
    input [5:0] in_val2, // result read in from keegan's RSSI module
    output [2:0] const_outs //3 bits, bit 0 is less than, bit 1 is equal to, bit 2 is greater than 
);


wire lessthan, morethan, equalto;
wire [5:0] eqto_wire;
//equal to circuit
xnor xnor_0(eqto_wire[0], in_val1[0], in_val2[0]);
xnor xnor_1(eqto_wire[1], in_val1[1], in_val2[1]);
xnor xnor_2(eqto_wire[2], in_val1[2], in_val2[2]);
xnor xnor_3(eqto_wire[3], in_val1[3], in_val2[3]);
xnor xnor_4(eqto_wire[4], in_val1[4], in_val2[4]);
xnor xnor_5(eqto_wire[5], in_val1[5], in_val2[5]);


and and_eq(equalto, eqto_wire[0], eqto_wire[1], eqto_wire[2], eqto_wire[3], eqto_wire[4], eqto_wire[5]);

//greater than circuit
wire [5:0] gt_and_val; 
wire gt_or_val;

and gt_and_5 (gt_and_val[5], in_val1[5], ~in_val2[5]);
and gt_and_4 (gt_and_val[4], in_val1[4], ~in_val2[4], eqto_wire[5]);
and gt_and_3 (gt_and_val[3], in_val1[3], ~in_val2[3], eqto_wire[5], eqto_wire[4]);
and gt_and_2 (gt_and_val[2], in_val1[2], ~in_val2[2], eqto_wire[5], eqto_wire[4], eqto_wire[3]);
and gt_and_1 (gt_and_val[1], in_val1[1], ~in_val2[1], eqto_wire[5], eqto_wire[4], eqto_wire[3], eqto_wire[2]);
and gt_and_0 (gt_and_val[0], in_val1[0], ~in_val2[0], eqto_wire[5], eqto_wire[4], eqto_wire[3], eqto_wire[2], eqto_wire[1]);

or gt_or_out (gt_or_val, gt_and_val[5], gt_and_val[4], gt_and_val[3], gt_and_val[2], gt_and_val[1], gt_and_val[0]);

//less than circuit
wire [5:0] lt_and_val;
wire lt_or_val;

and lt_and_4 (lt_and_val[5], in_val2[5], ~in_val1[5]);
and lt_and_4 (lt_and_val[4], in_val2[4], ~in_val1[4], eqto_wire[5]);
and lt_and_3 (lt_and_val[3], in_val2[3], ~in_val1[3], eqto_wire[5], eqto_wire[4]);
and lt_and_2 (lt_and_val[2], in_val2[2], ~in_val1[2], eqto_wire[5], eqto_wire[4], eqto_wire[3]);
and lt_and_1 (lt_and_val[1], in_val2[1], ~in_val1[1], eqto_wire[5], eqto_wire[4], eqto_wire[3], eqto_wire[2]);
and lt_and_0 (lt_and_val[0], in_val2[0], ~in_val1[0], eqto_wire[5], eqto_wire[4], eqto_wire[3], eqto_wire[2], eqto_wire[1]);

or lt_or (lt_or_val, lt_and_val[0], lt_and_val[1], lt_and_val[2], lt_and_val[3], lt_and_val[4], lt_and_val[5]);

//final assignments
assign const_outs[0] = lt_or_val;
assign const_outs[1] = equalto;
assign const_outs[2] = gt_or_val;

endmodule