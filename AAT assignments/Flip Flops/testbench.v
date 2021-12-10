//module JKFF_tb;

//wire a, b;
//reg clk,J,K,reset,set;

//JKFF uut(clk,J,K,reset,set,a,b);

//initial begin
//    clk = 0;
//    reset = 1;
//    set = 0;
//    J = 0; K= 0;
//end 

//always #5 clk = ~clk;

//initial begin
//    reset=0; #5 reset = 1;
//    //just testing   jk values
//    #1 J = 0;K = 1;
//    #1 K = 0;
//    //using the synchronous set once
//    #4 set = 1;
//    #5 set = 0;
//    //testing the other jk values
//    #5 K =1 ;
//    #8 J =1; K = 0;
//    //setting the toggling condition
//    #5 J =1 ; K =1;
//    #7 reset = 0; #5 reset =1 ;
//    #5 J = 0; K= 0;
//    #70 $stop;
//end

//endmodule

module TFF_tb;

wire a, b;
reg clk,T,reset,set;

TFF uut(clk,T,reset,set,a,b);

initial begin
    clk = 0;
    reset = 1;
    set = 0;
    T = 0;
end 

always #5 clk = ~clk;

initial begin
    reset = 0; #5 reset =1;
    #1 T = 1;
    #1 T = 0;
    //using the synchronous set once
    #4 set = 1;
    #4 set = 0;
    //testing the other T values
    #8 T =1;
    #5 T =0 ;
    #10 reset = 0; #15 reset =1 ;
    #5 T=1;
    #70 $stop;
end
endmodule

