LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY inputProcessor IS
	PORT (	aclr			:	IN STD_LOGIC;
			clk25			:	IN STD_LOGIC;
			clk50			:	IN STD_LOGIC;
			data_in			:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			data_in_valid	: 	IN STD_LOGIC;
			data_out		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			data_out_valid:	out std_logic;
			crc				:	OUT STD_LOGIC;
			frame_length	:	OUT STD_LOGIC_VECTOR(11 DOWNTO 0)); -- Max frame size is 1542 bytes
END inputProcessor;

ARCHITECTURE subsystem_level_design OF inputProcessor IS

SIGNAL signal_frame_start	:	STD_LOGIC; -- Output of SFD module, HIGH once SFD is detected
SIGNAL signal_hold_count	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL signal_receiving		:	STD_LOGIC;
SIGNAL signal_reset			:	STD_LOGIC;
SIGNAL signal_hold			:	STD_LOGIC;
SIGNAL signal_data_out		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL signal_readbuffer	:	STD_LOGIC;

	COMPONENT inputProcessor_stateController IS
		PORT (	aclr		:	IN STD_LOGIC;
				clk			:	IN STD_LOGIC;
				frame_start	:	IN STD_LOGIC; -- Output of SFD module, HIGH once SFD is detected
				frame_end	:	IN STD_LOGIC; -- Input from data_in_valid
				hold_count	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				receiving	:	OUT STD_LOGIC; -- HIGH if currently in receiving state; will act as enable signal for other modules
				reset		:	OUT STD_LOGIC; -- HIGH if transitioned into IDLE state; resets all components for next frame
				hold		:	OUT STD_LOGIC); -- HIGH if transitioned into HOLD state; must remain in state until hold_count = 12
	END COMPONENT;

	COMPONENT sfdChecker IS
		PORT (	aclr		:	IN STD_LOGIC;
				clk			:	IN STD_LOGIC;
				data_in		:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				frame_start	:	OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT frameBuffer
		PORT (
			aclr			:IN		STD_LOGIC;
			clk25			:IN		STD_LOGIC;
			clk50			:IN		STD_LOGIC;
			read_enable		:IN		STD_LOGIC;
			write_enable	:IN		STD_LOGIC;
			data_in			:IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			data_out		:OUT 	STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT crcChecker IS
		PORT (	aclr		:	IN STD_LOGIC;
				clk			:	IN STD_LOGIC;
				data_in		:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				crc			:	OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT frameCounter IS
		PORT (	aclr		:	IN STD_LOGIC;
				clk			:	IN STD_LOGIC;
				enable		:	IN STD_LOGIC;
				count		:	OUT STD_LOGIC_VECTOR(11 DOWNTO 0));
	END COMPONENT;

	COMPONENT holdCounter IS
		PORT (	aclr		:	IN STD_LOGIC;
				clk			:	IN STD_LOGIC;
				enable		:	IN STD_LOGIC;
				count		:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	END COMPONENT;

BEGIN

	Stage1: inputProcessor_stateController PORT MAP (aclr, clk50, signal_frame_start, data_in_valid,
			signal_hold_count, signal_receiving, signal_reset, signal_hold);
	Stage2: sfdChecker PORT MAP (aclr OR signal_reset, clk25, data_in, signal_frame_start);
	Stage3: frameBuffer PORT MAP (aclr OR signal_reset, clk25, clk50, signal_readbuffer, signal_receiving, data_in, signal_data_out);
	Stage4: crcChecker PORT MAP (aclr OR signal_reset, clk50, signal_data_out, crc);
	Stage5: frameCounter PORT MAP (aclr OR signal_reset, clk50, signal_receiving, frame_length);
	Stage6: holdCounter PORT MAP (aclr OR signal_reset, clk50, signal_hold, signal_hold_count);
	Stage7: data_out <= signal_data_out;

END subsystem_level_design;