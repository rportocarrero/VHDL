library ieee;
use ieee.std_logic_1164.all;

entity ent is
port(
	Bit1, Bit2, Bit3, Bit4 : in std_logic);
end ent;

architecture arch of ent is
	type t_Memory is array (0 to 127) of std_logic_vector( 7 downto 0);
	signal r_Mem : t_Memory;

	type t_Integer_Array is array (integer range <>) of integer;

	type t_Data is array (0 to 3) of std_logic;
	signal r_Data : t_Data := (Bit1, Bit2, Bit3, Bit4);

	type t_Multiplier is array (0 to 2) of real;
	signal r_Multiplier : t_Multiplier := (0.25, 0.5, 0.75);

	type t_Five is array (0 to 4) of bit_vector(15 downto 0);
	signal r_Calc : t_Five := (others => (others => '0'));

	type t_Row_Col is array (0 to 3, 0 to 2) of integer range 0 to 9;
	signal r_Number : t_Row_Col;

	signal r_Choice : integer;

begin
	process
		variable r_Integers : t_Integer_Array(0 to 15);
	begin
	end process;

	r_Choice <= r_Number(0, 1);

	r_Number(3, 2) <= 9;
end arch;
