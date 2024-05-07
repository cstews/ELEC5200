`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Auburn University ELEC5200
// Engineer: Courtney Stewart
// 
// Design Name: CPU Project Part 3
// Module Name: PC
//////////////////////////////////////////////////////////////////////////////////

module PC(
    input clk,
    input reset,
    input [15:0] PCin,
    output reg [15:0] PCout
    );
    
    initial begin
            PCout <= 16'h0000;
    end
    
    always @(posedge clk) begin
        if (reset)
            PCout <= 16'h0040;
        else
            PCout <= PCin;
    end
        
endmodule
