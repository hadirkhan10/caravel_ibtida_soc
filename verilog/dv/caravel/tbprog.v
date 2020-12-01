`timescale 1ns / 1ps

module tbprog #(
    parameter FILENAME="program.hex"
)(
    input mprj_ready,
    output reg r_Rx_Serial // used by task UART_WRITE_BYTE
);

reg r_Clock = 0;
parameter c_BIT_PERIOD = 8681; // used by task UART_WRITE_BYTE
parameter c_CLOCK_PERIOD_NS = 100;

reg [31:0] INSTR[(256*64)-1 : 0];
integer instr_count = 0;
reg ready;
reg test;
wire test2;

assign test2 = !test & !ready;

always @ ( posedge r_Clock ) begin
  if (mprj_ready) begin
    ready <= 1'b1;
  end else begin
    ready <= 1'b0;
  end
end

initial begin
    $readmemh(FILENAME,INSTR);
end

task UART_WRITE_BYTE;
    input [7:0] i_Data;
    integer     ii;
    begin
        // Send Start Bit
        r_Rx_Serial <= 1'b0;
        #(c_BIT_PERIOD);
        #1000;

        // Send Data Byte
        for (ii=0; ii<8; ii=ii+1) begin
            r_Rx_Serial <= i_Data[ii];
            #(c_BIT_PERIOD);
        end

        // Send Stop Bit
        r_Rx_Serial <= 1'b1;
        #(c_BIT_PERIOD);
     end
endtask // UART_WRITE_BYTE

initial begin
        test = 1'b0;
  #1000 test = 1'b1;
end

always
    #(c_CLOCK_PERIOD_NS/2) r_Clock <= !r_Clock;

initial begin
    r_Rx_Serial <= 1'b1;
    #2000;
    while (!ready && test) begin
      @(posedge r_Clock)
      r_Rx_Serial <= 1'b1;
    end
    while (instr_count<65) begin
        @(posedge r_Clock);
        UART_WRITE_BYTE(INSTR[instr_count][7:0]);
        @(posedge r_Clock);
        UART_WRITE_BYTE(INSTR[instr_count][15:8]);
        @(posedge r_Clock);
        UART_WRITE_BYTE(INSTR[instr_count][23:16]);
        @(posedge r_Clock);
        UART_WRITE_BYTE(INSTR[instr_count][31:24]);
        @(posedge r_Clock);
        instr_count = instr_count + 1'b1;
    end
    // @(posedge r_Clock);
    // UART_WRITE_BYTE(8'h00);
    // @(posedge r_Clock);
    // UART_WRITE_BYTE(8'h00);
    // @(posedge r_Clock);
    // UART_WRITE_BYTE(8'h0F);
    // @(posedge r_Clock);
    // UART_WRITE_BYTE(8'hFF);
     @(posedge r_Clock);
end

endmodule