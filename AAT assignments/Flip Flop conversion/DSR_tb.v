module DSR_TB;
//declaring all required values
reg S,R,clock=0,reset=1;

wire Q,QB;
//initialization of other modules
DFF_SR uut(S,R,clock,reset,Q,QB);

initial begin S=0; R =0; end
//setting the clock to work
always
    #10 clock=~clock;

initial
    begin
    //initial reset
        reset = 0; #5 reset =1;
        #10 S=1'b1;R=1'b0;
        #20 S=1'b0;R=1'b0;
        #20 S=0;R=1;
        #20 S=1;R=1;
        //setting the reset to zero
        #20 reset=0;
        #10 $stop;
    end

endmodule



