library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vhdl_conversions is
end vhdl_conversions;

architecture vhdl_conv_arch of vhdl_conversions is
	signal input_1 : integer;
	signal output_1a : std_logic_vector(3 downto 0);
	signal output_1b : std_logic_vector(3 downto 0);

	signal input_2: integer;
	signal output_2 : unsigned(3 downto 0);

	signal input_3 : integer;
	signal output_3 : signed(3 downto 0);

	signal input_4 : std_logic_vector(3 downto 0);
	signal output_4a : integer;
	signal output_4b : integer;

	signal input_5 : std_logic_vector(3 downto 0);
	signal output_5 : unsigned(3 downto 0);

	signal input_6 : std_logic_vector(3 downto 0);
	signal output_6 : signed(3 downto 0);

	signal input_7 : unsigned(3 downto 0);
	signal output_7 : integer;

	signal input_8 : unsigned(3 downto 0);
	signal output_8 : std_logic_vector(3 downto 0);

	signal input_9 : unsigned(3 downto 0);
	signal output_9 : signed(3 downto 0);

	signal input_10 : signed(3 downto 0);
	signal output_10 : integer;

	signal input_11 : signed(3 downto 0);
	signal output_11 : std_logic_vector(3 downto 0);

	signal input_12 : signed(3 downto 0);
	signal output_12 : unsigned(3 downto 0);

	

begin

	-- integer to signed using numeric_std
	output_3 <= to_signed(input_3, output_3'length);

	-- integer to std_logic_vector using numeric_std
	-- convert positive integers
	output_1a <= std_logic_vector(to_unsigned(input_1, output_1a'length));
	-- convert positive or negative integers
	output_1b <= std_logic_vector(to_signed(input_1, output_1b'length));

	-- convert from integer to unsigned using numeric_std
	output_2 <= to_unsigned(input_2, output_2'length);

	-- convert from std_logic_vector to integer using numeric_std
	--unsigned case
	output_4a <= to_integer(unsigned(input_4));
	-- signed case
	output_4b <= to_integer(signed(input_4));

	--std_logic_vector to signed using numeric_std
	output_6 <= signed(input_6);

	--std_logic_vector to unsigned using numeric_std
	output_5 <= unsigned(input_5);

	-- signed to integer usin numeric_std
	output_10 <= to_integer(input_10);

	--signed to std_logic_vector using numeric_std
	output_11 <= std_logic_vector(input_11);

	--signed to unsigned using numeric_std
	output_12 <= unsigned(input_12);

	--unsigned to integer using numeric_std
	output_7 <=  to_integer(input_7);
	
	--unsigned to signed using numeric std
	output_9 <= signed(input_9);

	--unsigned to std_logic_vector using numeric_std
	output_8 <= std_logic_vector(input_8);
end vhdl_conv_arch;