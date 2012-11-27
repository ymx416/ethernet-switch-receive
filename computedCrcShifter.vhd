-- megafunction wizard: %Shift register (RAM-based)%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altshift_taps 

-- ============================================================
-- File Name: computedCrcShifter.vhd
-- Megafunction Name(s):
-- 			altshift_taps
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 9.1 Build 350 03/24/2010 SP 2 SJ Web Edition
-- ************************************************************


--Copyright (C) 1991-2010 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY computedCrcShifter IS
	PORT
	(
		aclr		: IN STD_LOGIC  := '1';
		clock		: IN STD_LOGIC ;
		shiftin		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		shiftout		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		taps0x		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		taps1x		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		taps2x		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		taps3x		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		taps4x		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		taps5x		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		taps6x		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		taps7x		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END computedCrcShifter;


ARCHITECTURE SYN OF computedcrcshifter IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (255 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (159 DOWNTO 128);
	SIGNAL sub_wire2	: STD_LOGIC_VECTOR (159 DOWNTO 128);
	SIGNAL sub_wire3	: STD_LOGIC_VECTOR (127 DOWNTO 96);
	SIGNAL sub_wire4	: STD_LOGIC_VECTOR (127 DOWNTO 96);
	SIGNAL sub_wire5	: STD_LOGIC_VECTOR (95 DOWNTO 64);
	SIGNAL sub_wire6	: STD_LOGIC_VECTOR (95 DOWNTO 64);
	SIGNAL sub_wire7	: STD_LOGIC_VECTOR (63 DOWNTO 32);
	SIGNAL sub_wire8	: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL sub_wire9	: STD_LOGIC_VECTOR (255 DOWNTO 224);
	SIGNAL sub_wire10	: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL sub_wire11	: STD_LOGIC_VECTOR (255 DOWNTO 224);
	SIGNAL sub_wire12	: STD_LOGIC_VECTOR (223 DOWNTO 192);
	SIGNAL sub_wire13	: STD_LOGIC_VECTOR (223 DOWNTO 192);
	SIGNAL sub_wire14	: STD_LOGIC_VECTOR (191 DOWNTO 160);



	COMPONENT altshift_taps
	GENERIC (
		lpm_hint		: STRING;
		lpm_type		: STRING;
		number_of_taps		: NATURAL;
		tap_distance		: NATURAL;
		width		: NATURAL
	);
	PORT (
			taps	: OUT STD_LOGIC_VECTOR (255 DOWNTO 0);
			aclr	: IN STD_LOGIC ;
			clock	: IN STD_LOGIC ;
			shiftout	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			shiftin	: IN STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	sub_wire14    <= sub_wire0(191 DOWNTO 160);
	sub_wire13    <= sub_wire0(223 DOWNTO 192);
	sub_wire12    <= sub_wire13(223 DOWNTO 192);
	sub_wire11    <= sub_wire0(255 DOWNTO 224);
	sub_wire9    <= sub_wire11(255 DOWNTO 224);
	sub_wire7    <= sub_wire0(63 DOWNTO 32);
	sub_wire8    <= sub_wire0(31 DOWNTO 0);
	sub_wire6    <= sub_wire0(95 DOWNTO 64);
	sub_wire5    <= sub_wire6(95 DOWNTO 64);
	sub_wire4    <= sub_wire0(127 DOWNTO 96);
	sub_wire3    <= sub_wire4(127 DOWNTO 96);
	sub_wire2    <= sub_wire0(159 DOWNTO 128);
	sub_wire1    <= sub_wire2(159 DOWNTO 128);
	taps4x    <= sub_wire1(159 DOWNTO 128);
	taps3x    <= sub_wire3(127 DOWNTO 96);
	taps2x    <= sub_wire5(95 DOWNTO 64);
	taps1x    <= sub_wire7(63 DOWNTO 32);
	taps0x    <= sub_wire8(31 DOWNTO 0);
	taps7x    <= sub_wire9(255 DOWNTO 224);
	shiftout    <= sub_wire10(31 DOWNTO 0);
	taps6x    <= sub_wire12(223 DOWNTO 192);
	taps5x    <= sub_wire14(191 DOWNTO 160);

	altshift_taps_component : altshift_taps
	GENERIC MAP (
		lpm_hint => "RAM_BLOCK_TYPE=M512",
		lpm_type => "altshift_taps",
		number_of_taps => 8,
		tap_distance => 8,
		width => 32
	)
	PORT MAP (
		aclr => aclr,
		clock => clock,
		shiftin => shiftin,
		taps => sub_wire0,
		shiftout => sub_wire10
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: ACLR NUMERIC "1"
-- Retrieval info: PRIVATE: CLKEN NUMERIC "0"
-- Retrieval info: PRIVATE: GROUP_TAPS NUMERIC "1"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
-- Retrieval info: PRIVATE: NUMBER_OF_TAPS NUMERIC "8"
-- Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: TAP_DISTANCE NUMERIC "8"
-- Retrieval info: PRIVATE: WIDTH NUMERIC "32"
-- Retrieval info: CONSTANT: LPM_HINT STRING "RAM_BLOCK_TYPE=M512"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "altshift_taps"
-- Retrieval info: CONSTANT: NUMBER_OF_TAPS NUMERIC "8"
-- Retrieval info: CONSTANT: TAP_DISTANCE NUMERIC "8"
-- Retrieval info: CONSTANT: WIDTH NUMERIC "32"
-- Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT VCC aclr
-- Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL clock
-- Retrieval info: USED_PORT: shiftin 0 0 32 0 INPUT NODEFVAL shiftin[31..0]
-- Retrieval info: USED_PORT: shiftout 0 0 32 0 OUTPUT NODEFVAL shiftout[31..0]
-- Retrieval info: USED_PORT: taps0x 0 0 32 0 OUTPUT NODEFVAL taps0x[31..0]
-- Retrieval info: USED_PORT: taps1x 0 0 32 0 OUTPUT NODEFVAL taps1x[31..0]
-- Retrieval info: USED_PORT: taps2x 0 0 32 0 OUTPUT NODEFVAL taps2x[31..0]
-- Retrieval info: USED_PORT: taps3x 0 0 32 0 OUTPUT NODEFVAL taps3x[31..0]
-- Retrieval info: USED_PORT: taps4x 0 0 32 0 OUTPUT NODEFVAL taps4x[31..0]
-- Retrieval info: USED_PORT: taps5x 0 0 32 0 OUTPUT NODEFVAL taps5x[31..0]
-- Retrieval info: USED_PORT: taps6x 0 0 32 0 OUTPUT NODEFVAL taps6x[31..0]
-- Retrieval info: USED_PORT: taps7x 0 0 32 0 OUTPUT NODEFVAL taps7x[31..0]
-- Retrieval info: CONNECT: @shiftin 0 0 32 0 shiftin 0 0 32 0
-- Retrieval info: CONNECT: shiftout 0 0 32 0 @shiftout 0 0 32 0
-- Retrieval info: CONNECT: taps0x 0 0 32 0 @taps 0 0 32 0
-- Retrieval info: CONNECT: taps1x 0 0 32 0 @taps 0 0 32 32
-- Retrieval info: CONNECT: taps2x 0 0 32 0 @taps 0 0 32 64
-- Retrieval info: CONNECT: taps3x 0 0 32 0 @taps 0 0 32 96
-- Retrieval info: CONNECT: taps4x 0 0 32 0 @taps 0 0 32 128
-- Retrieval info: CONNECT: taps5x 0 0 32 0 @taps 0 0 32 160
-- Retrieval info: CONNECT: taps6x 0 0 32 0 @taps 0 0 32 192
-- Retrieval info: CONNECT: taps7x 0 0 32 0 @taps 0 0 32 224
-- Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
-- Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: GEN_FILE: TYPE_NORMAL computedCrcShifter.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL computedCrcShifter.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL computedCrcShifter.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL computedCrcShifter.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL computedCrcShifter_inst.vhd FALSE
-- Retrieval info: LIB_FILE: altera_mf
