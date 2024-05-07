`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Auburn University ELEC5200
// Engineer: Courtney Stewart
// 
// Design Name: CPU Project Part 3
// Module Name: registerFile
//////////////////////////////////////////////////////////////////////////////////

module registerFile(
    input clk,
    input reset,
    input [15:0] instruction,           //from instruction memory block
    input [15:0] selectedValue,         //from mainSelect mux
    output reg [15:0] valueBits7to4,
    output reg [15:0] valueBits11to8,       
    output reg [15:0] valueBits15to12
    );
    
    reg [15:0] registers [0:15];        //set up 16 16-bit registers
    
    wire [3:0] op;
    wire [3:0] bits7to4;
    wire [3:0] bits11to8;
    wire [3:0] bits15to12;
    
    assign op = instruction[3:0];
    assign bits7to4 = instruction[7:4];
    assign bits11to8 = instruction[11:8];
    assign bits15to12 = instruction[15:12];
    
    integer i;
    
    initial begin       //initialize all registers to equal zero
        for (i = 0; i < 16; i = i + 1)
            begin
                registers[i] <= 16'b0;
            end
    end


    always @(posedge clk)
        begin
            if (reset)      //if reset is detected, clear all registers
                begin
                    for (i = 0; i < 16; i = i + 1)
                        registers[i] <= 16'b0;
                end
        
            else begin
                registers[0] = 16'b0;
                if (op >= 4'b0010 && op <= 4'b1011)     //if R-type or I-type need to write to bits 7:4
                    begin
                        registers[bits7to4] = selectedValue;
                    end
                else if (op == 4'b0001)                             //M-type and load instruction
                        begin                                   
                            registers[bits15to12] = selectedValue;
                        end
                    end                                             //if B-type then nothing should write to registers
            end
        
        always @(*)
            begin
                case(bits7to4)
                    //0: valueBits7to4 = registers[0];
                    1: valueBits7to4 = registers[1];
                    2: valueBits7to4 = registers[2];
                    3: valueBits7to4 = registers[3];
                    4: valueBits7to4 = registers[4];
                    5: valueBits7to4 = registers[5];
                    6: valueBits7to4 = registers[6];
                    7: valueBits7to4 = registers[7];
                    8: valueBits7to4 = registers[8];
                    9: valueBits7to4 = registers[9];
                    10: valueBits7to4 = registers[10];
                    11: valueBits7to4 = registers[11];
                    12: valueBits7to4 = registers[12];
                    13: valueBits7to4 = registers[13];
                    14: valueBits7to4 = registers[14];
                    15: valueBits7to4 = registers[15];
                endcase
            
                case(bits11to8)
                    //0: valueBits11to8 = registers[0];
                    1: valueBits11to8 = registers[1];
                    2: valueBits11to8 = registers[2];
                    3: valueBits11to8 = registers[3];
                    4: valueBits11to8 = registers[4];
                    5: valueBits11to8 = registers[5];
                    6: valueBits11to8 = registers[6];
                    7: valueBits11to8 = registers[7];
                    8: valueBits11to8 = registers[8];
                    9: valueBits11to8 = registers[9];
                    10: valueBits11to8 = registers[10];
                    11: valueBits11to8 = registers[11];
                    12: valueBits11to8 = registers[12];
                    13: valueBits11to8 = registers[13];
                    14: valueBits11to8 = registers[14];
                    15: valueBits11to8 = registers[15];
                endcase
            
                case(bits15to12)
                    //0: valueBits15to12 = registers[0];
                    1: valueBits15to12 = registers[1];
                    2: valueBits15to12 = registers[2];
                    3: valueBits15to12 = registers[3];
                    4: valueBits15to12 = registers[4];
                    5: valueBits15to12 = registers[5];
                    6: valueBits15to12 = registers[6];
                    7: valueBits15to12 = registers[7];
                    8: valueBits15to12 = registers[8];
                    9: valueBits15to12 = registers[9];
                    10: valueBits15to12 = registers[10];
                    11: valueBits15to12 = registers[11];
                    12: valueBits15to12 = registers[12];
                    13: valueBits15to12 = registers[13];
                    14: valueBits15to12 = registers[14];
                    15: valueBits15to12 = registers[15]; 
                endcase   
            end
        
endmodule