library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LoadStoreUnit is
    Port ( clk : in  STD_LOGIC;
           mem_addr : in  STD_LOGIC_VECTOR (31 downto 0);
           mem_rd : in  STD_LOGIC;
           mem_wr : in  STD_LOGIC;
           mem_data : in  STD_LOGIC_VECTOR (31 downto 0);
           reg_file_data : out  STD_LOGIC_VECTOR (31 downto 0));
end LoadStoreUnit;

architecture Behavioral of LoadStoreUnit is
  type memory_type is array (0 to 1023) of STD_LOGIC_VECTOR (31 downto 0);
  signal mem : memory_type := (others => (others => '0'));
begin
  process(clk)
  begin
    if (clk'event and clk = '1') then
      if (mem_wr = '1') then
        mem(to_integer(unsigned(mem_addr))) <= mem_data;
      elsif (mem_rd = '1') then
        reg_file_data <= mem(to_integer(unsigned(mem_addr)));
      end if;
    end if;
  end process;
end Behavioral;
