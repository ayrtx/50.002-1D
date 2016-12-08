/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg spi_miso,
    output reg [3:0] spi_channel,
    output reg avr_rx,
    input p1Ready,
    input p2Ready,
    input levelButton,
    input [3:0] p1ButtonInput,
    input [3:0] p2ButtonInput,
    output reg [6:0] segmentPins,
    output reg [3:0] digitPins,
    output reg [7:0] inputsToCircuit,
    output reg [2:0] levelLED
  );
  
  
  
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  wire [8-1:0] M_alu_out;
  reg [6-1:0] M_alu_alufn;
  reg [8-1:0] M_alu_a;
  reg [8-1:0] M_alu_b;
  alu_1 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n),
    .out(M_alu_out)
  );
  
  reg [0:0] initialCheck;
  
  reg rst;
  
  reg [255:0] pattern;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [8-1:0] M_matrixDisplay_inputsToCircuit;
  reg [256-1:0] M_matrixDisplay_ledArray;
  matrixDisplay_3 matrixDisplay (
    .clk(clk),
    .rst(rst),
    .ledArray(M_matrixDisplay_ledArray),
    .inputsToCircuit(M_matrixDisplay_inputsToCircuit)
  );
  wire [256-1:0] M_gameLogic_nextMap;
  wire [1-1:0] M_gameLogic_p1Lost;
  wire [1-1:0] M_gameLogic_p2Lost;
  wire [3-1:0] M_gameLogic_levelLED;
  reg [256-1:0] M_gameLogic_currentMap;
  reg [4-1:0] M_gameLogic_p1ButtonInput;
  reg [4-1:0] M_gameLogic_p2ButtonInput;
  reg [1-1:0] M_gameLogic_p1Ready;
  reg [1-1:0] M_gameLogic_p2Ready;
  reg [1-1:0] M_gameLogic_levelButton;
  gameLogic_4 gameLogic (
    .clk(clk),
    .rst(rst),
    .currentMap(M_gameLogic_currentMap),
    .p1ButtonInput(M_gameLogic_p1ButtonInput),
    .p2ButtonInput(M_gameLogic_p2ButtonInput),
    .p1Ready(M_gameLogic_p1Ready),
    .p2Ready(M_gameLogic_p2Ready),
    .levelButton(M_gameLogic_levelButton),
    .nextMap(M_gameLogic_nextMap),
    .p1Lost(M_gameLogic_p1Lost),
    .p2Lost(M_gameLogic_p2Lost),
    .levelLED(M_gameLogic_levelLED)
  );
  wire [4-1:0] M_numbersDisplayMain_digitPins;
  wire [7-1:0] M_numbersDisplayMain_segmentPins;
  reg [4-1:0] M_numbersDisplayMain_p1Score;
  reg [4-1:0] M_numbersDisplayMain_p2Score;
  numbersDisplayMain_5 numbersDisplayMain (
    .clk(clk),
    .rst(rst),
    .p1Score(M_numbersDisplayMain_p1Score),
    .p2Score(M_numbersDisplayMain_p2Score),
    .digitPins(M_numbersDisplayMain_digitPins),
    .segmentPins(M_numbersDisplayMain_segmentPins)
  );
  wire [4-1:0] M_scoreMem_p1Score;
  wire [4-1:0] M_scoreMem_p2Score;
  reg [1-1:0] M_scoreMem_p1Lost;
  reg [1-1:0] M_scoreMem_p2Lost;
  scoreMem_6 scoreMem (
    .clk(clk),
    .rst(rst),
    .p1Lost(M_scoreMem_p1Lost),
    .p2Lost(M_scoreMem_p2Lost),
    .p1Score(M_scoreMem_p1Score),
    .p2Score(M_scoreMem_p2Score)
  );
  reg [0:0] M_first_d, M_first_q = 1'h0;
  reg [255:0] M_patternNew_d, M_patternNew_q = 1'h0;
  
  always @* begin
    M_first_d = M_first_q;
    M_patternNew_d = M_patternNew_q;
    
    M_alu_a = M_first_q;
    M_alu_b = 8'h01;
    M_alu_alufn = 7'h68;
    initialCheck = M_alu_out[0+0-:1];
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    inputsToCircuit = 8'h00;
    pattern = 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    if (initialCheck == 1'h1) begin
      M_gameLogic_levelButton = levelButton;
      M_gameLogic_p1ButtonInput = 4'hf;
      M_gameLogic_p2ButtonInput = 4'hf;
      M_gameLogic_p1Ready = p1Ready;
      M_gameLogic_p2Ready = p2Ready;
      M_gameLogic_currentMap = pattern;
      M_patternNew_d = M_gameLogic_nextMap;
      levelLED = 3'h1;
      M_first_d = 1'h1;
    end else begin
      M_gameLogic_levelButton = levelButton;
      M_gameLogic_p1ButtonInput = p1ButtonInput;
      M_gameLogic_p2ButtonInput = p2ButtonInput;
      M_gameLogic_p1Ready = p1Ready;
      M_gameLogic_p2Ready = p2Ready;
      M_gameLogic_currentMap = M_patternNew_q;
      M_patternNew_d = M_gameLogic_nextMap;
      levelLED = M_gameLogic_levelLED;
    end
    M_scoreMem_p1Lost = M_gameLogic_p1Lost;
    M_scoreMem_p2Lost = M_gameLogic_p2Lost;
    M_matrixDisplay_ledArray = M_patternNew_q;
    inputsToCircuit = M_matrixDisplay_inputsToCircuit;
    M_numbersDisplayMain_p1Score = M_scoreMem_p1Score;
    M_numbersDisplayMain_p2Score = M_scoreMem_p2Score;
    segmentPins = M_numbersDisplayMain_segmentPins;
    digitPins = M_numbersDisplayMain_digitPins;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_first_q <= 1'h0;
      M_patternNew_q <= 1'h0;
    end else begin
      M_first_q <= M_first_d;
      M_patternNew_q <= M_patternNew_d;
    end
  end
  
endmodule
