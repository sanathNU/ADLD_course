//Problem:
//        Design a T Flip Flop with active low synchronous reset and active high synchronous set.

module TFF(
input Clock,
input T,
output reg Q,
output reg Qbar,
input Reset,
input Set);

always @ (posedge Clock)
    begin
    //synchronous active low reset
        if(~Reset)
            begin
                Q <= 0;
                Qbar <=0;
            end
    //synchronous active high reset
        if(Set)
            begin Q <=1;
                Qbar <=0;
            end
        else
        //correct implementation of T flip flop
            if(T)
            begin
                Q <= Qbar;
                Qbar <= Q;
            end
    end

endmodule