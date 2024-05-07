`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Auburn University ELEC5200
// Engineer: Courtney Stewart
//
// Design Name: Part 5, top level with memory
// Module Name: datapathAndControl
//////////////////////////////////////////////////////////////////////////////////


module datapathAndControl(
    input reset,
    input clk
    );
    
    wire [15:0] instruction;
       
    //wires for Control block
    wire [3:0] ctrlToBranchSig;
    wire ctrlToShiftSig;
    wire ctrlToDMSig;
    wire [2:0] ctrlToALUSig;
    wire [1:0] ctrlToMainSelectSig;
    wire ctrlToRegReset;
    
    //wires for PC
    wire [15:0] branchToPCIn;
    wire [15:0] PCToInsMemOut;
    wire [15:0] PCToBranchOut;
    
    //wires from register file
    wire [15:0] rFOutValBit11to8;
    wire [15:0] rFOutValBit15to12;
    
    //wires for inputs of main select
    wire [15:0] shiftToMSelect;
    wire [15:0] dMToShiftSelect;
    wire [15:0] ALUToShiftSelect;
    
    //wire for output of main select
    wire [15:0] mSelectToRegFile;
    
    PC PC(.clk(clk), .reset(ctrlToRegReset), .PCin(branchToPCIn), .PCout(PCToBranchOut));
    
    controlUnit controlUnit(.opcode(instruction[3:0]), .branchUnitSignals(ctrlToBranchSig), .shiftUnit(ctrlToShiftSig), .dataMemoryFlag(ctrlToDMSig), 
        .ALUOp(ctrlToALUSig), .mainSelect(ctrlToMainSelectSig), .resetFlag(ctrlToRegReset));
    
    registerFile registerFile(.clk(clk), .reset(ctrlToRegReset), .instruction(instruction), .selectedValue(mSelectToRegFile), .valueBits11to8(rFOutValBit11to8), 
        .valueBits15to12(rFOutValBit15to12));
        
    branchUnit branchUnit (.controlSignals(ctrlToBranchSig), .PCin(PCToBranchOut), .valueBits11to8(rFOutValBit11to8), .valueBits15to12(rFOutValBit15to12),
        .PCout(branchToPCIn));
        
    shiftUnit shiftUnit (.bits11to8(instruction[11:8]), .bits15to12(instruction[15:12]), .shiftFlag(ctrlToShiftSig), .dataOut(shiftToMSelect));
    
    ALU ALU (.valueBits11to8(rFOutValBit11to8), .valueBits15to12(rFOutValBit15to12), .ALUOp(ctrlToALUSig), .dataOut(ALUToShiftSelect));
    
    mainSelect mainSelect (.shiftUnitValue(shiftToMSelect), .dataMemoryValue(dMToShiftSelect), .ALUValue(ALUToShiftSelect), .selectSignal(ctrlToMainSelectSig), 
        .valueOut(mSelectToRegFile));
        
    dataMemory dataMemory (.clk(clk), .dataReg(rFOutValBit11to8), .address(rFOutValBit15to12), .writeFlag(ctrlToDMSig), .data(dMToShiftSelect));
    
    instructionMemory instructionMemory (.clk(clk), .PCIn(PCToBranchOut), .instruction(instruction));
endmodule