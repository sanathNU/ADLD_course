//Synchronous mod 5 counter
module Mod5Counter(input Clock,Reset,output [2:0] Y);
//declaring the wires
wire Qa,Qb,Qc;
//using the tff logic
TFF t1(Qa+Qb*Qc,Clock,Reset,Qa);
TFF t2(Qc,Clock,Reset,Qb);
TFF t3(~Qa,Clock,Reset,Qc);
assign Y = {Qa,Qb,Qc};

endmodule



//defining the tff module
module TFF(T,Clock,Reset,Out);
//Defining input and outputs
input T,Clock,Reset;
output reg Out;
// Defining main logic for TFF
always@ (posedge Clock, posedge Reset)
    if(Reset)
        Out <= 0;
    else
        if(T)
            Out <= ~Out;
        else
            Out <= Out;
endmodule
