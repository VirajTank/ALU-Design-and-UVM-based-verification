
class alu_driver extends uvm_driver#(alu_sequence_item);
  //declare macros which are usefull
  `uvm_component_utils(alu_driver)
  
  virtual alu_interface vif;
  alu_sequence_item item;
  
  //write a contructor 
  function new(string name = "alu_driver", uvm_component parent);
    
    //call super
    super.new(name, parent);
    
    //`uvm_info("Tag", "Display Message", verbosity level)
    `uvm_info("DRIVER_CALSS", "Inside constructor", UVM_HIGH)
    
  endfunction 
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER_CLASS", "Build Phase", UVM_HIGH)
    
    if(!(uvm_config_db #(virtual alu_interface)::get(this,"*","vif",vif))) begin
      `uvm_error("DRIVER_CLASS","Failed to get vif from config_db")
    end
    
  endfunction: build_phase
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER_CLASS", "Connect Phase", UVM_HIGH)
    
  endfunction: connect_phase
  
  //run phase
  //all the other phase are function only run phase is task because run phase can consume time and it can have time cosuming statements
  //functions cannot include any time consuming statements
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("DRIVER_CLASS","inside run phase", UVM_HIGH)
    
    forever begin
      item = alu_sequence_item::type_id::create("item");
      seq_item_port.get_next_item(item);
      //logic
      drive(item);
      seq_item_port.item_done();
      
    end
    
  endtask: run_phase
  
  //drive task
  task drive(alu_sequence_item item);
    @(posedge vif.clock)
    vif.reset <= item.reset;
    vif.a <= item.a;
    vif.b <= item.b;
    vif.op_code <= item.op_code;
    
  endtask:drive
  
endclass: alu_driver
 
