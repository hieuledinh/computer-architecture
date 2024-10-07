
module testtop;

reg 	clk;
reg 	i_nickle, i_dime, i_quarter;
reg	o_soda;
reg	[2:0] o_change;

vending_machine vm_inst(
	clk,
	i_nickle,
	i_dime,
	i_quarter,
	o_soda,
	o_change);

always begin #5 clk=~clk; end

initial begin
	clk = 0;
#5
    i_nickle = 0;
	//sum = 20
    i_dime = 0;
    i_quarter = 0;
#20;
	i_nickle = 1; #10;
    i_nickle = 0;#10;
    i_nickle =1; #10;
    i_nickle = 0;#10;
	i_dime = 1; #10;
    i_dime = 0; #10
#20;    
    i_dime = 1; #10;
    i_dime = 0;#10;
    i_dime = 1; #10;
    i_dime = 0;#10;
#20;
    //sum=25
	i_quarter = 1; #10;
    i_quarter = 0;#10;
#20;
    i_dime = 1; #10;
    i_dime = 0;#10;
    i_nickle =1; #10;
    i_nickle = 0;#10;
    i_dime = 1; #10;
    i_dime = 0;#10;
#20;
    i_nickle =1; #10;
    i_nickle = 0;#10;
    i_nickle =1; #10;
    i_nickle = 0;#10;
    i_nickle =1; #10;
    i_nickle = 0;#10;
    i_dime = 1; #10;
    i_dime = 0;#10;
 #20;   
    //sum=30
    i_nickle =1; #10;
    i_nickle = 0;#10;
    i_quarter = 1; #10;
    i_quarter = 0;#10;
#20;
    //sum=35
    i_dime = 1; #10;
    i_dime = 0;#10;
    i_quarter = 1; #10;
    i_quarter = 0;#10;
#20;
    //sum=40
    i_nickle =1; #10;
    i_nickle = 0;#10;
    i_dime = 1; #10;
    i_dime = 0;#10;
    i_quarter = 1; #10;
    i_quarter = 0;#10;

	$finish;	
end

always @(posedge clk) begin
	$display("At %t, state = %d, i_nickle = %b, i_dime = %b, i_quarter=%b",$time, vm_inst.state, i_nickle, i_dime,i_quarter);
	$display ("o_soda = %b, o_change = %b",o_soda, o_change);
end

endmodule
