//object class

class alu_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(alu_sequence_item)
  
  //instantiation
  
  //to generate random values use rand
  //input
  rand logic reset;
  rand logic [7:0] a, b;
  rand logic [3:0] op_code;
  
  //output
  logic [7:0] result;
  bit carry_out;
  
  function new(string name = "alu_sequence_item");
    super.new(name);
    
  endfunction: new
  
    
endclass: alu_sequence_item 
