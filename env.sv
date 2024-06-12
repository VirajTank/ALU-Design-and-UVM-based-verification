

class alu_env extends uvm_env;
  //declare macros which are usefull
  `uvm_component_utils(alu_env)
  
  
  //write a contructor 
  function new(string name = "alu_env", uvm_component parent);
    
    //call super
    super.new(name, parent);
    
    //`uvm_info("Tag", "Display Message", verbosity level)
    `uvm_info("ENV_CALSS", "Inside constructor", UVM_HIGH)
    
  endfunction 
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV_CLASS", "Build Phase", UVM_HIGH)
    
  endfunction: build_phase
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV_CLASS", "Connect Phase", UVM_HIGH)
    
  endfunction: connect_phase
  
  //run phase
  //all the other phase are function only run phase is task because run phase can consume time and it can have time cosuming statements
  //functions cannot include any time consuming statements
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    //logic
    
  endtask: run_phase
  
endclass: alu_env
 
