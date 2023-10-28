library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           op : in  STD_LOGIC_VECTOR (2 downto 0);
           C : out STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is
begin
  process(A, B, op)
  begin
    case op is
      when "000" => C <= A + B;
      when "001" => C <= A - B;
      when "010" => C <= A and B;
      when "011" => C <= A or B;
      when "100" => C <= A xor B;
      when "101" => C <= A sll B;
      when "110" => C <= A srl B;
      when "111" => C <= A sla B;
      when others => C <= (others => '0');
    end case;
  end process;
end Behavioral;
