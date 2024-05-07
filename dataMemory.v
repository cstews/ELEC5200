`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Auburn Unviersty ELEC5200
// Engineer: Courtney Stewart
// 
// Design Name: CPU Project Part 5
// Module Name: dataMemory
//////////////////////////////////////////////////////////////////////////////////


module dataMemory(
    input clk,
    input [15:0] dataReg,
    input [15:0] address,
    input writeFlag,
    output reg [15:0] data
    );
    
    (* ram_style = "block" *) reg [15:0] mem [65535:0];

    initial begin
        $readmemh ("dataMem.mem", mem);
        data = mem[0];
    end

    always @(posedge clk) begin
        if (writeFlag) begin
            mem[address] <= dataReg;
        end
    end

    always @(negedge clk) begin
        data <= mem[address];
    end
    
endmodule