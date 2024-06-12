// ALU Verification using UVM 
// Date :- 12 June 2024

`timescale 1ns/1ns

import uvm_pkg::*;				//import uvm based pakages
`include "uvm_macros.svh"		//import uvm macros to be used 

  //---------------------
  // include files
  //---------------------

//order of classes included is very important
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"


module top;
  
  //---------------------
  // instantiation
  //---------------------
  
  logic clock;
  
  alu_interface intf(.clock(clock));
  
  //DUT instantiation
  alu dut(
    .clock(intf.clock),
    .reset(intf.reset),	
    .A(intf.a),
    .B(intf.b),
    .ALU_Sel(intf.op_code),
    .ALU_Out(intf.result),
    .CarryOut(intf.carry_out)
  );
  
  //start the test
  initial begin
    run_test();  
  end
  
  
  //Clock instantiation
  initial begin 
    clock = 0;
    #5;
    forever begin
      clock = ~clock;
      #2;
    end
  end 
  
  
  //safety check
  //so that after 5000 the clock stops generating and the system doesnt hangs
  initial begin 
    #5000;
    $display("Ran out of clock cycles !!");
    $finish();
  end
  
  
  //to observe waveforms
  initial begin
    $dumpfile("d.vcd");
    $dumpvars();
  end
  
  
endmodule: top
