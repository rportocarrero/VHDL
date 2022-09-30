library ieee;
use ieee.std_logic_1164.all;

entity ex_assignment is
end ex_assignment;

architecture behave of ex_assignment is
	signal r_TEST_SIGNAL : integer range 0 to 10 := 0;
	signal r_RESULT : integer range 0 to 10 := 0;
begin
	p_ASSIGN_RESULT : process(r_TEST_SIGNAL)
		variable v_TEST_VARIABLE : integer := 0;
	begin
		v_TEST_VARIABLE := r_TEST_SIGNAL + 1;

		if r_TEST_SIGNAL < 5 then
			r_RESULT <= r_TEST_SIGNAL;
			else
			r_RESULT <= v_TEST_VARIABLE;
		end if;
	end process;

	p_TEST_BENCH : process is
	begin
		r_TEST_SIGNAL <= 3;
		wait for 100 ns;
		report "Value of result = " & integer'image(r_RESULT) severity note;
		r_TEST_SIGNAL <= 7;
		wait for 100 ns;
		report "Value of Result = " & integer'image(r_RESULT) severity note;
		wait;
	end process;

end behave;