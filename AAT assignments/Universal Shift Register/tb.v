module tb;
//Universal Shift Register testing

reg Clk,Reset,serialIn;
reg [1:0] sel;
reg [3:0] BlockIn;
wire [3:0] Out;

FourBit_ShiftReg s1(Clk,Reset,serialIn,sel,BlockIn,Out);

initial begin
    Clk=0;Reset=0;serialIn=1;
    sel=2'b00; BlockIn=4'b1001;
    #1 Reset =1;
    #10 Reset=0; #5 sel=2'b01;#10 serialIn=0;
    #20 sel=2'b00;serialIn=1;
    #10 serialIn=1;sel=2'b10;
    #10 serialIn=0;
    #20 sel=2'b11; #10 BlockIn=4'b1101;
    end

always #5 Clk = ~Clk;
initial #200 $stop;    
endmodule
