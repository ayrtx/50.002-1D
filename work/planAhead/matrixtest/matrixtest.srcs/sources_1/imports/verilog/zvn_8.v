/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module zvn_8 (
    input [5:0] alufn,
    input [7:0] a,
    input [7:0] b,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg [7:0] sum;
  
  always @* begin
    sum = a - b;
    if (sum == 1'h0) begin
      z = 1'h1;
    end else begin
      z = 1'h0;
    end
    n = sum[7+0-:1];
    v = (a[7+0-:1] & (b[7+0-:1] ^ alufn[0+0-:1]) & ~sum[7+0-:1]) | (~a[7+0-:1] & ~(b[7+0-:1] ^ alufn[0+0-:1]) & sum[7+0-:1]);
  end
endmodule
