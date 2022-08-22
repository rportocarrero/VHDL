library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package processor_functions is
    type opcode is (load, store, add, op_not, op_and, op_or, op_xor, inc, sub, branch);
    function decode (word : std_logic_vector) return opcode;
    constant n : integer := 16;
    constant oplen : integer := 4;
    type memory_array is array( 0 to 2**(n-oplen-1)) of
        std_logic_vector(n-1 downto 0);
    constant reg_zero : unsigned(n-1 downto 0) := (others => '0');
end package processor_functions;

package body processor_functions is
    function decode (word: std_logic_vector) return opcode is
        variable opcode_out : opcode;
    begin
        case word(n-1 downto n-oplen-1) is
            when "0000" => opcode_out := load;
            when "0001" => opcode_out := store;
            when "0010" => opcode_out := add;
            when "0011" => opcode_out := op_not;
            when "0100" => opcode_out := op_and;
            when "0101" => opcode_out := op_or;
            when "0110" => opcode_out := op_xor;
            when "0111" => opcode_out := inc;
            when "1000" => opcode_out := sub;
            when "1001" => opcode_out := branch;
            when others => null;
        end case;
        return opcode_out;
    end function decode;
end package body processor_functions;
