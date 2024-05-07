`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Auburn University ELEC5200
// Engineer: Courtney Stewart
// 
// Design Name: CPU Project Part 5
// Module Name: instructionMemory
//////////////////////////////////////////////////////////////////////////////////


module instructionMemory(
    input clk,
    input [15:0] PCIn,
    output reg [15:0] instruction
    );
    
    (* ram_style = "block" *) reg [15:0] mem [65535:0];

    initial begin
        $readmemh ("insMem.mem", mem);
        instruction = 16'h0004;
    end

    always @(negedge clk) begin
        instruction <= mem[PCIn];
    end
    
endmodule
