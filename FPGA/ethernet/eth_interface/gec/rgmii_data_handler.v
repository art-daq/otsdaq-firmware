`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 08/18/2015 04:47:41 PM
// Designer Name: Rick Kwarciany
// 								
// For some reason, Vivado 2015.2 can not handle dual edge approach in VHDL
//  ... but can handle verilog implementation	
//											  
// This block 
//
// RGMII:
// 	* reduction is achieved by clocking data on both the rising and falling edges of the clock in 1000 Mbit/s operation
//  * The RX_CTL signal carries RXDV (data valid) on the rising edge, and (RXDV xor RXER) on the falling edge. 
//  * The TX_CTL signal likewise carries TXEN on rising edge and (TXEN xor TXER) on the falling edge.	
//
//////////////////////////////////////////////////////////////////////////////////


module rgmii_data_handler(
    input clk,			
    input rx_dv,
    input [3:0] rx_data,		 
    output reg rx_rgmii_er,
    output reg rx_rgmii_dv, 
    output reg [7:0] rx_rgmii_data 
    );

    reg [3:0] d_tmpreg_hi, d_tmpreg_lo;	 
	reg dv_tmpreg;
	reg er_tmpreg;

    always@ (posedge clk)
    begin
        rx_rgmii_data[3:0] <= d_tmpreg_lo;
		rx_rgmii_data[7:4] <= d_tmpreg_hi;
		rx_rgmii_er <= dv_tmpreg ^ er_tmpreg; 
		rx_rgmii_dv <= dv_tmpreg; 
    end
    
    always@ (posedge clk)
    begin
		d_tmpreg_lo <= rx_data;    
		dv_tmpreg <= rx_dv;
    end
    
    always@ (negedge clk)
    begin
		d_tmpreg_hi <= rx_data; 	 
		er_tmpreg <= rx_dv;
    end
    
endmodule


