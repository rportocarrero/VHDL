library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port ( clk : in  STD_LOGIC;
           opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           alu_op : out  STD_LOGIC_VECTOR (1 downto 0);
           wr_reg_file : out  STD_LOGIC;
           rd_reg_file_1 : out  STD_LOGIC_VECTOR (4 downto 0);
           rd_reg_file_2 : out  STD_LOGIC_VECTOR (4 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
  process(opcode)
  begin
    case opcode is
      when "000000" =>
        alu_op <= "00";
        wr_reg_file <= '0';
        rd_reg_file_1 <= "00000";
        rd_reg_file_2 <= "00000";
      when "000001" =>
        alu_op <= "10";
        wr_reg_file <= '1';
        rd_reg_file_1 <= "11111";
        rd_reg_file_2 <= "11111";
      when others =>
        alu_op <= "01";
        wr_reg_file <= '1';
        rd_reg_file_1 <= "11000";
        rd_reg_file_2 <= "11000";
    end case;
  end process;
end Behavioral;
