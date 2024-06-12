
// object class

class alu_base_sequence extends uvm_sequence;
  `uvm_object_utils(alu_base_sequence)
  
  function new(string name ="alu_base_sequence");
    super.new(name);
    `uvm_info("BASE_SEQUENCE", "inside constructor", UVM_HIGH)
    
  endfunction: new
  
  task body();
    `uvm_info("BASE_SEQUENCE", "inside body task", UVM_HIGH)
    
    
  endtask: body
  
endclass: alu_base_sequence
