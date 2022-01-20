module FourBit_ShiftReg(
input Clock,Reset,SerialIn, //basic clock and reset with serial input
input [1:0] Select, //selection variable
input [3:0] Block, //parallel load
output reg [3:0] Y //output
);

initial Y <= 4'b1111;
always@(posedge Clock,posedge Reset)
    begin
        if(Reset)
            Y <= 4'b0;
        //output depending on the select lines
        case(Select)
        
        2'b00: //previous state
             Y <= Y;
        2'b01: //serial shift left
               begin
               Y <= Y>>1;
               Y[3]=SerialIn;
               end
        2'b10: //serial shift right
               begin
               Y<= Y<<1; 
               Y[0]=SerialIn;
               end
        2'b11: //Parallel Input;
             Y <= Block;
        default: Y <= Y;
        
        endcase
    end
 
endmodule

