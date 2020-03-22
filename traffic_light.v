module traffic_light(clk,RST_n,light_main,light_auxiliary);
	//light_main ?????light_auxiliary????
	input clk,RST_n;
	output reg [2:0]light_main,light_auxiliary;
	parameter Green=3'b100;
	parameter Yellow=3'b010;
	parameter Red=3'b001;
	parameter Green_main_time=5'd15;
	parameter Yellow_main_time=5'd3;
	parameter Red_main_time=5'd10;
	parameter Green_auxiliary_time=5'd7;	
	parameter Yellow_auxiliary_time=5'd3;	
	parameter Red_auxiliary_time=5'd18;	
	//reg count;
	reg [4:0]light_main_time;
	reg [4:0]light_auxiliary_time;


	initial 
	begin  // /???????????
			light_main<=Green;
			light_main_time<=Green_main_time;
			light_auxiliary<=Red;
			light_auxiliary_time<= Red_auxiliary_time;
	end 


	always@(posedge clk )
		if (!RST_n)
		
		begin
			light_main<=Green;
			light_main_time<=Green_main_time+1;//?1??????rst???????
			light_auxiliary<=Red;
			light_auxiliary_time<= Red_auxiliary_time+1;
		end 

		else 

		begin
		if (light_main_time==1'b1)
			case(light_main)
				Green : 
				begin
					light_main<=Yellow;light_main_time<=Yellow_main_time;
				end
				Yellow:
				begin 
					light_main<=Red;light_main_time<=Red_main_time;
				end
				Red:
				begin 
					light_main<=Green;light_main_time<=Green_main_time;
				end
				default:
				begin		
					light_main<=Green;light_main_time<=Green_main_time;
				end
			endcase
		else 
			light_main_time<=light_main_time-1;


		if (light_auxiliary_time==1'b1)
			case(light_auxiliary)
				Green : 
				begin
					light_auxiliary<=Yellow;light_auxiliary_time<=Yellow_auxiliary_time;
				end
				Yellow:
				begin 
					light_auxiliary<=Red;light_auxiliary_time<=Red_auxiliary_time;
				end
				Red:
				begin 
					light_auxiliary<=Green;light_auxiliary_time<=Green_auxiliary_time;
				end
				default:
				begin		
					light_auxiliary<=Green;light_auxiliary_time<=Green_auxiliary_time;
				end
			endcase
		else 
			light_auxiliary_time<=light_auxiliary_time-1;		
		end

endmodule
