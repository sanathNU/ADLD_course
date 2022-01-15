module Simple_TB;

//    Sequence Generator TestBench
wire [2:0] Seq_output;
reg clock,reset;

initial begin
//doing the early honours of a reset
clock = 0; reset = 1;
#10 reset = 0;
end

always #5 clock = ~clock;
//instantiating the module
Sequence_Generator S1(clock,reset,Seq_output);

initial #400 $stop;

endmodule
