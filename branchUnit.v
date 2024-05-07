`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Auburn University ELEC5200
// Engineer: Courtney Stewart
// 
// Design Name: CPU Project Part 3
// Module Name: branchUnit
//////////////////////////////////////////////////////////////////////////////////


module branchUnit(
    input [3:0] controlSignals,
    input [15:0] PCin,
    input [15:0] valueBits11to8,
    input [15:0] valueBits15to12,
    output reg [15:0] PCout
    );
    
    always @(*)
        case(controlSignals)
            4'b0000:        //beq
                begin
                    if (valueBits11to8 == 0)
                        begin
                            PCout <= valueBits15to12;
                        end
                end
        
            4'b0001:        //halt function
                begin
                    PCout <= 0;
                end

            4'b0010:        //blt
                begin
                    if (valueBits11to8 < 0)
                        begin
                            PCout <= valueBits15to12;
                        end
                end
            
            4'b0100:        //bge
                begin
                    if (valueBits11to8 >= 0)
                        begin
                            PCout <= valueBits15to12;
                        end
                end
            
            
            4'b1000:        //base case, increment PC
                begin
                    PCout <= PCin + 1;
                end

            endcase
        
    
endmodule
