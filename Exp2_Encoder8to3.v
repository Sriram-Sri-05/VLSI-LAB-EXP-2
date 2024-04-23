module encoder_8_to_3(a0,a1,a2,d0,d1,d2,d3,d4,d5,d6,d7);
input d0,d1,d2,d3,d4,d5,d6,d7;
output a0,a1,a2;
assign a0 = ( d1 | d3 | d5 | d7 );
assign a1 = ( d2 | d3 | d6 | d7 );
assign a2 = ( d4 | d6 | d5 | d7 );
endmodule
