module mux6_tb;
reg [5:0]D;reg [2:0]s;
reg clk=0;
wire O;
//initializing the mux
Six_One_mux uut(D,s,O);
    
initial
    begin
    //setting the inital values of the inputs
        D=6'b111010;
        s=3'd0;#10;
        s=3'd1;#10;
        s=3'd2;#10;
        s=3'd3;#10;
        s=3'd4;#10;
    //doing a small change in input
        D=6'b000100;#5;
        s=3'd5;#10;
        s=3'd6;#10;
 
    end
    
endmodule
