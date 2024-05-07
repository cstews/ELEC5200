`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Auburn University ELEC5200
// Engineer: Courtney Stewart
// 
// Design Name: CPU Project Part 3
// Module Name: controlUnit
//////////////////////////////////////////////////////////////////////////////////


module controlUnit(
    input [3:0] opcode,
    output reg [3:0] branchUnitSignals,
    output reg shiftUnit,
    output reg dataMemoryFlag,
    output reg [2:0] ALUOp,
    output reg [1:0] mainSelect,
    output reg resetFlag
    );
    
    always @(*)
    case(opcode)
        4'b0000:    //stor
            begin
                branchUnitSignals = 4'b1000;
                shiftUnit = 1'bx;
                dataMemoryFlag = 1'b1;
                ALUOp = 3'bxxx;
                mainSelect = 2'b00;
                resetFlag = 1'b0;
            end
        
        4'b0001:    //load
            begin
                branchUnitSignals <= 4'b1000;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'bxxx;
                mainSelect <= 2'b00;
                resetFlag = 1'b0;
            end
        
        4'b0010:    //lui
            begin
                branchUnitSignals <= 4'b1000;
                shiftUnit <= 1'b1;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'bxxx;
                mainSelect <= 2'b01;
                resetFlag = 1'b0;
            end
            
        4'b0011:    //lli        
            begin
                branchUnitSignals <= 4'b1000;
                shiftUnit <= 1'b0;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'bxxx;
                mainSelect <= 2'b01;
                resetFlag = 1'b0;
            end
        
        4'b0100:    //add
            begin
                branchUnitSignals <= 4'b1000;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'b000;
                mainSelect <= 2'b10;
                resetFlag = 1'b0;
            end
        
        4'b0101:    //sub
            begin
                branchUnitSignals <= 4'b1000;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'b001;
                mainSelect <= 2'b10;
                resetFlag = 1'b0;
            end
        
        4'b0110:    //andl           
            begin
                branchUnitSignals <= 4'b1000;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'b010;
                mainSelect <= 2'b10;
                resetFlag = 1'b0;
            end
        
        4'b0111:    //orl        
            begin
                branchUnitSignals <= 4'b1000;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'b011;
                mainSelect <= 2'b10;
                resetFlag = 1'b0;
            end
        
        4'b1000:    //xor            
            begin
                branchUnitSignals <= 4'b1000;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'b100;
                mainSelect <= 2'b10;
                resetFlag = 1'b0;
            end
        
        4'b1001:    //lsl        
            begin
                branchUnitSignals <= 4'b1000;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'b101;
                mainSelect <= 2'b10;
                resetFlag = 1'b0;
            end
        
        4'b1010:   //lsr         
            begin
                branchUnitSignals <= 4'b1000;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'b110;
                mainSelect <= 2'b10;
                resetFlag = 1'b0;
            end
        
        4'b1011:    //asr
            begin
                branchUnitSignals <= 4'b1000;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'b111;
                mainSelect <= 2'b10;
                resetFlag = 1'b0;
            end
        
        4'b1100:    //beq
            begin
                branchUnitSignals <= 4'b0000;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'bxxx;
                mainSelect <= 2'bxx;
                resetFlag = 1'b0;
            end
        
        4'b1101:    //blt
            begin
                branchUnitSignals <= 4'b0010;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'bxxx;
                mainSelect <= 2'bxx;
                resetFlag = 1'b0;
            end
        
        4'b1110:    //bge
            begin
                branchUnitSignals <= 4'b0100;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'bxxx;
                mainSelect <= 2'bxx;
                resetFlag = 1'b0;
            end
        
        4'b1111:    //stop
            begin
                branchUnitSignals <= 4'b0001;
                shiftUnit <= 1'bx;
                dataMemoryFlag <= 1'b0;
                ALUOp <= 3'bxxx;
                mainSelect <= 2'bxx;
                resetFlag = 1'b1;
            end
    
    endcase
    
    
endmodule
