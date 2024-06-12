
class alu_sequencer extends uvm_sequencer#(alu_sequence_item);
  //declare macros which are usefull
  `uvm_component_utils(alu_sequencer)
  
  
  //write a contructor 
  function new(string name = "alu_sequencer", uvm_component parent);
    
    //call super
    super.new(name, parent);
    
    //`uvm_info("Tag", "Display Message", verbosity level)
    `uvm_info("SEQUENCER_CALSS", "Inside constructor", UVM_HIGH)
    
  endfunction 
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SEQUENCER_CLASS", "Build Phase", UVM_HIGH)
    
  endfunction: build_phase
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SEQUENCER_CLASS", "Connect Phase", UVM_HIGH)
    
  endfunction: connect_phase
  
  //sequencer dont have run phase
  
endclass: alu_sequencer
 
