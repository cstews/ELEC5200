`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Auburn University ELEC5200
// Engineer: Courtney Stewart
// 
// Design Name: CPU Project Part 3
// Module Name: shiftUnit
//////////////////////////////////////////////////////////////////////////////////


module shiftUnit(
    input [3:0] bits11to8,
    input [3:0] bits15to12,
    input shiftFlag,
    output reg [15:0] dataOut
    );
    
    reg [7:0] immValue;
    
    always @(*)
        begin
        
            assign immValue = {bits15to12, bits11to8};
        
            if (shiftFlag)
                dataOut = immValue << 8;
        
            else 
                dataOut = immValue;
            end
    
endmodule
