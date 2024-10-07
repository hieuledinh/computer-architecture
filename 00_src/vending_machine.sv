module vending_machine(i_clk, i_nickle, i_dime, i_quarter, o_soda, o_change);
    input  i_clk, i_nickle, i_dime, i_quarter;
    output reg o_soda;
    output reg [2:0] o_change;

    reg [3:0] state, next_state  ; 
    always @(state or i_nickle or i_dime or i_quarter) begin
        next_state = 4'b0000;
        case (state)
            4'b0000: begin 
                if (i_nickle) next_state = 4'b0001;
                else if (i_dime) next_state = 4'b0010;
                else if (i_quarter) next_state = 4'b0101; 
                else next_state = 4'b0000;
            end
            4'b0001: begin 
                if (i_nickle) next_state = 4'b0010;
                else if (i_dime) next_state = 4'b0011;
                else if (i_quarter) next_state = 4'b0110; 
                else next_state = 4'b0001;
            end
            4'b0010: begin 
                if (i_nickle) next_state = 4'b0011;
                else if (i_dime) next_state = 4'b0100;
                else if (i_quarter) next_state = 4'b0111; 
                else next_state = 4'b0010;
            end
            4'b0011: begin 
                if (i_nickle) next_state = 4'b0100;
                else if (i_dime) next_state = 4'b0101;
                else if (i_quarter) next_state = 4'b1000; 
                else next_state = 4'b0011;
            end
            default: begin
                        next_state = 4'b0000;

            end
        endcase
    end

    always@(posedge i_clk) begin
        state <= next_state;
        case(state) 
            4'b0100: begin
                o_soda = 1;
                o_change = 3'b000;
            end
            
            4'b0101: begin
                o_soda = 1;
                o_change = 3'b001;
            end
            
            4'b0110: begin
                o_soda = 1;
                o_change = 3'b010;
            end

            4'b0111: begin
                o_soda = 1;
                o_change = 3'b011;
            end
            
            4'b1000: begin
                o_soda = 1;
                o_change = 3'b100;
            end
            default: begin
                o_soda = 0;
                o_change = 3'b000;
            end
        endcase 
    end 
endmodule 