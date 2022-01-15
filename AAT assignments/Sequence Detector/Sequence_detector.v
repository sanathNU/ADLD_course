odule Sequence_Generator( 
input Clock,
input Reset,
output reg [2:0]  Out);

wire [2:0] intWire;
wire QA,QB,QC, QA_bar,QB_bar,QC_bar;
//initializing all logic required for flipflops
assign  intWire[0] = QA*QB_bar + QB*QC_bar;
assign  intWire[1] = QA_bar*QC  + QB_bar*QC;
assign  intWire[2] = QA_bar*QC_bar + QC*QA;
 
//initializing all fliplflops
DFF DA(Clock, QB^QC, Reset, QA,QA_bar);
DFF DB(Clock, QB_bar + QA_bar*QC, Reset, QB,QB_bar);
DFF DC(Clock, QC_bar*QA_bar*QB, Reset, QC,QC_bar);

assign Out = {QC, QB, QA};
 
endmodule


//Code for DFF
module DFF(
input clock,
input D,
input Reset,
output reg Q,
output reg Qbar);

always @ (posedge clock, posedge Reset)
begin
   if(Reset)
       Q <= 0;
   else
       begin
       Q <= D;
       Qbar <= ~D;
       end
end

endmodule
