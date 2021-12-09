//main top module
module DFF_SR(S,R,clock,reset,Q,QB);
    input S,R,clock,reset;
    output Q,QB;
    //declaring of wires
    wire w;
    //instantiation of lower modules
    mux41 m1({Q,0,1,Q},{S,R},w);
    DFF d1(w,clock,reset,Q,QB);
endmodule

//second imp submodule
module DFF(D,clock,reset,Q,QB);
    input D,clock,reset;
    output reg Q,QB;
     
    always@(posedge clock , negedge reset)
    begin
    //working of asynchronous active low reset
        if(~reset)
            begin
                Q=0;QB=1;
            end
        else
    //otherwise normal working of D flip flop
            begin
                Q=D;
                QB=~Q;
            end
    end
endmodule
//a simple 4x1 mux using terenary logic
module mux41(
    input [3:0] D,
    input [1:0] S,
    output O
    );
    //combinational implementation of 4:1 logic
    assign O=S[1]? (S[0] ? D[3]:D[2] ):(S[0] ? D[1]:D[0] );
endmodule
