module tb_reg_n;
  parameter WIDTH_TB = 8;
  logic clk_tb=0;
  logic rst_tb;
  logic [WIDTH_TB-1:0] d_tb, q_tb;
 
  // Instanciando registro
  reg_n #(.WIDTH(WIDTH_TB)) dut (
    .clk(clk_tb),
    .rst(rst_tb),
    .d(d_test),
    .q(q_test)
  );
  
  initial begin
	 forever #5 clk_tb = ~clk_tb; 
  end 
  
  initial begin 
    $dumpfile("wave.vcd");
    $dumpvars (0, tb_reg_n);
    
    // 
      rst_tb = 0; 
      en_tb = 0;
      d_tb = '0;
    
       #15 rst_tb = 1; // Reset activo
    
    // Test 1
    
      #10
      d_tb = 8'hAA; // Carga un valor
      en_tb = 1; // Habilita la carga
      
    // Test 2

      #10
      d_tb = 8'h55; // Carga un valor
      en_tb = 0; // Habilita la carga    
    
    // Test 3
    
    $finish;
  end
endmodule