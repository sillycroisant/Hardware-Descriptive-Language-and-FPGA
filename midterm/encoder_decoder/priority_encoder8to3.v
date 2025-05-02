module priority_encoder8to3(
    input wire [7:0] in,
    output reg valid,
    output reg [2:0] out );

always@ * begin
    if (in == 8'b00000000) begin
        valid = 0;
        out = 3'bzzz;
    end else begin
        valid = 1;
            casez(in)
                8'b00000001: out = 3'b000;
                8'b0000001?: out = 3'b001;
                8'b000001??: out = 3'b010;
                8'b00001???: out = 3'b011;
                8'b0001????: out = 3'b100;
                8'b001?????: out = 3'b101;
                8'b01??????: out = 3'b110;
                8'b1???????: out = 3'b111;
            endcase
        end
    end
endmodule


