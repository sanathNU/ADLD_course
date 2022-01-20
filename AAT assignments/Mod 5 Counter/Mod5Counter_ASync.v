//Asynchronous mod 5 counter
module Mod5Counter(input Clock,Reset,output [2:0] Y);
//declaring the wires
wire Qa,Qb,Qc;
assign #0 Rst = Qa*Qc | Reset;
//using the tff logic
TFF t1(1,Clock,Rst,Qa);
TFF t2(1,~Qa,Rst,Qb);
TFF t3(1,~Qb,Rst,Qc);

assign Y = {Qc,Qb,Qa};
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
