`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Auburn University ELEC5200
// Engineer: Courtney Stewart
// 
// Design Name: CPU Project Part 3
// Module Name: mainSelect
//////////////////////////////////////////////////////////////////////////////////


module mainSelect(
    input [15:0] shiftUnitValue,
    input [15:0] dataMemoryValue,
    input [15:0] ALUValue,
    input [1:0] selectSignal,
    output reg [15:0] valueOut
    );
    
    always @(*)
        case(selectSignal)
            2'b00:  //dataMemoryValue
                valueOut <= dataMemoryValue;
            
            2'b01:  //shiftUnitValue
                valueOut <= shiftUnitValue;
            
            2'b10:  //ALUValue
                valueOut <= ALUValue;
    
        endcase
        
endmodule
