library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity interconnect is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           read_en : in  STD_LOGIC_VECTOR (3 downto 0);
           write_en : in  STD_LOGIC_VECTOR (3 downto 0);
           address : in  STD_LOGIC_VECTOR (3 downto 0);
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data : out  STD_LOGIC_VECTOR (31 downto 0));
end interconnect;

architecture Behavioral of interconnect is
    type mem_array is array (0 to 15) of std_logic_vector(31 downto 0);
    signal memory : mem_array := (others => (others => '0'));
begin

process (clk, rst)
begin
    if (rst = '1') then
        memory <= (others => (others => '0'));
    elsif (clk'event and clk = '1') then
        if (write_en = "0001") then
            memory(to_integer(unsigned(address))) <= write_data;
        end if;
    end if;
end process;

read_data <= memory(to_integer(unsigned(address)));

end Behavioral;
