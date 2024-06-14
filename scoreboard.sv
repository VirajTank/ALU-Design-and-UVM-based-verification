
class alu_scoreboard extends uvm_test;
  //declare macros which are usefull
  `uvm_component_utils(alu_scoreboard)
  
  uvm_analysis_imp #(alu_sequence_item, alu_scoreboard) scoreboard_port;
  
  alu_sequence_item transactions[$];

  
  //write a contructor 
  function new(string name = "alu_scoreboard", uvm_component parent);
    
    //call super
    super.new(name, parent);
    
    //`uvm_info("Tag", "Display Message", verbosity level)
    `uvm_info("TEST_CALSS", "Inside constructor", UVM_HIGH)
    
  endfunction:new
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCOREBOARD_CLASS", "Build Phase", UVM_HIGH)
    
    scoreboard_port = new("scoreboard_port",this);
  endfunction: build_phase
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCOREBOARD_CLASS", "Connect Phase", UVM_HIGH)
    
  endfunction: connect_phase
  
  //write Method
  function void write(alu_sequence_item item);
    transactions.push_back(item);
    
  endfunction: write
  
  
  
  //run phase
  //all the other phase are function only run phase is task because run phase can consume time and it can have time cosuming statements
  //functions cannot include any time consuming statements
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCOREBOARD_CLASS", "Run Phase", UVM_HIGH)
    
    forever begin
      // get the packet
      // generate expected value 
      // compare it with actual value 
      // score the transactions accordingly
      
      alu_sequence_item	curr_trans;
      wait((transactions.size() != 0));
      
      curr_trans = transactions.pop_front();
      compare(curr_trans);
      
    end
    
  endtask: run_phase
  
  task compare(alu_sequence_item curr_trans);
    
    logic [7:0] expected;
    logic [7:0] actual;
    
    case(curr_trans.op_code)
      
      0: begin // A + B
        expected = curr_trans.a + curr_trans.b;
      end
      1: begin // A - B
        expected = curr_trans.a - curr_trans.b;
      end
      2: begin // A * B
        expected = curr_trans.a * curr_trans.b;
      end
      3: begin // A / B
        expected = curr_trans.a / curr_trans.b;
      end
      
    endcase
    actual = curr_trans.result;
    
    if(actual != expected) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed actual = %d while expected = %d",actual,expected))
    end
    else begin
      `uvm_info("COMPARE", $sformatf("Transaction Passed actual = %d while expected = %d",actual,expected),UVM_LOW)
    end
    
    
  endtask:compare
  
endclass: alu_scoreboard
 
    
// all other classes will have container for component class so we can save this as a template
