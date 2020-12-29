/* 
 * PLL for FOMU board 
 * Did not manage to make it work with SB_PLL40_CORE, so using a divider 
 * Input frequency: 48 MHz 
 * Supported output frequencies: 48 MHz, 24 MHz, 12 MHz, 6 MHz, 3 MHz 
 */


module femtoPLL #(
 parameter freq = 60
) (
 input 	pclk,
 output clk	   
);

generate
  case(freq)
     48: begin
        assign clk = pclk;
     end
     24: begin
        reg cnt;
        always @(posedge pclk) begin
           cnt <= ~cnt;
        end
        assign clk = cnt;
     end
     12: begin
        reg [1:0] cnt;
        always @(posedge pclk) begin
           cnt <= cnt+1;
        end
        assign clk = cnt[1];
     end
     6: begin
        reg [2:0] cnt;
        always @(posedge pclk) begin
           cnt <= cnt+1;
        end
        assign clk = cnt[2];
     end
     3: begin
        reg [3:0] cnt;
        always @(posedge pclk) begin
           cnt <= cnt+1;
        end
        assign clk = cnt[3];
     end
  endcase 
endgenerate   
   
endmodule  