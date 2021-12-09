module mux2gate_tb;

//declaring all wires and inputs
reg A,B;
wire And, Or, Not,Nand,Xor,Xnand;

// initializing all gates
Mux2Gates uut(A,B,{And,Or,Not,Nand,Xor,Xnand});

initial begin
    A = 0; B= 0;
    //testing for all cases
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 1; B = 1;
    //stopping all simulations after a while
    #10 $stop;
end
endmodule



