module Six_One_mux(
input [5:0] In,
input [2:0] Sel,
output Out);

wire m1,m2,m3;
wire n1;

//the first layer of the multiplexer
Mux21 a(In[0],In[1],Sel[0],m1);
Mux21 b(In[2],In[3],Sel[0],m2);
Mux21 c(In[4],In[5],Sel[0],m3);

//the second layer of the multiplexer
Mux21 d(m1,m2,Sel[1],n1);
//the last and the final layer of the mux
Mux21 f(n1,m3,Sel[2],Out);

endmodule

module Mux21(A,B,Sel,Out);
input A,B,Sel;
output Out;
// Main logic of the mux
assign Out = Sel ? B: A;
endmodule
