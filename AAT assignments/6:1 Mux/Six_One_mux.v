module Six_One_mux(
input [5:0] In,
input [2:0] Sel,
output Out);

//declaration of wires
wire m1,m2,m3;
wire n1,n2;

//the first layer of the multiplexer
Mux21 a(In[0],In[1],Sel[0],m1);
Mux21 b(In[2],In[3],Sel[0],m2);
Mux21 c(In[4],In[5],Sel[0],m2);

//the second layer of the multiplexer
Mux21 a(m1,m2,Sel[1],n1);
Mux21 a(m2,m3,Sel[1],n2);

//the last and the final layer of the mux
Mux21 a(n1,n2,Sel[2],Out);

endmodule

//defining Mux21 module seperately
module Mux21(A,B,Sel,Out);
input A,B,Sel;
output Out;
// Main logic of the mux
assign Out = Sel ? B: A;
endmodule
