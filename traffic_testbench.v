`timescale 1ns/1ns   
module traffic_testbench;
	reg clk,RST_n;
	wire [2:0]test_main,test_auxiliary;
	initial 
	begin 
		clk=1;
		RST_n=0;
	
		#5 RST_n=1;
		#500 RST_n=0;
		#15 RST_n=1;
		
	end
	
	always 	#5 clk=~clk;
	traffic_light test1(.clk(clk),.RST_n(RST_n),.light_main(test_main),.light_auxiliary(test_auxiliary));

endmodule