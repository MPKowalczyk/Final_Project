-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
-- Date        : Fri Oct 28 01:33:34 2016
-- Host        : Zordon running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/OneDrive/mag/MSc_ZYBO/magisterium16/magisterium.srcs/sources_1/ip/mult_17_17/mult_17_17_stub.vhdl
-- Design      : mult_17_17
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mult_17_17 is
  Port ( 
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 16 downto 0 );
    B : in STD_LOGIC_VECTOR ( 16 downto 0 );
    P : out STD_LOGIC_VECTOR ( 33 downto 0 )
  );

end mult_17_17;

architecture stub of mult_17_17 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,A[16:0],B[16:0],P[33:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "mult_gen_v12_0_12,Vivado 2016.3";
begin
end;
