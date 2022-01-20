module tb;
  //testbench for both synchronous and asynchronous mod5counter
  reg Clk, Reset;
wire [2:0] Out;

initial begin
   Clk=0;Reset=1;
   #5 Reset = 0;
   #50 Reset =1; #5 Reset = 0;
   end

always #3 Clk = ~Clk;

Mod5Counter_Sync a(Clk,Reset,Out);
Mod5Counter_Async b(Clk,Reset,Out);
//EightCounter a1(Clk,Reset,Out);

initial #100 $stop;
endmodule
