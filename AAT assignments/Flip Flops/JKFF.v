//Problem:
//        Design a JK flip flop with active low asynchronous reset and active high synchronous set.

module JKFF(Clock,J,K,reset,set,Q,Qbar);
input Clock,J,K,reset,set;
output reg Q,Qbar;

always @ (posedge Clock,negedge reset)
    begin
        //asynchronous active low reset
    if(reset==0)
    begin
        Q <= 0;
        Qbar <= 1;
    end
    //synchronous active high set
    else if(set)
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
        default:begin Q <= Q; Qbar <= Qbar;end
        endcase
    end
endmodule
