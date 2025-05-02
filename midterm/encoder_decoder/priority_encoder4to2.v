// Code your design here
module priority_encoder4to2(
  input wire [3:0] in,
  output reg valid,
  output reg [1:0] out);
  
  always@* begin
    if (in == 4'b0000) begin
      valid = 0;
      out = 2'bzz;
    end else begin
      valid = 1;
      casez(in)
        4'b0001: out = 2'b00;
        4'b001?: out = 2'b01;
		4'b01??: out = 2'b10;
        4'b1???: out = 2'b11;
      endcase
    end
  end
endmodule

