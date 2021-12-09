// Problem:
//         Code all basic gates using 2x1 Muxes. The gates to be coded are: AND, OR, NOT,NAND, XOR, XNOR,

module Mux2Gates(A,B,O);
input A,B;
output [5:0] O;

AND  a(A,B,O[0]);
OR   b(A,B,O[1]);
NOT  c(A,O[2]);
NAND d(A,B,O[3]);
XOR  e(A,B,O[4]);
XNOR f(A,B,O[5]);

endmodule

module AND(A,B,o1);
input A,B;
output o1;
//actual logic via mux
Mux21 u(0,A,B,o1);

endmodule

module OR(A,B,o2);
input A,B;
output o2;
//actual OR logic using mux
Mux21 u(B,1,A,o2);
endmodule

module NOT(A,o3);
input A;
output o3;
Mux21 u(1,0,A,o3);
endmodule

module NAND(A,B,o4);
input A,B;
output o4;
//actual NAND logic implementation
Mux21 u(1,~B,A,o4);
//assign o4 = A? ~B:1;
endmodule

module XOR(A,B,o5);
input A,B;
output o5;
//Xor logic using MUx
Mux21 u(B,~B,A,o5);
endmodule

module XNOR(A,B,o6);
input A,B;
output o6;
Mux21 u(~B,B,A,o6);
endmodule
