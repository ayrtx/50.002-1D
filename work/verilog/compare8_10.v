/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare8_10 (
    input z,
    input v,
    input n,
    input [5:0] alufn,
    output reg [7:0] cmp
  );
  
  
  
  always @* begin
    cmp[0+7-:8] = 1'h0;
    
    case (alufn[1+2-:3])
      3'h1: begin
        cmp[0+0-:1] = z;
      end
      3'h2: begin
        cmp[0+0-:1] = n ^ v;
      end
      3'h3: begin
        cmp[0+0-:1] = z | (n ^ v);
      end
      3'h4: begin
        cmp[0+0-:1] = ~(z | (n ^ v));
      end
      3'h5: begin
        cmp[0+0-:1] = ~(n ^ v);
      end
    endcase
  end
endmodule
