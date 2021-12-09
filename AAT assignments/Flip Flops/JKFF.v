//Problem:
//        Design a JK flip flop with active low synchronous reset and active high synchronous set.

module JKFF(
//declaring all inputs and outputs correctly
input Clock,
input J,
input K,
output reg Q,
output reg Qbar,
input reset,
input set);

always @ (posedge Clock)
    begin
    //synchronous active low reset
        if(~reset)
        begin
            Q <= 0;
            Qbar <= 1;
        end
    //synchronous active high set
        if(set)
        begin
            Q <= 1;
            Qbar <= 0;
        end
    //normal jkff part
        else
            case({J,K})
            2'b00 : begin Q <= Q; Qbar <= Qbar; end
            2'b01 : begin Q <= 0; Qbar <= 1; end
            2'b10 : begin Q <= 1; Qbar <= 0; end
            2'b11 : begin Q <= Qbar; Qbar <= Q; end
            endcase
    end
endmodule
