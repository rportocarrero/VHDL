library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterFile is
    Port ( clk : in  STD_LOGIC;
           rd_addr_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_addr_2 : in  STD_LOGIC_VECTOR (4 downto 0);
           wr_addr : in  STD_LOGIC_VECTOR (4 downto 0);
           wr_en : in  STD_LOGIC;
           wr_data : in  STD_LOGIC_VECTOR (31 downto 0);
           rd_data_1 : out  STD_LOGIC_VECTOR (31 downto 0);
           rd_data_2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
type reg_array is array (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
signal reg : reg_array;
begin
  process(clk)
  begin
    if (clk'event and clk = '1') then
      if (wr_en = '1') then
        reg(to_integer(unsigned(wr_addr))) <= wr_data;
      end if;
    end if;
  end process;
  rd_data_1 <= reg(to_integer(unsigned(rd_addr_1)));
  rd_data_2 <= reg(to_integer(unsigned(rd_addr_2)));
end Behavioral;
