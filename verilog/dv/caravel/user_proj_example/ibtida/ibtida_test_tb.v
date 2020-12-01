`default_nettype none

`timescale 1 ns / 1 ps

`include "caravel.v"
`include "spiflash.v"
`include "tbprog.v"

module Ibtida_test_tb;
	reg clock;
    	reg RSTB;
	reg power1, power2;
	reg power3, power4;

	wire gpio;
  wire [37:0] mprj_io;

	// wire [7:0] mprj_io_0;
	wire mprj_ready;

	// assign mprj_io_0 = mprj_io[7:0];
	assign mprj_ready = mprj_io[37];

	// External clock is used by default.  Make this artificially fast for the
	// simulation.  Normally this would be a slow clock and the digital PLL
	// would be the fast clock.

	always #50 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	initial begin
		$dumpfile("Ibtida_test.vcd");
		$dumpvars(0, Ibtida_test_tb);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (300) begin
			repeat (1000) @(posedge clock);
			// $display("+1000 cycles");
		end
		$display("%c[1;31m",27);
		$display ("Monitor: Timeout, Test Mega-Project IO Ports (RTL) Failed");
		$display("%c[0m",27);
		$finish;
	end

	initial begin
	    // Observe Output pins [7:0]
	    wait(mprj_ready == 1'b1);
	   // wait(mprj_io_0 == 8'h06);
	    // wait(mprj_io_0 == 8'h03);
    	//     wait(mprj_io_0 == 8'h04);
	    // wait(mprj_io_0 == 8'h05);
      //       wait(mprj_io_0 == 8'h06);
	    // wait(mprj_io_0 == 8'h07);
      //       wait(mprj_io_0 == 8'h08);
	    // wait(mprj_io_0 == 8'h09);
      //       wait(mprj_io_0 == 8'h0A);
	    // wait(mprj_io_0 == 8'hFF);
	    // wait(mprj_io_0 == 8'h00);

	    $display("Monitor: Test 1 Mega-Project IO (RTL) Passed");
	    //$finish;
	end

	initial begin
		RSTB <= 1'b0;
		#2000;
		RSTB <= 1'b1;	    // Release reset
	end

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		power3 <= 1'b0;
		power4 <= 1'b0;
		#200;
		power1 <= 1'b1;
		#200;
		power2 <= 1'b1;
		#200;
		power3 <= 1'b1;
		#200;
		power4 <= 1'b1;
	end

	always @(mprj_io) begin
		#1 $display("MPRJ-IO state = %b ", mprj_io[7:0]);
	end

    	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;
	wire r_Rx_Serial;
	assign mprj_io[5] = r_Rx_Serial;



	wire VDD1V8;
    	wire VDD3V3;
	wire VSS;

	assign VDD3V3 = power1;
	assign VDD1V8 = power2;
	assign VSS = 1'b0;

	caravel uut (
		.vddio	  (VDD3V3),
		.vssio	  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (VDD3V3),
		.vdda2    (VDD3V3),
		.vssa1	  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (VDD1V8),
		.vccd2	  (VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
		.clock	  (clock),
		.gpio     (gpio),
        	.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("ibtida_test.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

	tbprog #(
		.FILENAME("/home/merl/Desktop/program.hex")
	) prog_uut (
		.mprj_ready (mprj_ready),
		.r_Rx_Serial (r_Rx_Serial)
	);

endmodule
`default_nettype wire
