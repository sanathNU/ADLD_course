// Main module code for sequence generation
module Sequence_Generator( 
input Clock,
input Reset,
output reg [2:0]  Out);

//Declaring the present and next state registers
reg [2:0] PS, NS;

// assigning names to the parameters
parameter S0 = 3'b000, S1 = 3'b011, S2 = 3'b010, S3 = 3'b101, S4 = 3'b111; 

//defining the next state block
always @(PS)
    begin
        case(PS)
        S0: NS = S1;
        S1: NS = S2;
        S2: NS = S3;
        S3: NS = S4;
        S4: NS = S0;
        default: NS = S0;
        endcase
    end
    
//defining the output block
always @(posedge Clock, posedge Reset)
    begin
        if(Reset)
        begin
        PS <= S0;
        Out <= PS;
        end
        else
        begin
        PS <= NS;
     Out <= PS;end
    end

endmodule
