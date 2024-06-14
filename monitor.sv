
class alu_monitor extends uvm_monitor;
  //declare macros which are usefull
  `uvm_component_utils(alu_monitor)
  alu_sequence_item item;
  virtual alu_interface vif;
  
  uvm_analysis_port #(alu_sequence_item) monitor_port;
  
  //write a contructor 
  function new(string name = "alu_monitor", uvm_component parent);
    
    //call super
    super.new(name, parent);
    
    //`uvm_info("Tag", "Display Message", verbosity level)
    `uvm_info("MONITOR_CALSS", "Inside constructor", UVM_HIGH)
    
  endfunction 
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR_CLASS", "Build Phase", UVM_HIGH)
    
    monitor_port = new("monitor_port",this);

    if(!(uvm_config_db #(virtual alu_interface)::get(this,"*","vif",vif))) begin
      `uvm_error("MONITOR_CLASS","Failed to get vif from config_db")
    end
    
    
  endfunction: build_phase
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR_CLASS", "Connect Phase", UVM_HIGH)
    
  endfunction: connect_phase
  
  //run phase
  //all the other phase are function only run phase is task because run phase can consume time and it can have time cosuming statements
  //functions cannot include any time consuming statements
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("MONITOR_CLASS","Inside Run Phase", UVM_HIGH)
    //logic
    forever begin
      item = alu_sequence_item::type_id::create("item");
      
      wait(!vif.reset);
      
      //sample the inputs
      @(posedge vif.clock);
      item.a = vif.a;
      item.b = vif.b;
      item.op_code = vif.op_code;
      
      //sample the outputs
      @(posedge vif.clock);
      item.result = vif.result;
      
      
      //send item to scoreboard
      monitor_port.write(item);
      
    end
        
  endtask: run_phase
  
endclass: alu_monitor
 
