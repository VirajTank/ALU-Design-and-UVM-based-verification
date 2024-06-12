//interface will have same signal as DUT
//clock is defined as a port as it is coming from top module

interface alu_interface(input logic clock);
	
  /*.clock(),
    .reset(),	
    .A(),
    .B(),
    .ALU_Sel(),
    .ALU_Out(),
    .CarryOut() */
  
  logic reset;
  logic [7:0] a, b;
  logic [3:0] op_code;
  logic [7:0] result;
  bit carry_out;
  
endinterface: alu_interface

// now to use this interface file we need to include this in include file section in testbench.sv
