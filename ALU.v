`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Auburn University ELEC5200
// Engineer: Courtney Stewart
// 
// Design Name: CPU Project Part 3
// Module Name: ALU
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input [15:0] valueBits11to8,
    input [15:0] valueBits15to12,
    input [2:0] ALUOp,
    output reg [15:0] dataOut
    );
    
    always @(*)
        case(ALUOp)
            3'b000: dataOut = valueBits11to8 + valueBits15to12;
            
            3'b001: dataOut = valueBits11to8 - valueBits15to12;
            
            3'b010: dataOut = valueBits11to8 & valueBits15to12;
            
            3'b011: dataOut = valueBits11to8 | valueBits15to12;
            
            3'b100: dataOut = valueBits11to8 ^ valueBits15to12;
            
            3'b101: dataOut = valueBits11to8 << valueBits15to12;        //lsl
            
            3'b110: dataOut = valueBits11to8 >> valueBits15to12;        //lsr
            
            3'b111: dataOut = valueBits11to8 >>> valueBits15to12;       //asr
            
            default: dataOut = valueBits11to8 + 0;
            
        endcase
    
endmodule
