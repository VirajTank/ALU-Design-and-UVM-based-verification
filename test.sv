
class alu_test extends uvm_test;
  //declare macros which are usefull
  `uvm_component_utils(alu_test)
  
  alu_env env;
  alu_test_sequence test_seq;
  alu_base_sequence reset_seq;
  
  //write a contructor 
  function new(string name = "alu_test", uvm_component parent);
    
    //call super
    super.new(name, parent);
    
    //`uvm_info("Tag", "Display Message", verbosity level)
    `uvm_info("TEST_CALSS", "Inside constructor", UVM_HIGH)
    
  endfunction 
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "Build Phase", UVM_HIGH)
    
    env = alu_env::type_id::create("env", this);
    
  endfunction: build_phase
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS", "Connect Phase", UVM_HIGH)
    
    //connect monitor with scoreboard
    
  endfunction: connect_phase
  
  //run phase
  //all the other phase are function only run phase is task because run phase can consume time and it can have time cosuming statements
  //functions cannot include any time consuming statements
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("TEST_CLASS", "Run Phase", UVM_HIGH)
    
    phase.raise_objection(this);
    
    //strat our sequences
    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;
    
    repeat(25) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
      test_seq.start(env.agnt.seqr);
      #10;
    end
    phase.drop_objection(this);
    
    
  endtask: run_phase
  
endclass: alu_test
 
    
// all other classes will have container for component class so we can save this as a template
