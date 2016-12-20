-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
-- Date        : Sat Oct 22 22:36:35 2016
-- Host        : DESKTOP-4G87URT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/magisterium/magisterium.srcs/sources_1/ip/mult_19_19/mult_19_19_stub.vhdl
-- Design      : mult_19_19
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mult_19_19 is
  Port ( 
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 18 downto 0 );
    B : in STD_LOGIC_VECTOR ( 18 downto 0 );
    P : out STD_LOGIC_VECTOR ( 37 downto 0 )
  );

end mult_19_19;

architecture stub of mult_19_19 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,A[18:0],B[18:0],P[37:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "mult_gen_v12_0_10,Vivado 2015.4";
begin
end;
